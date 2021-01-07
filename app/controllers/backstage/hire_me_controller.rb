class Backstage::HireMeController < ApplicationController
    def edit
        @site = Site.first
        @hire_me = @site.hire_me
    end

    # PATCH/PUT /blog/hire_me/1
    # PATCH/PUT /backstage/hire_me/1

    def update
        @site = Site.first
        @hire_me = @site.hire_me

        respond_to do |format|
        if @hire_me.update(hire_me_params)
        format.html { redirect_to backstage_index_path, notice: 'hire_me was successfully updated.' }
        # format.json { render :show, status: :ok, location: @hire_me }
        else
        format.html { render :edit }
        # format.json { render json: @hire_me.errors, status: :unprocessable_entity }
        end
    end
    end

    private

    # Only allow a list of trusted parameters through.
    def hire_me_params
    params.require(:hire_me).permit(:rt_body, :billboard_image_filename, :headline, :learn_more_text, :learn_more_pdf_link)
    end
    
end
