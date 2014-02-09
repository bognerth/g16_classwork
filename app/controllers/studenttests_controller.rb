class StudenttestsController < ApplicationController
  # GET /studenttests
  # GET /studenttests.json
  def index
    @studenttests = Studenttest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @studenttests }
    end
  end

  # GET /studenttests/1
  # GET /studenttests/1.json
  def show
    @studenttest = Studenttest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @studenttest }
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
