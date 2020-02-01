Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'tasks', to: 'tasks#index'

  get 'tasks/new', to: 'tasks#new', as: 'new_task'

  post 'tasks', to: 'tasks#create'

  post 'tasks/:id/offers', to: 'offers#create', as: 'task_offers'

  get 'tasks/:id/offers', to: 'offers#success', as: 'offers_success'

  patch 'offers/:id/accept', to: 'offers#accept_offer', as: 'accept_offer'

  patch 'offers/:id/complete', to: 'offers#mark_complete', as: 'mark_complete'

  get 'dashboard', to: 'pages#dashboard'

  get 'tasks/:id', to: 'tasks#show', as: 'task'

  get 'tasks/:id/edit', to: 'tasks#edit'

  patch 'tasks/:id', to: 'tasks#update'

  delete 'tasks/:id', to: 'tasks#destroy'
end
