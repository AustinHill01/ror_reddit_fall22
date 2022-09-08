Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
   resources :subs do
    resources :topics
   end
  end

  #  recources: parent1 do
  #   recources :child2
  #  end
   
  #  recources: child2 do
  #   recources :child3
  #  end
end
