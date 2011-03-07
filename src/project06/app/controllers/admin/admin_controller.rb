class Admin::AdminController < ApplicationController
    before_filter :require_user
    filter_access_to :all

    def index
      @games = Game.find(:all, :order => :title )
    end

    protected

        def permission_denied
            flash[:error] = "You don't have permission to access that page"
            redirect_to root_url
        end
end
