json.array!(@categories) do |category|
  json.extract! category, :id, :name, :description, :image_url, :research_name, :first_letter, :slug
  json.url category_url(category, format: :json)
end
