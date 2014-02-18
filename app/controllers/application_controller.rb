class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :current_user, :current_lecture

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
  helper_method :current_lecture
  def current_lecture
    if params[:lecture]
      session[:wiki_lecture] = params[:lecture]
      @lecture = params[:lecture]
    elsif session[:wiki_lecture]
      @current_lecture = session[:wiki_lecture]
    else
      redirect_to ENV['ROOT_DOMAIN'], alert: "Der Kurs ist nicht angegeben." 
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
