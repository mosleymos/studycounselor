json.array!(@questions) do |question|
  json.extract! question, :id, :name, :description, :research_name, :first_letter, :slug
  json.url question_url(question, format: :json)
end
