class SharedNotesController < ApplicationController
  
  def show
    slug = params[:id]
    @note = Note.find_by_slug(slug)
    if @note == nil
      render 'shared_notes/no_shared_notes'
    else
      render :show
    end
  end
  
end
