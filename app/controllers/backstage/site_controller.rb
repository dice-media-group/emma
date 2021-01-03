class Backstage::SiteController < ApplicationController
  # before_action :set_site, only: [:show, :edit, :update, :destroy]

  # GET /site
  def index
    @site = Site.first
  end

end
