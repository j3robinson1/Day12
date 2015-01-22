class PatientsController < ApplicationController
  def new
    @patient = Patient.new
  end
  def create
    @patient = Patient.create patient_params
    if @patient.save
      flash[:notice] = 'Patient was successfully saved'
      redirect_to root_path
    else
      flash[:error] = "Patient could not be saved because you have to be older then 10"
      render :new
    end
  end
  def show
    @patient = Patient.find params[:id]
  end
  def edit
    @patient = Patient.find params[:id]
  end
  def update
    @patient = Patient.find params[:id]
    @patient.update_attributes patient_params
    redirect_to root_path
  end
  def destroy
    @patient = Patient.find params[:id]
    @patient.delete
    redirect_to root_path
  end

private
  def patient_params
    params.require(:patient).permit(:firstname, :lastname, :dob, :symptoms, :gender, :bloodtype)
  end
end
