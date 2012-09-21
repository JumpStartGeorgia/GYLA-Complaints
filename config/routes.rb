BootstrapStarter::Application.routes.draw do

  resources :statuses

  resources :violation_types

  resources :categories

  resources :election_precinct_numbers

  resources :election_district_names

  resources :complaints

  match '/unlink/:file_id', :to => 'complaints#unlink', :as => :unlink, :via => :get

	devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

	namespace :admin do
		resources :users
	end

	match '/admin', :to => 'admin#index', :as => :admin, :via => :get

	root :to => 'root#index'

	match '', :to => redirect("/") # handles /
	match '*path', :to => redirect("/") # handles /not-a-locale/anything

end
