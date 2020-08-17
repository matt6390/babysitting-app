json.id parent.id
json.first_name parent.first_name
json.last_name parent.last_name
json.email parent.email
json.phone_number parent.phone_number
json.kids do
  json.array! parent.kids, partial: 'kids/kid', as: :kid
end
json.location parent.location
json.created_at parent.friendly_created_at
json.updated_at parent.friendly_updated_at