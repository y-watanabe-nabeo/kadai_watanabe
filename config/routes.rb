Rails.application.routes.draw do
  resources :courses do
    member do
      get :confirm_delete
    end
  end

  root "top_pages#top"
  post "top_pages/search_keyword"
  post "top_pages/search_category"
  get "top_pages/search_keyword"
  get "top_pages/search_category"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
