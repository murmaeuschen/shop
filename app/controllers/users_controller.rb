class UsersController < ApplicationController
  respond_to :html, :json

  def index
    @users = User.page params[:page]
    @page_info = {
      current_page: @users.current_page,
      num_pages:    @users.num_pages,
      per_page:     @users.limit_value,
    }

    respond_to do |format|
      format.html
      format.json do
        respond_with({ models: @users }.merge @page_info)
      end
    end
  end

  def show
    @user = User.find params[:id]
    respond_to do |format|
      format.html
      format.json { respond_with @user }
    end
  end

  def create
    @user = User.create params[:user]
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.json { respond_with @user }
    end
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes params[:user]
    respond_to do |format|
      format.html
      format.json { respond_with @user }
    end
  end

  def destroy
    respond_with User.destroy(params[:id])
  end
end
