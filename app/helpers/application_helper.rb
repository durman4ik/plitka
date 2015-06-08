module ApplicationHelper

  def translate_content(rus, bel, yaml)
    if rus.present?
      if I18n.locale.to_s == 'ru' || !bel.present?
        raw rus
      else
        raw bel
      end
    else
      yaml
    end
  end

end
