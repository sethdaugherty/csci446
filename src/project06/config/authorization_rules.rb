authorization do
  role :admin do
    includes :member
    has_permission_on [:admin, :admin_users, :admin_roles], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  role :member do
    has_permission_on [:games], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    #has_permission_on [:admin_users], :to => [:edit, :update] do if_attribute :user.user_id => is{ user.user_id } end
    has_permission_on [:admin_users], :to => [:edit, :update] do if_attribute :id => is {user.id} end
  end

  role :guest do
    has_permission_on [:games], :to => [:index]
    has_permission_on [:admin_users], :to => [:new, :create]
  end
end
