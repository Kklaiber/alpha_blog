class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def update

    if @article.update(article_params)
      flash[:notice] = "Your article was successfully updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def create
    #render plain: params[:article].inspect -----> this shows the hash from the params hash
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Your article was successfully created!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @article.destroy

    flash[:notice] = "Your article was deleted."
    redirect_to articles_path
  end

  #This defines the article params method that is used in the create action. This 'white lists' the values of article. The params.require takes in the :article KEY and .permit the :title and :description VALUES.
  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
