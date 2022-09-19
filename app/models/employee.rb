class Employee < ApplicationRecord
  has_secure_password
  before_save :set_full_name
  enum role: ['HR', 'Developer' ,'Manager']

  has_many :posts
  #has_many :comments, through: :posts, dependent: :destroy
  #has_many :likes, through: :posts, dependent: :destroy
  #has_one_attached  :image
  has_many :events
  has_many :employee, class_name: "Employee",
                          foreign_key: "teamlead_id"
  belongs_to :teamlead, class_name: "Employee", optional: true 

  private
  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}".strip
  end
end
