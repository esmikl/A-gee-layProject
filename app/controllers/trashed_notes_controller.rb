class TrashedNotesController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  
  def update
    @note = Note.find(params[:id])
    @note.trash = false
    @note.save
    redirect_to trash_path, notice: "Note has been successfully restored."
  end
  
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to trash_path, notice: "Note was permanently deleted."
  end
  
  def emptyTrash
    @trashed_notes = Note.where(:trash => true)
    @trashed_notes.destroy_all
    redirect_to(:back, notice: "Your trash is empty.")
  end
  
end
