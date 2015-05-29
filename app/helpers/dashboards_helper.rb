module DashboardsHelper

  def show_back_link(params)
    (params[:controller].to_s == 'albums' &&  %w(new edit).include?(params[:action].to_s)) ? true : false
  end

end
