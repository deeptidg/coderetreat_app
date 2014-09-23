CoderetreatApp::Application.routes.draw do
  resources :coderetreats, only: [] do
    get :running_today, :on => :collection

    #get :edit_status, :on => :member
    #put :update_status, :on => :member

    resource :status, controller: 'status', only: [:edit, :update]
  end
end