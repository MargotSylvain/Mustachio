class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.user_id
      flash[:notice]= "Thank you for signing on Mustachio!"
      redirect_to collections_url
    else
      render action: :new
    end
  end


end
