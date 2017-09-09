Rails.application.routes.draw do
  root to: 'home#index'
  resources :anuncios
  resources :artigos
  resources :visitantes
  resources :mensagens
  resources :contatos
  resources :favoritos  
  resources :destaques
  resources :fotos
  resources :imoveis
  resources :bairros
  resources :cidades
  resources :situacoes
  resources :tipos
  resources :categorias
  resources :usuarios, olny: [:index, :destroy]
  devise_for :usuarios, path: 'usuario', path_names: { sign_in: 'login', sign_out: 'logout', password: 'password', confirmation: 'verificacao', unlock: 'desbloquear', registration: 'registrar', sign_up: 'novo' }
  get 'cities_by_state' => 'bairros#cities_by_state', :as => 'cities_by_state'
  get 'imoveis/categoria/:id' => 'imoveis#categoria', :as => 'imoveis_categoria'
  post 'verificar' => 'favoritos#verificar', :as => 'verificar'
end
