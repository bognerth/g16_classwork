class QuestionsController < ApplicationController

  def clone 
    question_hash = {}
    q = Question.find(params[:id])
    Question.accessible_attributes.each do |att|
      question_hash[att] = q[att.to_sym] unless att.empty?
    end
    @question = Question.new(question_hash)
    render 'new'
  end

  def lostandfound
    q = Question.find(params[:id])
    @question_id = q.id
    q.testtype_id = Testtype.where(:coursetype => 'LostAndFound').first.id
    q.save
    render "destroy"
  end

  def index
    @questions = Question.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new(:testtype_id => params[:testtype_id], :category => 'Multiplechoice')

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        @sum_points = Question.where(:testtype_id => @question.testtype_id).sum(:points)
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.js { render json: @question.errors, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question_id = @question.id
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.js
    end
  end
end
