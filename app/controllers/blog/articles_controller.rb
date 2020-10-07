class Blog::ArticlesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_blog_article, only: [:show, :edit, :update, :destroy]

  # GET /blog/articles
  # GET /blog/articles.json
  def index
    @blog_articles = Blog::Article.all
  end

  # GET /blog/articles/1
  # GET /blog/articles/1.json
  def show
  end

  # GET /blog/articles/new
  def new
    @blog_article = Blog::Article.new
  end

  # GET /blog/articles/1/edit
  def edit
  end

  # POST /blog/articles
  # POST /blog/articles.json
  def create
    @blog_article = Blog::Article.new(blog_article_params)
    @blog_article.user = current_user

    respond_to do |format|
      if @blog_article.save
        format.html { redirect_to @blog_article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @blog_article }
      else
        format.html { render :new }
        format.json { render json: @blog_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog/articles/1
  # PATCH/PUT /blog/articles/1.json
  def update
    respond_to do |format|
      if @blog_article.update(blog_article_params)
        format.html { redirect_to @blog_article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_article }
      else
        format.html { render :edit }
        format.json { render json: @blog_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog/articles/1
  # DELETE /blog/articles/1.json
  def destroy
    @blog_article.destroy
    respond_to do |format|
      format.html { redirect_to blog_articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_article
      @blog_article = Blog::Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_article_params
      params.require(:blog_article).permit(:title, :body, :pinned_value)
    end
end
