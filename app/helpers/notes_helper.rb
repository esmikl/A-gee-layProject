module NotesHelper
  def kramdown(text)
    # if text is nil, or "", there's no reason to process.
    return "" if text.blank?   # blank is Rails' object shortcut for "nil or emptystring"
    Kramdown::Document.new(text).to_html.html_safe
  end
end
