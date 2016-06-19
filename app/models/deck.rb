class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards
  has_many :users, through: :rounds
  belongs_to :author, { class_name: "User"}
end
