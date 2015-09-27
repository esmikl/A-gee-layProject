require 'test_helper'

class NoteTest < ActiveSupport::TestCase
    test "creates a valid note" do
        note = Note.new
        note.title = "Pick up prescriptions"
        note.tag = "important, errands"
        note.content = "Pick up prescriptions from the pharmacy."
        assert note.save
    end
    
    test "check that user provided title" do
        note = Note.new
        assert !note.save
        assert note.errors[:title]
    end
    
    test "check that user entered content" do
        note = Note.new
        assert !note.save
        assert note.errors[:content]
    end
    
    
end
