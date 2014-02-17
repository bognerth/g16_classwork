class StudentanswersController < ApplicationController

  def index
    @studentanswers = Studentanswer.where(:studenttest_id => params[:studenttest_id], :question_id => params[:question_id])
    if @studentanswers.blank?
      Studentanswer.generate_studentanswers(params[:studenttest_id])
    end
    @studentanswers = Studentanswer.where(:studenttest_id => params[:studenttest_id], :question_id => params[:question_id])
    respond_to do |format|
      format.js
    end
  end
  
  def multiple_choice
    @error = nil
    if params[:studentanswer] && params[:studentanswer].count == 1
      studentanswer = Studentanswer.find(params[:studentanswer][0])
      Studentanswer.where(:studenttest_id => studentanswer.studenttest_id, :question_id => studentanswer.question_id).each do |sa|
        sa.update_attributes(:selected => false, :points => 0)
      end
      points = studentanswer.answer.points == 0 ? 0 : studentanswer.question.points
      studentanswer.update_attributes(:selected => true, :points => points)
    else
      @error = "Es muss mindestens eine Antwort, aber es darf auch nur eine Antwort angeklickt sein."
    end
    respond_to do |format|
      format.js
    end
  end

  def show
    @studentanswer = Studentanswer.where(:studenttest_id => params[:studenttest_id], :question_id => params[:question_id]).first || Studentanswer.new

    respond_to do |format|
      format.js
    end
  end

  # GET /studentanswers/new
  # GET /studentanswers/new.json
  def new
    @studentanswer = Studentanswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @studentanswer }
    end
  end

  # GET /studentanswers/1/edit
  def edit
    @studentanswer = Studentanswer.where(:studenttest_id => params[:studenttest_id], :question_id => params[:question_id]).first || Studentanswer.create(:studenttest_id => params[:studenttest_id], :question_id => params[:question_id], :points => 0)

  end

  # POST /studentanswers
  # POST /studentanswers.json
  def create
    @studentanswer = Studentanswer.new(params[:studentanswer])

    respond_to do |format|
      if @studentanswer.save
        format.html { redirect_to @studentanswer, notice: 'Studentanswer was successfully created.' }
        format.json { render json: @studentanswer, status: :created, location: @studentanswer }
      else
        format.html { render action: "new" }
        format.json { render json: @studentanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /studentanswers/1
  # PUT /studentanswers/1.json
  def update
    @studentanswer = Studentanswer.find(params[:id])

    respond_to do |format|
      if @studentanswer.update_attributes(params[:studentanswer])
        format.html { redirect_to @studentanswer, notice: 'Studentanswer was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
        format.js { render json: @studentanswer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studentanswers/1
  # DELETE /studentanswers/1.json
  def destroy
    @studentanswer = Studentanswer.find(params[:id])
    @studentanswer.destroy

    respond_to do |format|
      format.html { redirect_to studentanswers_url }
      format.json { head :no_content }
    end
  end
end
