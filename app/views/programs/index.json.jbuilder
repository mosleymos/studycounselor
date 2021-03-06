json.array!(@programs) do |program|
  json.extract! program, :id, :name, :description, :program_url, :program_image_url, :school_id, :equivalent_year, :program_duration, :prerequisites, :first_letter, :research_name, :slug
  json.url program_url(program, format: :json)
end
