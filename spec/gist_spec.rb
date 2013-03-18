require 'spec_helper'

describe Gist do 
  context '.create' do 
    it 'POSTs a new Gist to the user\'s account' do
      gist = {:public => 'true',
              :description => 'a test gist',  
              :files => {'test_file' => {:content => 'puts "hello world!"'}} 
            }

      stub = stub_request(:post, "https://mfpiccolo:sac93%21ron@api.github.com/gists").
         with(:body => {"{\"public\":\"true\",\"description\":\"a test gist\",\"files\":{\"test_file\":{\"content\":\"puts \\\"hello world!\\\"\"}}}"=>true},
              :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Faraday v0.8.6'}).
         to_return(:status => 200, :body => "", :headers => {})
      Gist.create(gist)
      stub.should have_been_requested
    end
  end
end