Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'users/following'
  get 'users/followers'
  get 'relationships/following'
  devise_for :users
  root 'lucks#top'
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  resources :targets do 
    collection do
       get 'top'
     end
   end
  resources :users
  resources :relationships
  resources :lucks do
    collection do
      post :confirm
    end
  end
end
