class DashboardController < ApplicationController
  before_action :authenticate_user!
  def show
      @recent_notes = Note.order('updated_at DESC').limit(5)
  end
end
