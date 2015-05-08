class PhoneCountValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:name] = 'Максимум 3 телефона в данном дизайне сайта.' unless Phone.all.length < 3
  end
end