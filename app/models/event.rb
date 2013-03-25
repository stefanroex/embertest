class Event < ActiveRecord::Base
  attr_accessible :client_id, :message, :type_id, :created_at
  belongs_to :client
  default_scope order("id desc")
end
