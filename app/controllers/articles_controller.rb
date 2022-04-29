class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update update_gems destroy]

  def index
    # render 'articles/show'
    @articles = Article.all
    @random_quote = QuoteRandomizer::Client.randomize.dig(:data, 'text')
  end

  def show; end

  def update_gems
    if current_user.get_gem_balance.positive?
      @gem_transfer = GemTransfer.create(author_id: @article.author_id, article_id: @article.id,
                                         user_id: current_user.id, gem: 1)
      if @gem_transfer.save
        redirect_to @article, notice: 'Gems rewarded to this brilliant article!'
      else
        redirect_to @article, notice: 'Insufficient gem balance'
      end
    else
      redirect_to @article, notice: 'Insufficient gem balance'
    end
  end

  def new
    @article = Article.new
  end

  def create
    # strong parameters
    # permit! ==> means accept ALL params
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new

    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :author_id)
  end
end
