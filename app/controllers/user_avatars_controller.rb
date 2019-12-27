class UserAvatarsController < ApplicationController
  before_action :set_user_avatar, only: [:show, :edit, :update, :destroy]

  # GET /user_avatars
  # GET /user_avatars.json
  def index
    @user_avatars = UserAvatar.all
  end

  # GET /user_avatars/1
  # GET /user_avatars/1.json
  def show
  end

  # GET /user_avatars/new
  def new
    @user_avatar = UserAvatar.new
  end

  # GET /user_avatars/1/edit
  def edit
    @user = @user_avatar.user
  end

  # POST /user_avatars
  # POST /user_avatars.json
  def create
    @user_avatar = UserAvatar.new(user_avatar_params)

    respond_to do |format|
      if @user_avatar.save
        format.html { redirect_to @user_avatar, notice: 'User avatar was successfully created.' }
        format.json { render :show, status: :created, location: @user_avatar }
      else
        format.html { render :new }
        format.json { render json: @user_avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_avatars/1
  # PATCH/PUT /user_avatars/1.json
  def update
    @user = @user_avatar.user
    respond_to do |format|
      if @user_avatar.update(user_avatar_params)
        format.html { redirect_to @user, notice: 'User avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_avatar }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_avatars/1
  # DELETE /user_avatars/1.json
  def destroy
    @user_avatar.destroy
    respond_to do |format|
      format.html { redirect_to user_avatars_url, notice: 'User avatar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_avatar
      @user_avatar = UserAvatar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_avatar_params
      params.require(:user_avatar).permit(:user_id, :avatar)
    end
end
