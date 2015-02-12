json.array!(@calendar_days) do |calendar_day|
  json.extract! calendar_day, :id, :starts, :description, :image_path
  json.url calendar_day_url(calendar_day, format: :json)
end
