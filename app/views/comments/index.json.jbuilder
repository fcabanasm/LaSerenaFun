json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :apartment_id, :body
  json.url comment_url(comment, format: :json)
end