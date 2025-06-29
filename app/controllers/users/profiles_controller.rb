class Users::ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def show;
  end

  def edit;
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to users_profile_path
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:user_name, :profile, :avatar)
  end
end
