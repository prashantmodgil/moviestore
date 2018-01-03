ActiveAdmin.register User do

 actions :all
 permit_params :email ,:name , :password ,:image
 decorate_with UserDecorator

  index do
    selectable_column
    id_column
    column :email
    column :image
    column :name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  filter :name
  filter :email

  action_item :new_user,only: :index do

  
end
  form do |f|
      f.inputs do
        f.input :email
        f.input :name
        f.input :password
        f.input :password_confirmation
        f.input :image
      end
      f.actions
end
end
