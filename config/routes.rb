MyStore::Application.routes.draw do
  # get ':controller(/:action(/:id))'
  resources :items do
    get :upvote, on: :member
    get :expensive, on: :collection
  end
end
