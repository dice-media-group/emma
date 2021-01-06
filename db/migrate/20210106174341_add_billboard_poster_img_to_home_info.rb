class AddBillboardPosterImgToHomeInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :home_infos, :watch_this_poster_url, :text
  end
end
