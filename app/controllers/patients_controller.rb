class PatientsController < ApplicationController
	before_action :find_patient, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]


	def index
		if params[:clinic].blank?
			@patients = Patient.all.order("created_at DESC").where(["name LIKE ?","%#{params[:search]}%"])
		else
			@clinic_id = Clinic.find_by(name: params[:clinic]).id
			@patients = Patient.where(:clinic_id => @clinic_id).order("created_at DESC")
		end
	end

	def show
	end

	def new
		#create the patient from the current user
		@patient = current_user.patients.build
		@clinics = Clinic.all.map{ |c| [c.name, c.id]}
	end

	def create
		@patient = current_user.patients.build(patient_params)
		@patient.clinic_id = params[:clinic_id]

		if @patient.save
			redirect_to root_path
		else
			render 'new'
		end	
	end

	def edit
		@clinics = Clinic.all.map{ |c| [c.name, c.id]}
	end

	def update
		@clinics = Clinic.all.map{ |c| [c.name, c.id]}
		if @patient.update(patient_params)
			redirect_to patient_path(@patient)
		else
			render 'edit'
		end
	end

	def destroy
		@patient.destroy
		redirect_to root_path
	end

	private

		def patient_params
			#define the patient information
			params.require(:patient).permit(:name, :dob, :address, :phone, :clinic_id)
		end

		def find_patient
			@patient = Patient.find(params[:id])
		end
end
