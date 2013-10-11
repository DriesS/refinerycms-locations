Rails.application.routes.draw do
  mount Refinery::Core::Engine, :at => "/"
end

Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :locations do
    resources :locations, :path => '', :only => [:index, :show, :search] do 
      get 'search', :on => :collection 
    end
  end

  # Admin routes
  namespace :locations, :path => '' do
    namespace :admin, :path => 'refinery/locations' do
      resources :locations, :except => :show do
        collection do
          post :update_positions
        end
      end
      
      resources :regions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end

