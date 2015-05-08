class Phone < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with PhoneCountValidator

  OPERATORS = %w(МТС Velcom Life:\))
end
