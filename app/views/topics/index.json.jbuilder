json.array!(@topics) do |topic|
  json.extract! topic, :title, :subtitle, :user_id, :board_id
  json.url topic_url(topic, format: :json)
end