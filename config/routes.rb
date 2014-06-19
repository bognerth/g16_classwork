G16Classwork::Application.routes.draw do
  root :to => 'classtests#index'  
  
  resources :studentanswers do
    collection do 
      post 'multiple_choice'
    end
  end

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

  resources :studenttests do
    member do
      get 'state'
      get 'finish'
      get 'result'
      get 'result_details'
      get 'download'
      get 'refresh_points'
    end
    collection do
      get 'get_for_valuation'
      get 'results_for_teacher'
      get 'refresh_allpoints'
    end
  end

  resources :classtests do    
    member do
      get 'state'
      get 'students'
      get 'addstudents'
    end
  end

end
