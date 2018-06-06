json.extract! item, :id, :parent_id, :code, :name, :created_on, :updated_on, :data, :created_at, :updated_at
json.url item_url(item, format: :json)
