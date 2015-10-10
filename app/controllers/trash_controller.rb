class TrashController < ApplicationController
  before_action :authenticate_user!
  def show
    @trashed_notes = current_user.notes.where(:trash => true)
  end 
  
  def trash
    @note = current_user.notes.find(params[:note_id]).update(:trash => true)
    @note.save
  end

end
