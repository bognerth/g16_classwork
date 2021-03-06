class ClasstestsController < ApplicationController

  def students
    @classtest = Classtest.find(params[:id])
    @studenttests = Studenttest.where(:classtest_id => @classtest.id)
    @student_without_test = @classtest.search_for_missing_studenttests
    respond_to do |format|
      format.html
      format.json { render json: @classtests }
    end
  end

  def valuate_results
    @studenttests = Studenttest.where(classtest_id: params[:classtest_id])
    @classtest = Classtest.find(params[:id])
    @questions = @classtest.testtype.questions.order(:id)
  end

  def valuate_single_question
    @classtest_id = params[:id]
    @question = Question.find(params[:question_id])
    @studenttests = Studenttest.where(classtest_id: params[:id])
    @studentanswers = {}
    @studenttests.each do |studenttest|
      @studentanswers[studenttest.student_id] = Studentanswer.where(question_id: params[:question_id], studenttest_id: studenttest.id).first || Studentanswer.create(question_id: params[:question_id], studenttest_id: studenttest.id) 
    end
  end

  def addstudents
    classtest = Classtest.find(params[:id])
    student_without_test = classtest.search_for_missing_studenttests
    student_without_test.each do |student_id|
      studenttest = Studenttest.create(:classtest_id => classtest.id, :student_id => student_id.to_s) 
      Studentanswer.generate_studentanswers(studenttest.id)
    end
    redirect_to students_classtest_url(classtest.id)
  end

  def state
    test = Classtest.find(params[:id])
    test.change(params[:state])
    @classtests = Classtest.all
    respond_to do |format|
      format.html {redirect_to classtests_url}
      format.json { render json: @classtests }
    end    
  end

  def index
    if request.format == "application/json" || @current_user.admin?
      @classtests = Classtest.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @classtests }
      end
    else
      #http://localhost:3001/studenttests?lecture=KuA_Fit3h
      redirect_to studenttests_url(:lecture => params[:lecture])
    end

  end

  def show
    @classtest = Classtest.find(params[:id])
    @lecture = Lecture.find(@classtest.lecture_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @classtest }
    end
  end

  # GET /tests/new
  # GET /tests/new.json
  def new
    @classtest = Classtest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @classtest }
    end
  end

  # GET /tests/1/edit
  def edit
    @classtest = Classtest.find(params[:id])
  end

  # POST /tests
  # POST /tests.json
  def create
    @classtest = Classtest.new(params[:classtest])

    respond_to do |format|
      if @classtest.save
        #UPDATE fuer Hauptseite VALUATIONS
        Valuation.create(:title => @classtest.title, :lecture_id => @classtest.lecture_id, :classtest_id => @classtest.id, :mark_type => 'Klausur')
        format.html { redirect_to @classtest, notice: 'Classtest was successfully created.' }
        format.json { render json: @classtest, status: :created, location: @classtest }
      else
        format.html { render action: "new" }
        format.json { render json: @classtest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tests/1
  # PUT /tests/1.json
  def update
    @classtest = Classtest.find(params[:id])

    respond_to do |format|
      if @classtest.update_attributes(params[:classtest])
        format.html { redirect_to @classtest, notice: 'Classtest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @classtest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @classtest = Classtest.find(params[:id])
    @classtest.destroy

    respond_to do |format|
      format.html { redirect_to classtests_url }
      format.json { head :no_content }
    end
  end
end
