Rails.application.routes.draw do
  resources :courses
  root "top_pages#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
