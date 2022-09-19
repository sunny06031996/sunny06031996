module Api
  module V1
    class ApplicationController < ActionController::API
      def encode_token(payload)
        JWT.encode(payload, 'secret')
      end

      def decode_token
        auth_header = request.headers['Authorization']
        if auth_header
            token = auth_header.split(' ')[1]
            begin
              JWT.decode(token, 'secret', true, algorithm: 'HS256')
            rescue JWT::DecodeError
              nil
            end
        end
      end

      def authorized_employee
        decoded_token = decode_token()
        if decoded_token
          employee_id = decoded_token[0]['employee_id']
          @user = Employee.find_by(id: employee_id)
        end
      end

      def authorize
        render json: { message: 'You have to log in.' }, status: :unauthorized unless authorized_user
      end
    end  
  end     
end


