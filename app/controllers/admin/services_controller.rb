module Admin
  class ServicesController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin
    before_action :set_service, only: [:show, :edit, :update, :destroy]
    
    def index
      @services = Service.all
      @stores = Store.all
    end

    def new
      @service = Service.new
    end

    def create
      @service = Service.new(service_params)
      if @service.save!
        redirect_to admin_services_path, notice: "Service Created"
      else
        render :new
      end
    end

    def show
      
    end

    def edit
      
    end

    def update
      if @service.update(service_params)
        redirect_to admin_services_path, notice: "#{@service.service_name} has been updated"
      else
        render :edit
      end
    end

    def destroy
      
    end

    private

    def service_params
      params.require(:service).permit(:service_name, :store_id, :description, :pay_time)
    end

    def set_service
      @service = Service.find(params[:id])
      @stores = Store.all
    end
    
    
  end
end