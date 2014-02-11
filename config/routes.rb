G16Classwork::Application.routes.draw do
  root :to => 'tests#index'  
  resources :studentanswers

  resources :answers

  resources :questions do
    collection do
      get 'lostandfound'
      get 'clone'
    end
  end

  resources :testtypes

  resources :studenttests

  resources :tests do    
    member do
      get 'state'
    end
  end

end
