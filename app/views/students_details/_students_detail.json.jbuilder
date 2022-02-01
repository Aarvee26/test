json.extract! students_detail, :id, :name, :age, :gender, :created_at, :updated_at
json.url students_detail_url(students_detail, format: :json)
