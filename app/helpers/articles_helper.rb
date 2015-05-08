module ArticlesHelper

  def get_article_url(action, article)
    if action == 'new'
      articles_path
    else
      article_path(article)
    end
  end
end
