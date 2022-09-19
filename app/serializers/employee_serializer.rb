class EmployeeSerializer < ActiveModel::Serializer
   attributes :id,:first_name,:last_name,:contact_number,:email,:isdeleted

end
