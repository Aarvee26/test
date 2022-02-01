class StudentsDetailsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age, :gender
end
 