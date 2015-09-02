class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_filter :get_user

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.where(user_id: params[:user_id])
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = @user.build_profile
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = @user.create_profile(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to user_profile_path(id: @profile.id), notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @user.profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to user_profile_path(id: @profile.id), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profiles_path, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :address, :bio, :gender, :placeofbirth, :countryofbirth)
    end
end
