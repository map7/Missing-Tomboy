require 'sinatra'
require 'rexml/document'
include REXML
require 'haml'

DIR = "#{ENV['HOME']}/.local/share/tomboy"
BAK = "#{DIR}/Backup"

def get_missing
  # Find difference between working notes and missing
  files = %x[diff -q #{DIR} #{BAK}]

  # Get missing
  missing = files.split("\n").select { |file| file =~ /Only in.*Backup: /i }
  missing = missing.reject { |file| file =~ /.swp$/}
  missing = missing.collect {|file| file.gsub(/Only in.*Backup: /,'') }

  # Get the document information and build array
  missing.collect { |filename|
    file = File.new("#{BAK}/#{filename}")
    note = Document.new(file).root

    { :title => note.elements['title'].text,
      :content => note.elements['text/note-content'].text,
      :file => file }
  }
end

get '/' do
  @missing = get_missing
  haml :index
end

get '/show' do
  @file = get_missing[params[:id].to_i]
  haml :show
end

