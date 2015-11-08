module Admin
  class ApplicationController < ::ApplicationController
    before_action :authenticate_user!
    before_action :check_for_admin_user

    protected

    def check_for_admin_user
      render nothing: true unless current_user.admin
    end
  end
end
