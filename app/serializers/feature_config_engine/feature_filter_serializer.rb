module FeatureConfigEngine
  class FeatureFilterSerializer < ::ActiveModel::Serializer
    def attributes
      {
        name: object.feature.name,
        available: { object.type => object.data }
      }
    end
  end
end
