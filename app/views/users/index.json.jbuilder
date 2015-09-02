json.array!(@users) do |user|
  json.extract! user, :id, :sapid, :fname, :lname, :email, :mobile, :username
  json.url user_url(user, format: :json)
end
