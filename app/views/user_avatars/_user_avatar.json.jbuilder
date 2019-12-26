json.extract! user_avatar, :id, :user_id, :avatar, :created_at, :updated_at
json.url user_avatar_url(user_avatar, format: :json)
