class Article < ActiveRecord::Base
  has_many :article_attachments, dependent: :destroy
  accepts_nested_attributes_for :article_attachments
end
