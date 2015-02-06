json.array!(@counselors) do |counselor|
  json.extract! counselor, :id, :first_name, :last_name, :full_name
  json.url counselor_url(counselor, format: :json)
end
