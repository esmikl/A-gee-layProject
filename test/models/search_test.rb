require 'test_helper'

class NoteTest < ActiveSupport::TestCase
    test "should find match on title" do
        test_note = Note.create(title: "Cake", tag: "Cooking", content: "Flour, sugar, eggs. Mix ingredients")
        assert_equal test_note, Note.find_all_by_query("cake").first
    end

    test "should find 2 matches on title" do
        Note.create!(title: "Cake", tag: "Cooking", content: "Flour, sugar, eggs. Mix ingredients")
        Note.create!(title: "Pancakes", tag: "Cooking", content: "Flour, sugar, eggs. Mix ingredients in large bowl")
        assert_equal 2, Note.find_all_by_query("cake").count
    end
    
    test "should find a match on tags" do
          test_note = Note.create(title: "Cake", tag: "Cooking, baking", content: "Flour, sugar, eggs. Mix ingredients")
        assert_equal test_note, Note.find_all_by_query("cooking").first
    end
    
    test "should find a match on content" do
        test_note = Note.create(title: "Cake", tag: "Cooking, baking", content: "Flour, sugar, eggs. Mix ingredients")
        assert_equal test_note, Note.find_all_by_query("mix").first
    end
end