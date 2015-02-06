json.array!(@cards) do |card|
  json.extract! card, :id, :appointment_datetime, :comment_text, :avaibility_text, :student_id, :counselor_id
  json.url card_url(card, format: :json)
end
