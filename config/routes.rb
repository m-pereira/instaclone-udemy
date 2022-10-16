Rails.application.routes.draw do
  devise_for :user
  root 'site#index'
end
