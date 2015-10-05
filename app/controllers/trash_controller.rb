class TrashController < ApplicationController
  def show
    @trashed_notes = Note.where(:trash => true)
  end 
  
  def trash
    @note = Note.find_by_id(params[:note_id]).update(:trash => true)
    @note.save
  end
  
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def restore
    @note = Note.find_by_id(params[:note_id]).update(:trash => false)
    @note.save
  end
end
