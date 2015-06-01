module DashboardsHelper

  def show_back_link(controller, action)
    (%w(albums articles).include?(controller) &&  %w(new edit).include?(action)) ? true : false
  end

  def get_back_link(controller)
    controller.to_s == 'articles' ? dashboard_articles_path : dashboard_portfolio_path
  end

end
