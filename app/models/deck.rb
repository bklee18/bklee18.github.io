class Deck < ActiveRecord::Base
  has_many :rounds, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :users, through: :rounds
  belongs_to :author, { class_name: "User"}

  validates :name, presence: true
  validates :description, presence: true
end
