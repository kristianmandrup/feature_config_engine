module FeatureConfigEngine
  class FilterSerializer < ::ActiveModel::Serializer
    attributes :available

    def available
      { object.type => object.data }
    end
  end
end
