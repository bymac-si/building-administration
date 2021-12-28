Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  root "home#index"

  get 'apartments',             to: 'apartments#index',   as: 'apartments'
  get 'apartments/new',         to: 'apartments#new',     as: 'new_apartment'
  get 'apartments/:id',         to: 'apartments#show',    as: 'apartment'
  get 'apartments/edit/:id',    to: 'apartments#edit',    as: 'edit_apartment'  

  post 'apartments',        to: 'apartments#create'
  put  'apartments/:id',    to: 'apartments#update'
  patch 'apartments/:id',   to: 'apartments#update'
  delete 'apartments/:id',  to: 'apartments#destroy'

  get 'buildings',             to: 'buildings#index',   as: 'buildings'
    get 'buildings/new',         to: 'buildings#new',     as: 'new_building'
    get 'buildings/:id',         to: 'buildings#show',    as: 'building'
    get 'buildings/edit/:id',    to: 'buildings#edit',    as: 'edit_building'  
  
    post 'buildings',        to: 'buildings#create'
    put  'buildings/:id',    to: 'buildings#update'
    patch 'buildings/:id',   to: 'buildings#update'
    delete 'buildings/:id',  to: 'buildings#destroy'
end
