class ArticlesController < ApplicationController
  def index
  	@articles = Article.text_search(params[:query]).page(params[:page]).per_page(3)
  end

  def new
  	@article = Article.new
  end

  def edit
  	@article = Article.find_by_id(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end


  def update
  	@article = Article.find_by_id(params[:id])
 	if @article.update_attributes(article_params)
 		flash[:success] = "Article updated!"
 		redirect_to articles_path
 	else
 		render 'edit'
 	end
  end

  def destroy
	@article = Article.find_by_id(params[:id])
	if @article.destroy
		flash[:success] = 'Article was destroyed!'
	else
	    flash[:warning] = 'Error destroying article...'
	end
	redirect_to articles_path
  end

  def create
  	@article = Article.new(article_params)
  	if @article.save
  		flash[:success] = "Article was created!"
  		redirect_to articles_path
  	else
  		render 'new'
  	end
end

private

	def article_params
		params.require(:article).permit(:title, :text)
	end
end


