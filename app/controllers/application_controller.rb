class ApplicationController < ActionController::Base
  rescue_from Exception, with: :server_error
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def server_error(e)
    ExceptionNotifier.notify_exception(e, :env => request.env, :data => { :message => "error" })
    respond_to do |format|
      format.html { render template: 'front/errors/500', layout: 'front/layouts/error', status: 500 }
      format.all { render nothing: true, status: 500 }
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when User
      user_path(resource)
    when Admin
      admin_root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def set_search
    @q = App.ransack(params[:q])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
