#encoding: utf-8
class AnunciosController < ApplicationController
	def create
		anuncio = Anuncio.new params[:anuncio]

		if anuncio.save
			flash[:notice] = "Anúncio foi cadastrado!"
		end

		redirect_to root_path
	end

	def edit
		@anuncio = Anuncio.find params[:id]

	end

	def update
		anuncio = Anuncio.find params[:id]
		if anuncio.update_attributes params[:anuncio]
			flash[:notice] = "O anúncio foi atualizado"
		end

		redirect_to root_path
	end

	def delete
		@anuncio = Anuncio.find(params[:id])
	end

	def destroy
		anuncio = Anuncio.find params[:id]
		anuncio.destroy

		flash[:notice] = "O anúncio foi excluído!"

		redirect_to root_path
	end

end
