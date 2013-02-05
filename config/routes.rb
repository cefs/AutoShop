AutoShop::Application.routes.draw do
  get "loja/principal"
  root to: "loja#principal"
end
