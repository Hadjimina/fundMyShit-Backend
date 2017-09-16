class Payment < ApplicationRecord
  belongs_to :challenge
  belongs_to :payer, class_name: 'User'
end
