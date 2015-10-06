class TrashedNotesController < ApplicationController
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
  
end
