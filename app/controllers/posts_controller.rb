class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show]
  before_action :set_form_data, only: [:edit, :new]
  helper_method :store_params, :status_params
  layout :posts_layout

  def index
    if current_user == "ManagerUser" || "AdminUser"
      @submitted = Post.store_submitted(store_params, sort_start, sort_end)
      @rejected = Post.store_rejected(store_params, sort_start, sort_end)
      @approved = Post.store_approved(store_params, sort_start, sort_end)
      @paid = Post.store_paid(store_params, sort_start, sort_end)
      @posts = Post.current_view(store_params, status_params, sort_start, sort_end)
      @store = Store.find(store_params)
    else
      @submitted = Post.user_submitted(current_user, sort_start, sort_end)
      @rejected = Post.user_rejected(current_user, sort_start, sort_end)
      @approved = Post.user_approved(current_user, sort_start, sort_end)
      @paid = Post.user_paid(current_user, sort_start, sort_end)
      @posts = Post.current_view(current_user.stores, status_params, sort_start, sort_end)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(post_params[:user_id])
    @post = Post.new(post_params)
    @post.store_id = @user.stores.first.id
    if @post.save!
      redirect_back fallback_location: posts_path, notice: "#{@post.stk_num} Added Successfully for Date: #{@post.date}!"
    else
      render :new, error: "Error Adding"
    end
  end

  def edit
    @services = Service.where(store_id: current_user.store_ids)
  end
  
  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Vehicle Updated'
    else
      render :edit
    end
  end

  def show
    
  end

  private

  def posts_layout
    if current_user.type == "AdminUser" || current_user.type == "ManagerUser"
      "management"
    else
      "kia"
    end
  end
  

  def set_form_data
    @users = User.store_member(current_user.store_ids)
    @services = Service.where(store_id: current_user.store_ids)
  end

  def store_params
    case current_user.type
    when "AdminUser"
      if params[:store_id].present?
        params[:store_id]
      else
        1
      end
    when "ManagerUser"
      if params[:store_id].present? && current_user.store_ids.include?(params[:store_id].to_i)
        params[:store_id]
      else
        current_user.store_ids.first
      end
    else
      current_user.store_ids.first
    end
  end

  def status_params
    if params[:status].present?
      params[:status]
    else
      "submitted"
    end
  end

  def post_params
    params.require(:post).permit(:stk_num, :comments, :date, :status, :user_id, service_ids:[])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
