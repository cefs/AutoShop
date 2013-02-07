AutoShop::Application.routes.draw do
  devise_for :users

  root to: "loja#principal"
  get "loja/principal"

  resources :anuncios, only: [:create, :edit, :update] do
  	member do
      put "aprovar" => "anuncios#aprovar"
  		#GRACEFUL DEGRADATION: UM LINK E DUAS ACTIONS 
  		get :delete
  		delete "delete" => "anuncios#destroy"
  	end  
  end
  
end
