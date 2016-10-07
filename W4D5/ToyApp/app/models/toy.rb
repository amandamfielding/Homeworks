class Toy < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :toyable, polymorphic: true


end
