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

  def get_for_valuation
    @studenttest = Studenttest.where(:classtest_id => params[:params][:classtest_id], :student_id => params[:params][:student_id]).first
    respond_to do |format|
      format.json { render json: @studenttest }
    end
  end

  def finish
    @studenttest = Studenttest.find(params[:id])
    @studenttest.change("closed")
    @studenttest.update_attributes(:end => DateTime.now, :points => @studenttest.sum_points)
    valuation = Valuation.find(:all, :params => {:classtest_id => 6})
    sv = Studentvaluation.new(:points => @studenttest.points, :studenttest_id => @studenttest.id, :student_id => @studenttest.student_id, :valuation_id => valuation[0]["id"] )
    sv.save
    redirect_to studenttests_url, :notice => "Sie haben den Test absolviert. Wenn sich der Status auf 'shipped' aendert, koennen Sie das Ergebnis sehen."
  end
  def result_details
    @studenttest = Studenttest.find(params[:id])
    @studentanswers = Studentanswer.where(studenttest_id: params[:id])
  end
  def results_for_teacher
    @studenttests = Studenttest.where(classtest_id: params[:classtest_id])
  end

  def result
    @studenttest = Studenttest.find(params[:id])
    @studenttest.change("shipped")
    @questions = @studenttest.classtest.testtype.questions
    respond_to do |format|
      format.pdf do
        pdf = StudenttestPdf.new(@studenttest)
        send_data pdf.render, filename: "Testergebnis-#{current_user.login}-#{@studenttest.classtest.title}",
                            type: "application/pdf",
                            disposition: "inline"
      end
      format.html 
    end
  end

  def download
    @studenttest = Studenttest.find(params[:id])
    #raise @page.file.to_yaml
    send_file(@studenttest.result_file.path,
        :filename => File.basename(@studenttest.result_file.path),
        :disposition => 'attachment',
        :url_based_filename => true)
  end

  def index
    #if $redis.hget(@current_user.login.to_sym, :classwork_lecture).blank?
    #  @studenttests = nil
    @lecture = Lecture.find(params[:lecture])
    @classtests = Classtest.where(:lecture_id => @lecture.id)
    if @classtests
      classtest_ids = @classtests.map {|t| t.id}
      student_id = eval($redis.hget(:current_user, current_user.login.to_sym))["student_id"]
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
      end
      if @studenttest.classtest.category == "Upload"
        render "upload"
      else
        Studentanswer.where(:studenttest_id => @studenttest.id).each do |sa|
          sa.update_attributes(:selected => false, :points => 0)
        end
        @questions = @studenttest.classtest.testtype.questions
        render "show"
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

  def edit
    @studenttest = Studenttest.find(params[:id])
  end

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

  def update
    @studenttest = Studenttest.find(params[:id])
    params[:studenttest][:end] = DateTime.now
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

  def destroy
    @studenttest = Studenttest.find(params[:id])
    @studenttest.destroy

    respond_to do |format|
      format.html { redirect_to studenttests_url }
      format.json { head :no_content }
    end
  end
end
