module AboutsHelper

  def get_about_path
    About.first.present? ? dashboards_about_path(About.first) : dashboards_abouts_path
  end

  def get_about_url(about)
    about.nil? ? dashboards_abouts_path : dashboards_about_path(about)
  end
end
