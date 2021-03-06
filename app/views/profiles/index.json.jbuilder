json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :address, :bio, :gender, :placeofbirth, :countryofbirth
  json.url profile_url(profile, format: :json)
end
