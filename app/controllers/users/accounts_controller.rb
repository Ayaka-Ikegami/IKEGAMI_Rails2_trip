class Users::AccountsController < ApplicationController
  def index;
  end

  def show
    @user = current_user
  end
end
