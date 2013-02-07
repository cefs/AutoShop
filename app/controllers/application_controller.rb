#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  	rescue_from CanCan::AccessDenied do |exception|
  		redirect_to root_url,
  		notice: "Voce não tem permissão para acessar esse recurso"
  	end
end
