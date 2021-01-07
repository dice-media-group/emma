class Backstage::BookInfoController < ApplicationController
    def edit
        @site = Site.first
        @book_info = @site.book_info
    end

    # PATCH/PUT /blog/book_info/1
    # PATCH/PUT /backstage/book_info/1

    def update
        @site = Site.first
        @book_info = @site.book_info

        respond_to do |format|
            if @book_info.update(book_info_params)
                format.html { redirect_to backstage_index_path, notice: 'book_info was successfully updated.' }
                # format.json { render :show, status: :ok, location: @book_info }
            else
                format.html { render :edit }
                # format.json { render json: @book_info.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    # Only allow a list of trusted parameters through.
    def book_info_params
        params.require(:book_info).permit(:billboard_image_url, :billboard_image_title)
    end
    
end
