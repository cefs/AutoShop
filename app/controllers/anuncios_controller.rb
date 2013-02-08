#encoding: utf-8
class AnunciosController < ApplicationController

	before_filter :authenticate_user!
	before_filter :restrito_por_anunciante, except: :create 

	def create
		anuncio = Anuncio.new params_anuncio
		anuncio.anunciante = current_user

		if anuncio.save
			flash[:notice] = "Anúncio foi cadastrado!"
			redirect_to root_path
		else
			@marcas = Marca.por_nome
			render "anuncios/cadastro", locals: {anuncio: anuncio}
		end
	end

	def edit
		@anuncio = Anuncio.find params[:id]
		@marcas = Marca.por_nome

	end

	def update
		anuncio = Anuncio.find params[:id]
		if anuncio.update_attributes params_anuncio
			flash[:notice] = "O anúncio foi atualizado"
			redirect_to root_path
		else
			#render_cadastro cadastro
		end

		
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

		authorize! :aprovar, anuncio

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
			#flash[:notice] = "Precisa ser administrador ou dono do anúncio!"
			redirect_to root_path
		end
	end

	def params_anuncio
		parameters = params[:anuncio]

		if parameters[:marca_attribuites] && !parameters[:marca_attribuites][:nome ].empty?
			parameters.delete :marca_id
		else
			parameters.delete :marca_attribuites
		end
		parameters
	end
end
