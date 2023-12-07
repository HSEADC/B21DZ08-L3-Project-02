json.extract! plant, :title, :description, :created_at
json.plant_image request.base_url + plant.plant_image.url
json.url api_v1_plant_url(plant, format: :json)
