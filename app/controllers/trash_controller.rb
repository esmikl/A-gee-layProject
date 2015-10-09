class TrashController < ApplicationController
  before_action :authenticate_user!
  def show
    @trashed_notes = Note.where(:trash => true)
  end 
  
  def trash
    @note = Note.find(params[:note_id]).update(:trash => true)
    @note.save
  end

end
