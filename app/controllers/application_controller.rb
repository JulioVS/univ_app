class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?  # esto los hace visibles desde las 'views'

  # Al poner esto aqui, hace que TODA la aplicacion requiera un usuario logueado,
  # incluyendo - erroneamente - la propia pagina de Login, lo cual causaria un loop
  # infinito.-
  #
  # Para ello tengo que ir como minimo al controlador de sesiones y poner una directiva
  # 'skip_before_action :require_user' en las acciones del login.-
  #
  # Lo mismo en para paginas genericas como la Home page o el About que sean publicas
  #
  before_action :require_user 

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

  def require_user
    if !logged_in?
      flash[:notice] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
