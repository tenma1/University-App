Rails.application.routes.draw do
  get 'hostels/index'
  get 'hostels/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  # devise_for :users
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  devise_for :users, controllers: {registrations:'users/registrations', sessions: "users/sessions"}

  # concerns :featurable do
  #   resources :features, only: [:index, :show ]
  # end

  # match 'home', :to => "welcome#index"
  #root "welcome#index"
  
  resources :welcome, only: []
    get '/search', to: 'welcome#search'
    get '/login', to: 'welcome#login'

  root "welcome#index"


  resources :users, only: [ :show, :edit, :update]
  devise_scope :user do
    get '/sign_out', to: 'users/sessions#destroy'
    get '/edit_courses', to: 'users#edit_courses'
    get '/update_accounting', to: 'users#update_accounting'
  end
  resources :orders, only: []
    get '/payments_online', to: 'orders#payments_online'
  resources :receipts, only: [:index, :show]
  resources :colleges, only: [:index, :show]
  resources :features, only: [:index, :show]
  resources :schools, only: [:index, :show]
  resources :hostels, only: [:index, :show]
  resources :courses, only: [:index, :show]
    get '/registered_courses', to: 'courses#show'
  resources :news_letters, only: [:index, :show]
    get '/news_letters', to: 'news_letters#index'
    get '/news_letters/:id', to: 'news_letters#show'
  resources :academics, only: []
    get '/index_exam_results', to: 'academics#index_exam_results'
  resources :accounting, only: []
    get '/show_fee_details', to: 'accountings#show_fee_details'
    get '/show_salary_details', to: 'accountings#show_salary_details'
  


  # Defines the root path route ("/")
end
