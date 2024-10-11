Rails.application.routes.draw do
  resources :urls
  root to: "urls#index"

  get "most_visited" => "urls#most_visited"
  get "visit/:short_url" => "urls#visits", as: :visit

  get "up" => "rails/health#show", as: :rails_health_check
end
