class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    if current_user.admin
      if params[:patient_id]
        @appointments = Patient.find(params[:patient_id]).appointments
      else
        @appointments = Doctor.find(params[:doctor_id]).appointments
      end
    else
      @appointments = current_user.person.appointments
    end  
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @appointment.patient = Patient.find(params[:patient_id]);
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.patient = current_user.person
    
    if @appointment.total_hours && @appointment.doctor.hourly_rate
      ammount = @appointment.total_hours * @appointment.doctor.hourly_rate.round*100
    else
      ammount = 0
    end
    
    token = params[:stripeToken]
    card_brand = params[:user][:card_brand]
    card_exp_month = params[:user][:card_exp_month]
    card_exp_year = params[:user][:card_exp_year]
    card_last4 = params[:user][:card_last4]

    charge = Stripe::Charge.create(
      amount: ammount,
      currency: "usd",
      description: "Vivid Health Dublin",
      source: token
    )

    current_user.stripe_id = charge.id
    current_user.card_brand = card_brand
    current_user.card_exp_month = card_exp_month
    current_user.card_exp_year = card_exp_year
    current_user.card_last4 = card_last4
    current_user.save!
    
    
    respond_to do |format|
      if @appointment.save # && current_user.update(payment_params)
        format.html { redirect_to patient_appointments_path(current_user.person), notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
    
  rescue Stripe::CardError => e
    flash.alert = e.message
    render action: :new
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:appointment_date, :appointment_time, :total_hours, :status, :patient_id, :doctor_id, :payment_id)
    end
    
    def payment_params
      params.require(:user).permit(:card_brand, :card_exp_month, :card_exp_year, :card_last4)
    end
    
  
end
