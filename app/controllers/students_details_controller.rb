class StudentsDetailsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_students_detail, only: %i[ show edit update destroy ]

  # GET /students_details or /students_details.json
  def index
    @students_details = StudentsDetail.all

    render json: StudentsDetailsSerializer.new(@students_details).serialized_json
  end

  # GET /students_details/1 or /students_details/1.json
  def show
  end

  # GET /students_details/new
  def new
    @students_detail = StudentsDetail.new
  end

  # GET /students_details/1/edit
  def edit
  end

  # POST /students_details or /students_details.json
  def create
    @students_detail = StudentsDetail.new(students_detail_params)

      if @students_detail.save
        # format.html { redirect_to @students_detail, notice: "Students detail was successfully created." }
        # format.json { render :show, status: :created, location: @students_detail }
        render json: StudentsDetailsSerializer.new(@students_detail).serialized_json
      else
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @students_detail.errors, status: :unprocessable_entity }
        render json: {error: airline.errors.messages},status: 422
      end
  end

  # PATCH/PUT /students_details/1 or /students_details/1.json
  def update
    # respond_to do |format|
      if @students_detail.update(students_detail_params)
        # format.html { redirect_to @students_detail, notice: "Students detail was successfully updated." }
        # format.json { render :show, status: :ok, location: @students_detail }
        render json: StudentsDetailsSerializer.new(@students_detail).serialized_json
      else
        # format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @students_detail.errors, status: :unprocessable_entity }
        render json: {error: airline.errors.messages},status: 422
      end
    # end
  end

  # DELETE /students_details/1 or /students_details/1.json
  def destroy
    @students_detail.destroy
    # respond_to do |format|
    if @students_detail.destroy
      head :no_content
    else
      render json: {error: airline.errors.messages},status: 422
    end
  end
      # format.html { redirect_to students_details_url, notice: "Students detail was successfully destroyed." }
      # format.json { head :no_content }
    # end

  def sort
    students_details = StudentsDetail.all

    @type = params[:type]
      # render json: StudentsDetailsSerializer.new(StudentsDetail.second).serialized_json
      # if params[:order] =="asc"
        render json: StudentsDetailsSerializer.new(students_details.order(@type)).serialized_json
      # else
        # render json: StudentsDetailsSerializer.new(students_details.order(params[:type] 'desc')).serialized_json
      # end
    # render json: params[:type]
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_students_detail
      @students_detail = StudentsDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def students_detail_params
      params.require(:students_detail).permit(:name, :age, :gender)
    end
end
