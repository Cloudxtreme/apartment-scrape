Apartments::Application.routes.draw do
  resources :apartments do
    collection do
      get 'map'
    end
  end
end
