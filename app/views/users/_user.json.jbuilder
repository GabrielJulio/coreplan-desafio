json.extract! user, :id, :full_name, :gender, :email, :nickname, :birth_date, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
