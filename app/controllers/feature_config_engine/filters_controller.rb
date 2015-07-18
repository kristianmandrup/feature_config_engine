module FeatureConfigEngine
  class FiltersController < ApplicationController
    before_action :load_feature
    before_action :load_filter, only: [:update]

    def index
      render json: @feature.filters,
             each_serializer: FeatureConfigEngine::FilterSerializer
    end

    def update
      if @filter.update(filter_params)
        render json: { message: 'updated' }, status: :ok
      else
        render json: @filter.errors.messages, status: :unprocessable_entity
      end
    end

    private
      def load_filter
        @filter = @feature.find_filter(params[:id])

        unless @filter
          render json: { message: 'filter not found' }, status: 404
          return
        end
      end

      def filter_params
        ActionController::Parameters.new(data: params.require(:filter)[:data]).permit!
      end
  end
end
