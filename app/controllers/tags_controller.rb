class TagsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
    @notes = Note.tagged_with(params[:tag]).where(:trash => false)
     render 'notes/index.html.erb'
  end
end
