require './lib/gist'
require 'faraday'
require 'json'
require 'base64'

def welcome
  puts "Welcome to the Github command-line client."
  menu
end

def menu
  choice = nil
    puts "Please enter your Github username:"
    $github_username = gets.chomp
    puts "Please enter your Github password:"
    $github_password = gets.chomp
  until choice == 'e'
    puts "What would you like to do?"
    puts "Press 'l' to list your Gists, 'c' to create a new Gist, 'v' to view a Gist, 'u' to update a Gist, or 'd' to delete a Gist."
    puts "Press 'e' to exit."
    case choice = gets.chomp
    when 'l'
      list
    when 'c'
      create
    when 'v'
      view
    when 'u'
      update
    when 'd'
      delete
    when 'e'
      exit
    else
      invalid
    end
  end
end

def create
  public_attribute = nil
  while public_attribute.nil?
    puts "Would you like this Gist to be public? Type 'y' or 'n'."
    public_attribute = gets.chomp
    case public_attribute
    when 'y'
      public_attribute = true
    when 'n'
      public_attribute = false
    else
      puts "That wasn't a valid choice."
    end
  end
  puts "Type a description for the Gist, or hit Enter for no description."
  description = gets.chomp
  puts "What would you like the name of the file in the Gist to be?"
  filename = gets.chomp
  puts "Now, type the content of the Gist:"
  content = gets.chomp
  files = {filename => {:content => content}}

  response = Gist.create(:public => public_attribute, :description => description, :files => files)
  if response.headers['status'] == "201 Created"
    puts "Your gist was created"
  else
    puts "There was an error createing your gist"
  end
end

def list
  response = Gist.list
  gists = JSON.parse(response.body)
  gist.each do |gist_response| 
    new_gist = Gist.new(gist_response)
    p new_gist.file_names
    p new_gist.description
  end
end

welcome

















