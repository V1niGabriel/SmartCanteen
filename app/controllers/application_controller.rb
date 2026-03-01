class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  before_action :authenticate_funcionario!

  before_action :configure_permitted_parameters, if: :devise_controller?

  load_and_authorize_resource unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_path, alert: "Você não tem permissão para acessar esta página." }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :cpf, :telefone, :cargo_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :cpf, :telefone, :cargo_id])
  end

  def current_ability
    @current_ability ||= Ability.new(current_funcionario)
  end
end
