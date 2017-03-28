class RequestsController < ApplicationController
	before_action :find_patient
	before_action :find_request, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def new
		@request = Request.new
		@clinics = Clinic.all.map{ |c| [c.name, c.id]}	
	end

	def create
		@request = Request.new(request_params)
		@request.patient_id = @patient.id
		@request.user_id = current_user.id

		if @request.save
			redirect_to patient_path(@patient)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
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
			params.require(:request).permit(:hospital, :department, :comment, :appointment)
		end

		def find_patient
			@patient = Patient.find(params[:patient_id])
		end

		def find_request
			@request = Request.find(params[:id])
		end

end
