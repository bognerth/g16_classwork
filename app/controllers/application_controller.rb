class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :current_user

  helper_method :current_user
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
      
      unless $redis.hexists(@current_user.login.to_sym, :classwork)
        if params[:lecture]
          lecture = JSON.parse($redis.get("lectures")).find{|l| l['title'] == params[:lecture]}
          $redis.hset(@current_user.login.to_sym, :classwork_lecture, lecture)
        end
      end
      return @current_user
    end
  end

  def authorize
    unless request.format == "application/json"
      if @current_user.nil?
        #Rails.logger.debug "Current_user: #{@current_user.inspect}Dokumente Autorisierung fehlgeschlagen. Loggen Sie sich mit der G16-Kennung und Passwort ein. User: #{session[:user_id]}" 
        redirect_to ENV['ROOT_DOMAIN'], alert: "Autorisierung fehlgeschlagen. Meckern Sie mit dem Programmierer." 
      end
    end
  end
end
