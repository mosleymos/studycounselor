json.array!(@rankings) do |ranking|
  json.extract! ranking, :id, :student_id, :counselor_id, :comment, :grade
  json.url ranking_url(ranking, format: :json)
end
