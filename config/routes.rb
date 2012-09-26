BootstrapStarter::Application.routes.draw do

  resources :statuses

  resources :violation_types

  resources :categories

  resources :election_precinct_numbers

  resources :election_district_names

  resources :complaints

  match '/move_to_higher_level/:id', :to => 'complaints#move_to_higher_level', :as => :move_to_higher_level, :via => :get

  match '/unlink/:file_id', :to => 'complaints#unlink', :as => :unlink, :via => :get

  resources :cec_form_children

  resources :cec_forms

  resources :dec_form_children

  resources :dec_forms

  resources :pec_forms

  resources :complaints

	namespace :admin do
		resources :users
	end

	devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

	root :to => 'root#index'

	match '', :to => redirect("/") # handles /
	match '*path', :to => redirect("/") # handles /not-a-locale/anything

end
