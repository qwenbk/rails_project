# nested_start
# Удаление одной роли
@delete_one_ru_hsl = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()
# Включаем все кнопки удаления
@del_all_rus_hsl = ->
  $('a.remove_hsl').on 'click', ->
    window.delete_one_ru_hsl($(this))
    false
  false
# Включаем кнопку добавления роли
@add_new_ru_hsl = ->
  $('#add_hsl_link').on 'click', ->
    # Подменяем временный id с фразой new_ru на случайной число
    new_id = new Date().getTime()
    regexp = new RegExp("new_hsl", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)

    # Вставляем на страницу
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    # Если бы были даты с datepicker-ом
    window.datepicker_activation_by_item(panel)
    # Включаем у новой роли кнопку удаления
    # Её раньше не было, поэтому при зарузке страницы она не включалась
    panel.find('a.remove_hsl').on 'click', ->
      window.delete_one_ru_hsl($(this))
      false
    false
# Запуск всего вышеописанного
ru_ready_hsl = ->
  window.add_new_ru_hsl()
  window.del_all_rus_hsl()
$(document).on 'page:load', ru_ready_hsl # Включаем при ajax обновлении страницы
$(document).ready ru_ready_hsl # Включаем при обычном обновлении страницы
# nested_finish
