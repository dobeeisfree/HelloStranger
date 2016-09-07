json.extract! menu, :id, :picture, :price, :name, :recommended_menu, :created_at, :updated_at
json.url menu_url(menu, format: :json)