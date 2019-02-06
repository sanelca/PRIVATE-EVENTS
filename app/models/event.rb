class Event < ActiveRecord::Base
  belongs_to :host, class_name: "User"
  has_many :invitations, dependent: :destroy
  has_many :guests, through: :invitations, source: :guest

  validates :title, presence: true, length: {maximum:255},
            uniqueness: true
  validates :date, presence:true
  validates :description, presence: true

  scope :upcoming, -> {where('date >= ?', Time.now)}
  scope :past,         -> {where('date < ?', Time.now)}
end
