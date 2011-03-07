# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  helper_method :current_user, :current_user_session, :admin?, :member?, :get_game_count, :get_game_percent_rated

  private

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end

    def require_user
      unless current_user
        flash[:error] = "You must log in for access"
        redirect_to root_url
        return false
      end
    end

    def require_no_user
      if current_user
        flash[:error] = "You must be logged out"
        redirect_to admin_root_url
        return false
      end
    end

    def admin?
      if current_user.role.name == "admin"
        return true
      else
        return false
      end

    end

    def member?
      if current_user == nil
        return false
      end

      if admin?
        return true
      else
        if current_user.role.name == "member"
          return true
        else
          return false
        end
      end
    end

# Return the number of games owned by the
  # specified user
    def get_game_count( user_id )
        return Game.count(:conditions => ["user_id = ?", user_id])
    end

    # Return the number of games owned by the
    # specified user that are rated
    def get_rated_game_count( user_id )
      return Game.count(:conditions => ["user_id = ? AND rating != '' AND rating IS NOT NULL", user_id])
    end

    # Return the percent of games owned by the
    # specified user where the rating is not null
    def get_game_percent_rated( user_id )
      return 100.0 * get_rated_count(user_id) / get_count( user_id )
    end

end
