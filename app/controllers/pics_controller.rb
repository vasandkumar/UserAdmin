class PicsController < ApplicationController
  before_action :set_pic, only: [:show, :edit, :update, :destroy]
  before_filter :get_user

  # GET /pics
  # GET /pics.json
  def index
    if params[:search]
      @pics = @user.pics.paginate(:page => params[:page], :per_page => 10).where("user_id = #{@user.id} AND imageuri iLIKE ? ","%#{params[:search]}%")
    else
      @pics = @user.pics.all.paginate(:page => params[:page], :per_page => 10)
    end
  end
  # GET /pics/1
  # GET /pics/1.json
  def show
  end

  # GET /pics/new
  def new
    @pic = @user.pics.new(user_id: params[:user_id])
  end

  # GET /pics/1/edit
  def edit
  end

  # POST /pics
  # POST /pics.json
  def create
    @pic = @user.pics.new(pic_params)

    respond_to do |format|
      if @pic.save
        format.html { redirect_to user_pic_path(id: @pic.id), notice: 'Pic was successfully created.' }
        format.json { render :show, status: :created, location: @pic }
      else
        format.html { render :new }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pics/1
  # PATCH/PUT /pics/1.json
  def update
    respond_to do |format|
      if @pic.update(pic_params)
        format.html { redirect_to user_pics_path, notice: 'Pic was successfully updated.' }
        format.json { render :show, status: :ok, location: @pic }
      else
        format.html { render :edit }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pics/1
  # DELETE /pics/1.json
  def destroy
    @pic.destroy
    respond_to do |format|
      format.html { redirect_to user_pics_path, notice: 'Pic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pic
      @pic = Pic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pic_params
      params.require(:pic).permit(:imageuri, :user_id, :picture)
    end
end
