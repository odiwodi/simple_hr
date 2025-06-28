ActiveAdmin.register AdminUser do
  menu parent: 'Configuration'
  permit_params :email, :password, :password_confirmation, :first_name, :middle_name, :last_name, :username, :role_id
  actions :all, except: [:destroy]

  index do
    selectable_column
    id_column
    column :first_name
    column :middle_name
    column :last_name
    column :email
    column :username
    column :role do |admin_user|
      admin_user.role&.name&.humanize
    end
    column :current_sign_in_at
    column :created_at
    actions
  end

  filter :email
  filter :username

  show do
    attributes_table do
      row :id
      row :first_name
      row :middle_name
      row :last_name
      row :email
      row :username
      row :role do |admin_user|
        admin_user.role&.name&.humanize
      end
      row :current_sign_in_at
      row :last_sign_in_at
      row :sign_in_count
      row :created_at
      row :updated_at
    end
  end
  
  form do |f|
    f.inputs do
      f.input :email
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :username
      f.input :role, as: :select, collection: Role.all.map { |role| [role.name.humanize, role.id] }
    end
    f.actions
  end

  member_action :edit_password, method: :get do
    @admin_user = AdminUser.find(params[:id])
    render 'admin/admin_users/edit_password', layout: false
  end

  member_action :update_password, method: :patch do
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update(permitted_params[:admin_user].slice(:password, :password_confirmation))
      redirect_to admin_admin_user_path(@admin_user), notice: "Password updated successfully"
    else
      render 'admin/admin_users/edit_password', layout: false
    end
  end

  action_item :edit_password, only: :show do
    link_to 'Change Password', edit_password_admin_admin_user_path(resource)
  end

end
