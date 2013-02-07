#encoding: utf-8
class AnunciosController < ApplicationController

	before_filter :authenticate_user!
	before_filter :restrito_por_anunciante, except: :create 


	def create
		anuncio = Anuncio.new params[:anuncio]
		anuncio.anunciante = current_user

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

	def aprovar
		anuncio = Anuncio.find(params[:id])
		if anuncio.update_attribute :aprovado, true
			flash[:notice] = "O anúnico foi aprovado!"
		end
		redirect_to root_path
	end

private
	def restrito_por_anunciante
		anunciante = Anuncio.find(params[:id]).anunciante
		is_admin = current_user.role == "admin"
		unless is_admin || anunciante == current_user
			flash[:notice] = "Precisa ser administrador ou dono do anúncio!"
			redirect_to root_path
		end
	end
end
