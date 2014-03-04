json.array!(@boards) do |board|
  json.extract! board, :title, :subtitle
  json.url board_url(board, format: :json)
end