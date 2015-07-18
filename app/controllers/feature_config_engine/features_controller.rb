module FeatureConfigEngine
  class FeaturesController < ApplicationController
    before_action :load_feature, only: [:show, :update, :destroy]

    def index
      render json: FeatureConfig::Feature.all,
             each_serializer: FeatureConfigEngine::FeatureSerializer
    end

    def show
      render json: @feature,
             serializer: FeatureConfigEngine::FeatureSerializer
    end

    def update
      if @feature.update(resource_params)
        render json: { message: 'updated' }, status: :ok
      else
        render json: @feature.errors.messages, status: :unprocessable_entity
      end
    end

    def create
      feature = FeatureConfig::Feature.store(resource_params)

      if feature.persisted?
        render json: { message: 'created' }, status: :created
      else
        render json: feature.errors.messages, status: :unprocessable_entity
      end
    end

    def destroy
      if @feature.destroy
        render json: { message: 'deleted' }, status: :ok
      else
        render json: @feature.errors.messages, status: :unprocessable_entity
      end
    end

    def filters
      render json: FeatureConfig::Feature.all_filters,
             each_serializer: FeatureConfigEngine::FeatureFilterSerializer
    end

    def enabled
      process_status_request
    end

    def disabled
      process_status_request
    end

    private
      def process_status_request
        status = caller[0][/`.*'/][1..-2]
        render json: FeatureConfig::Feature.public_send(status),
               each_serializer: FeatureConfigEngine::FeatureSerializer
      end

      def feature_finder_key
        :id
      end

      def resource_params
        params.require(:feature).permit(:name, :enabled)
      end
  end
end
