class Anuncio < ActiveRecord::Base
  attr_accessible :ano, :descricao, :modelo, :valor, :marca_attributes
  belongs_to :marca
  belongs_to :anunciante, class_name: "User"

  accepts_nested_attributes_for :marca

  def self.aprovados
  	where aprovado: true	
  end
end
