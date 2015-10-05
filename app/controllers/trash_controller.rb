class TrashController < ApplicationController
  def show
    @trashed_notes = Note.where(:trash => true)
  end 
end
