AutoShop::Application.routes.draw do
  
  resources :anuncios


  get "loja/principal"
  root to: "loja#principal"
end
