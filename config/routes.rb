require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :blog do
    resources :articles
  end
  # get '/blog', to: 'blog#index'
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  get '/biography', to: 'home#biography'
  get '/first-time-here', to: 'home#first_time_here'
  get '/hire-me', to: 'home#hire_me'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  resources :notifications, only: [:index]
  resources :backstage, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
