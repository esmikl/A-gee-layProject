json.array!(@notes) do |note|
  json.extract! note, :id, :title, :tag, :content
  json.url note_url(note, format: :json)
end
