# class Api::V2::ServicesController < ApplicationController
module Api
  module V2
    class ServicesController < ApplicationController

      before_action :set_service, only: [:show, :update, :destroy]

      def index
        ServiceList.new.deliver(request.format, response)
      end

      def show
        render json: @service
      end

      # POST /services.json
      def create
        @service = Service.new(service_params)
        if @service.save
          render json: @service, status: :created, location: @service
        else
          render json: @service.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /services/1.json
      def update
        @service = Service.find(params[:id])
        if @service.update(service_params)
          head :no_content
        else
          render json: @service.errors, status: :unprocessable_entity
        end
      end

      # DELETE /services/1.json
      def destroy
        @service.destroy
        head :no_content
      end

      private

      def set_service
        @service = Service.find(params[:id])
      end

      def service_params
        params.require(:service).permit(
          :service_code, :service_name, :description, :metadata,
          :type, :keywords, :group, :jurisdiction_id
        )
      end
    end
  end
end
