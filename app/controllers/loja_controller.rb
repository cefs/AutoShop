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

	#para montar o select do formulario
	@marcas = Marca.por_nome

	#para o form_for formulario
	anuncio = Anuncio.new { |a| a.build_marca }
	render "principal", locals: {anuncio: anuncio}

  end
end
