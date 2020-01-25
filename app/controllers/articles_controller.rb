class ArticlesController < ApplicationController
  def new
    @article = Article.new
    @name = params[:name]
  end

  def index
    @name = params[:name]
  end

  def show
    @article = Article.find(params[:id])
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

  #This defines the article params method that is used in the create action. This 'white lists' the values of article. The params.require takes in the :article KEY and .permit the :title and :description VALUES.
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
