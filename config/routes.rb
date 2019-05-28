Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/location/create', to: 'locations#create'
  post '/event/create', to: 'events#create'
  post '/event/ticket/create', to: 'tickets#create'
  post '/transaction/purchase', to: 'transactions#create'

  get '/transaction/get_info/:id', to: 'transactions#get_info'
  get '/event/get_info', to:'events#get_info'
end
