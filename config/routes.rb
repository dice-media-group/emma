require 'sidekiq/web'

Rails.application.routes.draw do
  get 'tags/:tag', to: 'blog#index', as: :tag
  namespace :blog do
  end
  resource :lead
  resources :wallpapers
  get 'wallpapers/index'
  resources :photos
  # namespace :broadcaster do
  #   get 'dashboard/index'
  # end

  namespace :broadcaster do
    resources :dashboard, only: [:index, :show]
    resources :avatars
    resources :themes, shallow: true do
      resources :outlines
      resources :videos
      resources :audios
      resources :social_entries
      resources :theme_avatars
    end
  end
  resources :press_kits
  get 'services/index'
  resources :books, only: [:index]
  resources :media_appearances
  resources :podcasts, only: [:index, :show]
  resources :wallpapers, only: [:index, :show]

  resources :blog, only: [:index]
  namespace :blog do
    resources :entries
    resources :recommendations
    # root to: "entries#index"
    resources :articles
  end

  namespace :admin do

    resources :press_kit_entries

    resources :press_kit_links

    resources :press_kit_photos

    resources :press_kits

    resources :leads

    resources :merchandise_links

    resources :meetups
    resources :books
    resources :publisher_accts
    resources :users
    resources :announcements
    resources :notifications
    root to: "users#index"
    end

  # get '/blog', to: 'blog#index'
  get '/privacy', to: 'home#privacy'
  get '/podcast', to: 'podcasts#index'
  get '/events', to: 'meetups#index'
  get '/media-appearances', to: 'media_appearances#index'
  get '/terms', to: 'home#terms'
  get '/biography', to: 'home#biography'
  get '/first-time-here', to: 'home#first_time_here'
  get '/hire-me', to: 'home#hire_me'
  get '/get-in-touch-with-me', to: 'home#contact_me'

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end


  resources :notifications, only: [:index]
  resources :backstage, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  resource :press_kit
  resolve('PressKit') { [:press_kit] }

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
