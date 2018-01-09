Rails.application.routes.draw do
  root to: 'top#index'
    resources :diaries do
    collection do
      post :confirm
    end
  end
  
end
  