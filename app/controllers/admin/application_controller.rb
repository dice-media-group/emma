# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin

    # before_action :authenticate_admin # TODO

    def authenticate_admin
      # TODO Add authentication logic here.
      # Eventually an OmniAuth method should be placed here
      redirect_to '/', alert: 'Not authorized.' unless current_user && access_whitelist
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end

    private
    def access_whitelist
      current_user.try(:admin?) || current_user.try(:door_super?)
    end
  end
end
