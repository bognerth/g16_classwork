G16Classwork::Application.routes.draw do
  root :to => 'classtests#index'  
  resources :studentanswers

  resources :answers 

  resources :questions do
    collection do
      get 'lostandfound'
      get 'clone'
    end
    member do 
      get 'answers'
    end
  end

  resources :testtypes

  resources :studenttests

  resources :classtests do    
    member do
      get 'state'
    end
  end

end
