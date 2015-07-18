module FeatureConfigEngine
  class ApplicationController < ActionController::Base
    private
      def default_serializer_options
        { root: false }
      end

      def load_feature
        @feature = FeatureConfig::Feature.find_by_name(params[feature_finder_key])

        unless @feature
          render json: { message: 'feature not found' }, status: :not_found
          return
        end
      end

      def feature_finder_key
        :feature_id
      end
  end
end
