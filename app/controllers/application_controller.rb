class ApplicationController < ActionController::Base
    
    def sign_in(user)
        token = SecureRandom.urlsafe_base64
        user.remember_digest = Digest::SHA1.hexdigest(token.to_s)
        user.save
        cookies.permanent.signed[:userid] = user.id
        cookies.permanent[:remember_token] = token
        @current_user = user
    end

    def sign_out
        current_user
        @current_user.remember_digest = nil
        @current_user.save
        cookies.delete(:userid)
        cookies.delete(:remember_token)
        @current_user = nil
    end

    def logged_in
        unless @current_user
            flash[:danger] = 'Please log in'
            redirect_to login_url
        end
    end

    def current_user
        if cookies.permanent[:remember_token]
            @current_user ||= User.find_by(remember_digest: Digest::SHA1.hexdigest(cookies.permanent[:remember_token]).to_s)
        end
    end
end
