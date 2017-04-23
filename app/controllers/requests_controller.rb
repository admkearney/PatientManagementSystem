class RequestsController < ApplicationController
	before_action :find_patient
	before_action :find_request, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]


	def index
		if params[:clinic].blank?
			@requests = Request.all
		else
			@clinic_id = Clinic.find_by(name: params[:clinic]).id
			@requests = Request.where(:clinic_id => @clinic_id).order("appointment DESC")
		end
	
	end

	def new
		@request = Request.new
		@clinics = Clinic.all.map{ |c| [c.name, c.id]}	
	end

	def show
	end

	def create
		@request = Request.new(request_params)
		@request.patient_id = @patient.id
		@request.user_id = current_user.id
		@request.clinic_id = params[:clinic_id]

		if @request.save
			redirect_to patient_path(@patient)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		@clinics = Clinic.all.map{ |c| [c.name, c.id]}
		@request = Request.find(params[:id])

		if @request.update(request_params)
			redirect_to patient_path(@patient)
		else
			render 'edit'
		end
	end

	def destroy
		@request.destroy
		redirect_to patient_path(@patient)
	end

	private

		def request_params
			params.require(:request).permit(:hospital, :department, :comment, :appointment, :clinic_id)
		end

		def find_patient
			@patient = Patient.find(params[:patient_id])
		end

		def find_request
			@request = Request.find(params[:id])
		end

end
