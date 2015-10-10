class TagsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
    @notes = current_user.notes.tagged_with(params[:tag]).where(:trash => false)
     render 'notes/index.html.erb'
  end
end
