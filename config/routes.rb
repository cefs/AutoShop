AutoShop::Application.routes.draw do
  devise_for :users

  root to: "loja#principal"
  get "loja/principal"

  resources :anuncios do
  	member do
  		#GRACEFUL DEGRADATION: UM LINK E DUAS ACTIONS 
  		get :delete
  		delete "delete" => "anuncios#destroy"
  	end  
  end
  
end
