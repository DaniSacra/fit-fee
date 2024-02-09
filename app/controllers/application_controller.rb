class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    payments_path
  end

  # Redireciona o usuário após cadastro
  def after_sign_up_path_for(resource)
    payments_path
  end
end
