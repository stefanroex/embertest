class Client < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :events

  def full_name
    [first_name, last_name].join(" ")
  end
end
