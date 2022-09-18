class ApplicationController < ActionController::Api

	def encode_token
		JWT.encode(payload,'secret')
	end	

	
end
