json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :last_name, :telephone, :age, :mail, :city, :etablissement, :previous_studies, :filieres, :mean_grade, :father_profession, :mother_profession, :general_comment, :first_letter, :research_name
  json.url student_url(student, format: :json)
end
