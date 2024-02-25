json.set! :plants do
  json.array! @plants, partial: "api/v1/plants/plant", as: :plant
end