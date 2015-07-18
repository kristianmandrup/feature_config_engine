module FeatureConfigEngine
  class FeatureSerializer < ::ActiveModel::Serializer
    attributes :enabled, :name
  end
end
