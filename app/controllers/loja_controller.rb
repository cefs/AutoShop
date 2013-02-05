class LojaController < ApplicationController
  def principal
  	@anuncios = Anuncio.order(:modelo)
  end
end
