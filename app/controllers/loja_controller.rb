class LojaController < ApplicationController
  def principal
  	is_admin = current_user && current_user.role == "admin"

  	@anuncios = if is_admin
		Anuncio.order(:modelo)
	else
		Anuncio.aprovados
	end
  end
end
