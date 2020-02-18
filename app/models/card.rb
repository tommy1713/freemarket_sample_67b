class Card < ApplicationRecord
  VALID_NUMBER_REGEX = /\A\d{14,16}\z/
  VALID_EXP_NAME_REGEX = /\A[A-Z]+ [A-Z]+\z/
  VALID_EXP_MONTH_REGEX = /\A\d{2}\z/
  VALID_CVC_REGEX = /\A\d{3,4}\z/
  belongs_to :user
end
