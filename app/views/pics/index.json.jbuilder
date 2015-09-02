json.array!(@pics) do |pic|
  json.extract! pic, :id, :imageuri, :user_id
  json.url pic_url(pic, format: :json)
end
