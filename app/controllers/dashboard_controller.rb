class DashboardController < ApplicationController
  before_action :authenticate_user!
  def show
    @recent_notes = current_user.notes.order('updated_at DESC').limit(5)
  end
end
