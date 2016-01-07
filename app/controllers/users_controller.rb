class UsersController < ApplicationController

# users_controller.rb

  def update
    
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = "Update succeeded"
      redirect_to user_path
    else
      render 'edit'
    end
    
  end

  def show # 追加
   @user = User.find(params[:id])
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
    @user = User.find(params[:id])
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :region, :profile)
  end
  

end
