class RegistrationsController < Devise::RegistrationsController
  def new
    super
    @person = Person.new
    # @user = User.new
    @user.person = @person
  end

  def create
    @user = User.new(user_params)
    @person = Person.new(person_params)
    @user.person = @person
    
    respond_to do |format|
      if @person.save
        sign_in(@user)
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    super
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      {
        :first_name => params[:user][:person_attributes][:first_name],
        :type => params[:user][:person_attributes][:type],
        :photo => params[:user][:person_attributes][:photo], 
        :last_name => params[:user][:person_attributes][:last_name], 
        :dob => params[:user][:person_attributes][:dob],
        :address => params[:user][:person_attributes][:address], 
        :phone => params[:user][:person_attributes][:phone],
        :gender => params[:user][:person_attributes][:gender], 
        :bio => params[:user][:person_attributes][:bio],
        :discipline => params[:user][:person_attributes][:discipline], 
        :hourly_rate => params[:user][:person_attributes][:hourly_rate]
      }
    end
    
    def user_params
      {:email => params[:user][:email], :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation]}
    end
end