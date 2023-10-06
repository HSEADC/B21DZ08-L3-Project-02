json.extract! article, :id, :title, :description, :article_tag, :body, :article_imge, :article_id, :created_at, :updated_at
json.url article_url(article, format: :json)
