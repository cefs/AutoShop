class LojaController < ApplicationController
  def principal
  	is_admin = current_user && current_user.role == "admin"
  	@anuncios = if is_admin
		@anuncios=Anuncio.order(:modelo)
	else
		Anuncio.aprovados
	end

	@anuncio = Anuncio.new { |a| a.build_marca }

  end
end
