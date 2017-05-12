module ApplicationHelper
  def lnil(date)
    date.nil? ? 'не указано' : l(date)
  end
  def lnilT(date)
    date.nil? ? 'не указано' : DateTime.parse(date.to_s).strftime("%d.%m.%Y %H:%M")
  end

  def breadcrumb_tag(&block)
    render 'application/breadcrumb', block: capture(&block)
  end
end
