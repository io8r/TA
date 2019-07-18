module SessionsHelper

	#distinct method session of RoR that writes users id to temporary cookie
	#in form of hash :user_id
	def log_in(incoming_user_entity_got_from_form)
		session[:user_id] = incoming_user_entity_got_from_form.id 
	end

	#if in session was written user_id this hooks found by id user object 
	#into the global variable and returns it
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by(id: session[:user_id])
		end
	end

	#boolean method that checks if the user object persists
	def logged_in?
		!current_user.nil?
	end

	#clears user's id, written to the session method and also clears @current_user
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

end
