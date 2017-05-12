module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'На главную',
      :icon => 'home',
      :controller => :welcome,
      :action => :index
    }
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'},
    ]} if @current_role_user.try(:is_admin?)
    result << {
      :name => 'Больница',
      :icon => 'ambulance',
      :children => [
      {:name => 'Палаты',
       :controller => :wards, :action => :index,
       :icon => 'user-md',
       :class => 'long'},
       {:name => 'Амбулаторные карты',
        :controller => :hospital_stay_lists, :action => :index,
        :icon => 'list-alt',
        :class => 'long'}
    ]}
    result
  end

  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles', 'wards', 'hospital_stay_lists'
      ctr.to_s == controller_name.to_s
    else
      false
    end
  end
end
