json.array!(@schools) do |school|
  json.extract! school, :id, :name, :description, :image_url, :school_url, :first_letter, :research_name, :slug, :goals
  json.url school_url(school, format: :json)
end
