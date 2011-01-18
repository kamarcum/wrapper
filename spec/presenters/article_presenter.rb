class ArticlePresenter
  include Wrapper::Presenter

  def title
    "I was overwritten in the presenter"
  end
end
