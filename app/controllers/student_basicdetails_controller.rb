class StudentBasicdetailsController < ApplicationController
  before_action :set_student_basicdetail, only: %i[ show edit update destroy ]

  # GET /student_basicdetails or /student_basicdetails.json
  def index
    @student_basicdetails = StudentBasicdetail.all
  end

  # GET /student_basicdetails/1 or /student_basicdetails/1.json
  def show
  end

  # GET /student_basicdetails/new
  def new
    @student_basicdetail = StudentBasicdetail.new
  end

  # GET /student_basicdetails/1/edit
  def edit
  end

  # POST /student_basicdetails or /student_basicdetails.json
  def create
    @student_basicdetail = StudentBasicdetail.new(student_basicdetail_params)

    respond_to do |format|
      if @student_basicdetail.save
        format.html { redirect_to @student_basicdetail, notice: "Student basicdetail was successfully created." }
        format.json { render :show, status: :created, location: @student_basicdetail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_basicdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_basicdetails/1 or /student_basicdetails/1.json
  def update
    respond_to do |format|
      if @student_basicdetail.update(student_basicdetail_params)
        format.html { redirect_to @student_basicdetail, notice: "Student basicdetail was successfully updated." }
        format.json { render :show, status: :ok, location: @student_basicdetail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_basicdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_basicdetails/1 or /student_basicdetails/1.json
  def destroy
    @student_basicdetail.destroy
    respond_to do |format|
      format.html { redirect_to student_basicdetails_url, notice: "Student basicdetail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_basicdetail
      @student_basicdetail = StudentBasicdetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_basicdetail_params
      params.fetch(:student_basicdetail, {})
    end
end
