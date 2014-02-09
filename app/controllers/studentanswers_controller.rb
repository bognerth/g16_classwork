class StudentanswersController < ApplicationController
  # GET /studentanswers
  # GET /studentanswers.json
  def index
    @studentanswers = Studentanswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @studentanswers }
    end
  end

  # GET /studentanswers/1
  # GET /studentanswers/1.json
  def show
    @studentanswer = Studentanswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @studentanswer }
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
    @studentanswer = Studentanswer.find(params[:id])
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
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @studentanswer.errors, status: :unprocessable_entity }
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
