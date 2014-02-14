class ClasstestsController < ApplicationController

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
    if @current_user.admin?
      @classtests = Classtest.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @classtests }
      end
    else
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
