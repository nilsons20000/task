Rails.application.routes.draw do
  get 'welcome/index'

  resources :iteams do
    collection do
      get :edit_me
      put :update_me
      put :update_iteam
      get :edit_iteam
    end
    resources :taskers do
    end
  end

  root 'welcome#index'


end