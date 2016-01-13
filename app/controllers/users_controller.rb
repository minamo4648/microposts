class UsersController < ApplicationController

# users_controller.rb

before_action :authenticate_user!, only: [:edit, :update]

  def update
    
    if @user.update(user_params)
      flash[:success] = "Update succeeded"
      redirect_to user_path
    else
      render 'edit'
    end
    
  end

  def show # 追加
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def followings

    @this_user = User.find(params[:id])
    @users = User.find(params[:id]).following_users
  
  end
  
  def followers
    
    @this_user = User.find(params[:id])
    @users = User.find(params[:id]).follower_users
  
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :region, :profile)
  end

    def authenticate_user!
      
      @user = User.find(params[:id])
      
      if @user != current_user
    
        redirect_to root_path, alert: 'Data invalid'
        return
    
      end
    
    end
  



end
