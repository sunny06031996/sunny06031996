class EmployeesSerializer < ActiveModel::Serializer
  attributes :id,:first_name,:last_name,:contact_number,:role:email
  has_many :posts,Serializer:PostsSerializer 
end
