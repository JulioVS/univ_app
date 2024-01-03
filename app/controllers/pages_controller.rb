class PagesController < ApplicationController
  # Pagina publica, no requiere login previo
  skip_before_action :require_user

  def about

  end
end