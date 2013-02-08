class LojaController < ApplicationController
  def principal

  	#verifica se o usário logado é true e admin
  	is_admin = current_user && current_user.role == "admin"

  	#lista de anúncios para 
  	@anuncios = if is_admin
		@anuncios=Anuncio.order(:modelo)
	else
		Anuncio.aprovados
	end
	
	#mostra form para cadastrar ou para editar, com ou sem erros
	anuncio = Anuncio.new { |a| a.build_marca }
	render_cadastro anuncio, "principal"
  end
end
