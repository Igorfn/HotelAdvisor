class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
      redirect_to root_url, notice: "User deleted."
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :image, :image_cache,  :remove_image)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
