json.array!(@article_attachments) do |article_attachment|
  json.extract! article_attachment, :id, :article_id, :image
  json.url article_attachment_url(article_attachment, format: :json)
end
