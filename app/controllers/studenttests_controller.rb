class StudenttestsController < ApplicationController
  def state
    test = Studenttest.find(params[:id])
    test.change(params[:state])
    @classtests = Studenttest.all
    respond_to do |format|
      format.html {redirect_to studenttests_url}
      format.json { render json: @classtests }
    end    
  end

  def finish
    @studenttest = Studenttest.find(params[:id])
    @studenttest.change("closed")
    @studenttest.update_attributes(:end => DateTime.now, :points => @studenttest.sum_points)
    valuation = Valuation.find(:all, :params => {:classtest_id => 6})
    Studentvaluation.create(:points => @studenttest.points, :studenttest_id => @studenttest.id, :student_id => @studenttest.student_id, :valuation_id => valuation[0].id, )
    redirect_to studenttests_url, :notice => "Sie haben den Test absolviert. Wenn sich der Status auf 'shipped' aendert, koennen Sie das Ergebnis sehen."
  end

  def result
    #Ausgabe in pdf 
  end

  def index
    if $redis.hget(@current_user.login.to_sym, :classwork_lecture).blank?
      @studenttests = nil
    else
      @classtests = Classtest.where(:lecture_id => eval($redis.hget(@current_user.login.to_sym, :classwork_lecture))['id'])
      classtest_ids = @classtests.map {|t| t.id}
      student_id = eval($redis.hget(:current_user, current_user.login.to_sym))["student_id"]
      @title = eval($redis.hget(current_user.login.to_sym, :classwork_lecture))['title']
      @studenttests = Studenttest.where(:student_id => student_id, :classtest_id => classtest_ids)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @studenttests }
    end
  end

  def show
    @studenttest = Studenttest.find(params[:id])
    if @studenttest.current_state == 'closed' || @studenttest.current_state == 'shipped'
      redirect_to studenttests_url, :notice => "Der Status des angeforderten Tests laesst keine Bearbeitung zu."
    else
      if @studenttest.current_state == 'new'
        @studenttest.change("started")
        @studenttest.update_attributes(:start => DateTime.now, :end => nil, :points => 0)
        Studentanswer.where(:studenttest_id => @studenttest.id).each do |sa|
          sa.update_attributes(:selected => false, :points => 0)
        end
      end
      #@lecture = Lecture.find(@studenttest.lecture_id)
      @questions = @studenttest.classtest.testtype.questions
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @studenttest }
      end
    end
  end

  # GET /studenttests/new
  # GET /studenttests/new.json
  def new
    @studenttest = Studenttest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @studenttest }
    end
  end

  # GET /studenttests/1/edit
  def edit
    @studenttest = Studenttest.find(params[:id])
  end

  # POST /studenttests
  # POST /studenttests.json
  def create
    @studenttest = Studenttest.new(params[:studenttest])

    respond_to do |format|
      if @studenttest.save
        format.html { redirect_to @studenttest, notice: 'Studenttest was successfully created.' }
        format.json { render json: @studenttest, status: :created, location: @studenttest }
      else
        format.html { render action: "new" }
        format.json { render json: @studenttest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /studenttests/1
  # PUT /studenttests/1.json
  def update
    @studenttest = Studenttest.find(params[:id])

    respond_to do |format|
      if @studenttest.update_attributes(params[:studenttest])
        format.html { redirect_to @studenttest, notice: 'Studenttest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @studenttest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studenttests/1
  # DELETE /studenttests/1.json
  def destroy
    @studenttest = Studenttest.find(params[:id])
    @studenttest.destroy

    respond_to do |format|
      format.html { redirect_to studenttests_url }
      format.json { head :no_content }
    end
  end
end
