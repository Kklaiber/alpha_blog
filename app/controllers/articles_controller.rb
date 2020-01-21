class ArticlesController < ApplicationController
  def new
    @article = Article.new
    @name = params[:name]
  end

  def index
    @name = params[:name]
  end

  def show
    
  end

  def create
    #render plain: params[:article].inspect -----> this shows the hash from the params hash
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end

  #This defines the article params method that is used in the create action. This 'white lists' the values of article. The params.require takes in the :article KEY and .permit the :title and :description VALUES.
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
