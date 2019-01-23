Rails.application.routes.draw do
  root 'poem#index'
  get 'poem/new'
  post 'poem/create'
  get 'poem/:hash', to: 'poem#show', constraints: { hash: /[-_a-zA-Z0-9=]{1,2000}/ }, as: 'poem_show'
  # get '*other', to: 'poem#error', as: 'error'
end
