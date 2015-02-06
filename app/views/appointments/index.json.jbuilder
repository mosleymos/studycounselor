json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :student_id, :counselor_id, :telephone, :date, :comment
  json.url appointment_url(appointment, format: :json)
end
