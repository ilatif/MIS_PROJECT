class UsersController < ApplicationController
  def index
    #@users = User.order('created_at DESC').get_users
    @users = current_user.get_users
    respond_to do |format|
      format.html
    end
  end
  def new
    @user = User.new
    respond_to do |format|
      format.js
    end
  end
  def create
    @user = User.new params[:user]
    respond_to do |format|
      if @user.save
        @users = current_user.get_users
        format.html { redirect_to( users_path,  :notice => 'Successfuly Sign In .' ) }
        format.js
      else
        format.html { redirect_to( users_path, :alert=>'Can not save User' ) }
        format.js
      end
    end
  end
  def edit
    @user = User.find params[:id]
    respond_to do |format|
      format.js
    end
  end
  def update
    @user = User.find params[:id]
    respond_to do |format|
      if @user.update_attributes params[:user]
        format.js
      end
      format.html{ redirect_to( users_path ) }
    end

  end
end
