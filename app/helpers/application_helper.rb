module ApplicationHelper
  # Esto se invoca desde los 'views' para definir si el link de la barra de navegacion
  # debe ser "Log in" (si no hay nadie logueado en el sitio) o "Log out" (si ya hay 
  # alguien logueado)
  #
  # Asi se usa:
  #   ...
  #   <%= session_link %>
  #   ...
  #
  # El metodo 'logged_in?' esta definido en Application Controller y expuesto a las vistas
  # tambien.-
  #
  def session_link
    if logged_in?
      # Aqui cambio 'link_to' a 'button_to' para que el metodo "delete" funcione correctamente
      # A su vez le agrego "turbo: false" para que el 'fade out' del flash message de logout
      # tambien funcione correctamente! 
      button_to 'Log out', logout_path, method: :delete, data: {turbo: false}
    else 
      link_to 'Log in', login_path
    end
  end
end
