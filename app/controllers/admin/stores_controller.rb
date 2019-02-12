module Admin
  class StoresController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin
    before_action :set_store, only: [:show, :edit, :update, :destroy]

    def index
      @stores = Store.all
      @store = Store.new
    end

    def new
      @store = Store.new
    end

    def create
      @store = Store.new(store_params)
      if @store.save!
        redirect_to admin_stores_path, notice: 'Store Created'
      else
        render :new
      end
    end

    def show
      
    end

    def edit
      
    end

    def update
      if @store.update(store_params)
        redirect_to admin_stores_path, notice: "#{@store.name} has been updated"
      else
        render :edit
      end
    end

    def export_week
      @posts = Post.where(status: params[:status], store_id: params[:store_id], date: params[:start_date]..params[:end_date])
      respond_to do |format|
        format.html
        format.csv { send_data @posts.to_csv, filename: "#{@posts.first.store.name}-#{Date.today}.csv" }
      end
    end
    

    private

    def store_params
      params.require(:store).permit(:name)
    end

    def set_store
      @store = Store.find(params[:id])
    end
    
    
  end
end