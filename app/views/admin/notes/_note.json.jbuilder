json.extract! note, :id, :title, :body, :plant_id, :user_id, :created_at, :updated_at
json.url note_url(note, format: :json)
