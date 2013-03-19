require 'gistfile'

class Gist 
attr_reader :description, :public_status, :files

  def initialize(attributes)
    @attributes = attributes
    @description = @attributes['description']
    @public_status = @attributes['public']
    @files = parse_files
  end

  def self.create(options)
    post_response = Faraday.post do |request|
      request.url 'https://api.github.com/gists'
      request.headers['Authorization'] = "Basic " + Base64.encode64("#{$github_username}:#{$github_password}")
      request.body = options.to_json
    end
    Gist.new(JSON.parse(post_response.body))
  end

  def self.list
    get_response = Faraday.get do |request|
      request.url "https://api.github.com/users/#{$github_username}/gists"
    end
  end

  # def ==(other)
  #   if other.class != self.class
  #     false
  #   else
  #   end
  # end

  private

  def parse_files
    @attributes["files"].map {|file| GistFile.new(file) }
  end
end