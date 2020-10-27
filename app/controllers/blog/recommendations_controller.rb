class Blog::RecommendationsController < ApplicationController
  before_action :set_blog_recommendation, only: [:show, :edit, :update, :destroy]

  # GET /blog/recommendations
  # GET /blog/recommendations.json
  def index
    @blog_recommendations = Blog::Recommendation.all
  end

  # GET /blog/recommendations/1
  # GET /blog/recommendations/1.json
  def show
  end

  # GET /blog/recommendations/new
  def new
    @blog_recommendation  = Blog::Recommendation.new
    @entries              = Blog::Entry.all
  end

  # GET /blog/recommendations/1/edit
  def edit
  end

  # POST /blog/recommendations
  # POST /blog/recommendations.json
  def create
    @blog_recommendation = Blog::Recommendation.new(blog_recommendation_params)

    respond_to do |format|
      if @blog_recommendation.save
        format.html { redirect_to @blog_recommendation, notice: 'Recommendation was successfully created.' }
        format.json { render :show, status: :created, location: @blog_recommendation }
      else
        format.html { render :new }
        format.json { render json: @blog_recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog/recommendations/1
  # PATCH/PUT /blog/recommendations/1.json
  def update
    respond_to do |format|
      if @blog_recommendation.update(blog_recommendation_params)
        format.html { redirect_to @blog_recommendation, notice: 'Recommendation was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_recommendation }
      else
        format.html { render :edit }
        format.json { render json: @blog_recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog/recommendations/1
  # DELETE /blog/recommendations/1.json
  def destroy
    @blog_recommendation.destroy
    respond_to do |format|
      format.html { redirect_to blog_recommendations_url, notice: 'Recommendation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_recommendation
      @blog_recommendation = Blog::Recommendation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_recommendation_params
      params.require(:blog_recommendation).permit(:description, :entry_id)
    end
end
