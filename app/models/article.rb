class Article < ActiveRecord::Base
  has_many :article_attachments
  accepts_nested_attributes_for :article_attachments
end
