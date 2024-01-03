class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?  # esto los hace visibles desde las 'views'

  # Definir los metodos en esta clase los hace visibles desde todos los 'controllers'
  # de la app.-
  
  def current_user
    # El ||= significa que solo ejecuta el codigo de asignacion si la variable aun no esta
    # definida. Si ya estaba definida, entonces simplemente devuelve su valor actual.
    #
    # Eso hace que se acceda solo una vez a la BD por usuario logueado, y en cada llamada
    # subsiguiente simplemente se devuelva ese usuario.
    #
    # Al desloguearse, se deberia poner esta variable en 'nil' para que cuando haya un nuevo
    # usuario logueado se vuelva a acceder a la BD.-
    
    @current_user ||= Student.find(session[:student_id]) if session[:student_id] 
  end

  def logged_in?
    # La doble negacion es para que devuelva siempre un valor booleano y no una id de usuario
    # Algo asi como "hay alguien logueado si NO es cierto que NO exista un usuario actual"
    
    !!current_user 
  end
end
