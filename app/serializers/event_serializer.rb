class EventSerializer < ActiveModel::Serializer
  attributes :id, :message, :created_at, :client_id, :type_id
end
