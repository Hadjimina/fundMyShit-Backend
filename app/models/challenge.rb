class Challenge < ApplicationRecord
  belongs_to :challenger, class_name: 'User'
  has_many :payments

  def add_current_price
    self.current_price = self.payments.map(&:amount).reduce(:+)
    self
  end

  def check_completed
    if self.current_price >= self.price
      self.completed = true
    else
      self.completed = false
    end
    self
  end

  def age
    ( DateTime.parse(self.updated_at.to_s).day - DateTime.now.day)
  end
end
