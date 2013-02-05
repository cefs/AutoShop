class AnunciosController < ApplicationController
	def create
		anuncio = Anuncio.new params[:anuncio]

		if anuncio.save
			flash[:notice] = "criado com sucesso!"
		end

		redirect_to root_path

	end
end
