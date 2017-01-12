class ApiController < ApplicationController
   skip_before_action :verify_authenticity_token
   respond_to :json

     private
     def authenticated?
     authenticate_or_request_with_http_basic {|username, password| User.where( username: username, password: password).present? }
     end

     def current_user
       @current_user ||= User.find(session[:user_id]) if session[:user_id]
     end

     rescue_from StandardError do |exception|
       render json: { :error => exception.message }, :status => 500
     end

     
 end
