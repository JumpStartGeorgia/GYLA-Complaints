BootstrapStarter::Application.routes.draw do
  resources :complaints

	devise_for :users

	namespace :admin do
		resources :users
	end

	match '/admin', :to => 'admin#index', :as => :admin, :via => :get

	root :to => 'root#index'

	match '', :to => redirect("/") # handles /
	match '*path', :to => redirect("/") # handles /not-a-locale/anything

end
