class Backstage::FirstTimeEntriesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_first_time_entry, only: [:show, :edit, :update, :destroy]

  def new
    @site               = Site.first
    @first_time         = Site.first.first_time
    @first_time_entry   = @first_time.first_time_entries.new
  end

  def edit
    @site               = Site.first
    @first_time         = Site.first.first_time
  end

  # POST /books
  # POST /books.json
  def create
    @site               = Site.first
    @first_time         = Site.first.first_time
    @first_time_entry   = @first_time.first_time_entries.new(first_time_entries_params)

    respond_to do |format|
      if @first_time_entry.save
        format.html { redirect_to  edit_backstage_first_time_url(@first_time_entry.first_time), notice: 'Entry for First Time was successfully created.' }
        # format.json { render :show, status: :created, location: @first_time_entry }
      else
        format.html { render :new }
        # format.json { render json: @first_time_entry.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /blog/first_time/1
  # PATCH/PUT /backstage/first_time/1

  def update
    @site = Site.first
    @first_time = @site.first_time
    @first_time_entry   = @first_time.first_time_entries.find(params[:id])
    respond_to do |format|
      if @first_time_entry.update(first_time_entries_params)
        format.html { redirect_to backstage_index_path, notice: 'first_time was successfully updated.' }
        # format.json { render :show, status: :ok, location: @first_time }
      else
        format.html { render :edit }
        # format.json { render json: @first_time.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def first_time_entries_params
    params.require(:first_time_entry).permit(:title, 
                                        :article_link,
                                        :article_image_url, 
                                        :release_at, 
                                        :published_on
                                      )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_first_time_entry
    @first_time_entry = FirstTimeEntry.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def wallpaper_params
    params.require(:first_time_entry).permit(:title,
    :article_link,
    :article_image_url, 
    :release_at, 
    :published_on
    )
  end

end
