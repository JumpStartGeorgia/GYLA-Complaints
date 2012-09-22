BootstrapStarter::Application.routes.draw do
  resources :cec_form_children

  resources :cec_forms

  resources :dec_form_children

  resources :dec_forms

  resources :pec_forms

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
