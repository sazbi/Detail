module Admin
  class UsersController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin
    before_action :set_user, only: [:show, :edit, :update, :destroy, :toggle_status]
    
    def index
      @users = User.all
      @payroll_employees = User.where(type: nil)
      @user = User.new
      @stores = Store.all
      respond_to do |format|
        format.html
        format.csv { send_data @payroll_employees.to_csv, filename: "users-#{Date.today}.csv" }

      end
    end

    def create
      @user = User.new(user_params)
      if @user.save!
        redirect_back fallback_location: admin_users_path, notice: "User Created"
      else
        redirect_back fallback_location: admin_users_path, notice: "Error Creating User"
      end
    end

    def show
      @week_posts = Post.user_posts(@user.id, sort_start, sort_end)
      @week_amts = list_services(@week_posts).to_json
      @month_posts = Post.user_posts(@user.id, Date.today.beginning_of_month, Date.today.end_of_month)
      @month_amts = list_services(@month_posts).to_json
      respond_to do |format|
        format.html
        format.json { render json: @week_amts }
      end
  
    end

    def edit
      @stores = Store.all
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "#{@user.full_name} has been updated"
      else
        render :edit
      end
    end
    
    def destroy
      @user.delete
      redirect_to admin_users_path, notice: "User Deleted"
    end

    def toggle_status
      if @user.disabled?
        @user.active!
      else
        @user.disabled!
      end
      redirect_back fallback_location: admin_users_path, notice: "#{@user.full_name} has been made #{@user.status.titleize}"
    end
    

    private

    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation, :first_name, :last_name, :type, :dms_id, store_ids:[])
    end

    def set_user
      @user = User.find(params[:id])
    end

    def list_services(posts)
      list = {}
      posts.each do |p|
        list.merge!(p.service_list) { |k, o, n| o + n }
      end
      list
    end
  end
end