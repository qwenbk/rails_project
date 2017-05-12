module HospitalStayListsHelper
  def link_to_add_hsl(form, hospital_stay_lists)

    new_object = HospitalStayList.new()

    fields = form.fields_for(:hospital_stay_lists, new_object,
      :child_index => 'new_hsl') do |hsl|
      render('hospital_stay_lists/one_hsl_form', hsl: hsl, i: 'Новая')
    end

    link_to(?#, class: 'btn btn-info',
        id: 'add_hsl_link', data: {content: "#{fields}"}) do
      fa_icon("plus") + " Новая запись"
    end

  end

  def link_to_remove_hsl(form)

    form.hidden_field(:_destroy, class: 'remove_fields') +
        # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
        link_to(?#, class: 'remove_fields remove_hsl') do
      fa_icon('times', title: 'Удалить Запись') + ' Удалить'
    end
  end
end
