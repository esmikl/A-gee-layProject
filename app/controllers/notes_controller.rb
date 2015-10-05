class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy, :share, :unshare]

  # GET /notes
  # GET /notes.json
  def index
    if params[:q]
      @notes = Note.find_all_by_query(params[:q])
    else
      @notes = Note.all.order('updated_at DESC')
    end
    if @notes == []
      render "notes/no_notes"
    else
      render :index
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to edit_note_path(@note), notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to edit_note_path(@note), notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def process_markdown
    text_to_transform = params[:text]
    html = Kramdown::Document.new(text_to_transform).to_html
    render :text => html
  end
  
  def share
    @note.share
    @note.save
    redirect_to @note, notice: 'Note was successfully shared.'
  end
  
  def unshare
    @note.unshare
    @note.save
    redirect_to @note, notice: 'Note was successfully unshared.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :tag, :content, :tag_list)
    end
end
