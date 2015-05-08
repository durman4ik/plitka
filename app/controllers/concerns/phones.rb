module Phones
  extend ActiveSupport::Concern

  private

  def set_phones
    @phones = Phone.all
  end
end