class TesttypesController < ApplicationController
  # GET /testtypes
  # GET /testtypes.json
  def index
    @testtypes = Testtype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @testtypes }
    end
  end

  # GET /testtypes/1
  # GET /testtypes/1.json
  def show
    @testtype = Testtype.find(params[:id])
    @questions = Question.where(:testtype_id => @testtype.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @testtype }
    end
  end

  # GET /testtypes/new
  # GET /testtypes/new.json
  def new
    @testtype = Testtype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @testtype }
    end
  end

  # GET /testtypes/1/edit
  def edit
    @testtype = Testtype.find(params[:id])
  end

  # POST /testtypes
  # POST /testtypes.json
  def create
    @testtype = Testtype.new(params[:testtype])

    respond_to do |format|
      if @testtype.save
        format.html { redirect_to @testtype, notice: 'Testtype was successfully created.' }
        format.json { render json: @testtype, status: :created, location: @testtype }
      else
        format.html { render action: "new" }
        format.json { render json: @testtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /testtypes/1
  # PUT /testtypes/1.json
  def update
    @testtype = Testtype.find(params[:id])

    respond_to do |format|
      if @testtype.update_attributes(params[:testtype])
        format.html { redirect_to @testtype, notice: 'Testtype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @testtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testtypes/1
  # DELETE /testtypes/1.json
  def destroy
    @testtype = Testtype.find(params[:id])
    @testtype.destroy

    respond_to do |format|
      format.html { redirect_to testtypes_url }
      format.json { head :no_content }
    end
  end
end
