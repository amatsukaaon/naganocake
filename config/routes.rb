Rails.application.routes.draw do

# 顧客
# URL /customers/sign_in
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者
# URL /admin/sign_in
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace  :admin do
    resources :items, :customers, :tweets
    get 'admin/items/:id/edit' => 'admin/items#edit', as: 'edit_admin_item'
    get 'admin/customers/:id/edit' => 'admin/customers#edit', as: 'edit_admin_customer'

  end

     scope module: :public do
       root to: 'homes#top'
    resources :items, :cart_items, only: [:new, :create, :index, :show]
    resources :customers,  only: [:new, :create, :index]
     get 'customers/information/edit' => 'customers#edit'
     get 'customers/my_page' => 'customers#show', as: 'mypage'
     patch 'customers/information' => 'customers#update'
     get 'customers/confirm' => 'customers#confirm'
     patch 'customers/withdraw' => 'customers#withdraw'
     get 'about' => 'homes#about', as: 'about'


  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html




end
