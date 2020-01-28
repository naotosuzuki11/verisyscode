Rails.application.routes.draw do


  resources :vandelay_contacts do
    collection { post :import }
  end

  root to: 'pages#home'
  get '/upload', to: 'pages#upload', as: :upload
  get '/review', to: 'pages#review', as: :review
  get '/csv_export', to: 'vandelay_contacts#csv_export'


end
