class Cat < ActiveRecord::Base
  validates :name, presence: true

  has_many :toys, as: :toyable

  include Toyable

end
