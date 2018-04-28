Rails.application.routes.draw do
  devise_for :users
  resources :students
  resources :teachers
  resources :subjects
  resources :degrees do
    get 'add_subjects'
    post 'add_subjects', :action => 'copy'
    patch 'add_subjects', :action => 'copy'
    get "/degrees", to: "degrees#index", as: :degrees
  end
  resources :reports do
    collection do
      get 'students'
      get 'teachers'
      post 'index'
      post 'degrees'
      post 'teachers'
      # post 'index', :action => 'teachers'
      # post 'index', :action => 'degrees'
    end
  end
  
  

    mount ReportsKit::Engine, at: '/students/index.html.haml'
    # ...
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
