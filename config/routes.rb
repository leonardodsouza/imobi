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
  devise_for :usuarios

  get 'cities_by_state' => 'bairros#cities_by_state', :as => 'cities_by_state'
  get 'imoveis/categoria/:id' => 'imoveis#categoria', :as => 'imoveis_categoria'
  post 'verificar' => 'favoritos#verificar', :as => 'verificar'
end
