class AutocompleteController < ApplicationController
  autocomplete :tag, :name
  #def autocomplete_tag_name
    #@tags = ActsAsTaggableOn::Tag.all.map{|t| t.name}.to_json
  #end
end
