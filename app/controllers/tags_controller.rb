class TagsController < ApplicationController
  def index
  end

  def show
     @notes = Note.tagged_with(params[:tag])
     render 'notes/index.html.erb'
  end
end
