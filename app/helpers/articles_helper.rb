module ArticlesHelper

  def get_article_url(article)
    action_name == 'new' ? articles_path : article_path(article)
  end
end
