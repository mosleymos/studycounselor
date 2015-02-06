json.array!(@leads) do |lead|
  json.extract! lead, :id, :card_id, :program_id, :comment, :recall, :document, :approved_by_school
  json.url lead_url(lead, format: :json)
end
