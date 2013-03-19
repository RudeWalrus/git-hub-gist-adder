require 'spec_helper'

$github_username = 'epicodusstudent'
$github_password = 'Poiu0987'

describe Gist do

  context '#initialize' do
    it 'initializes an insance of Gist with an argument' do
      attributes = JSON.parse("{\"public\":\"true\",\"description\":\"a test gist\",\"files\":{\"test_file\":{\"content\":\"puts \\\"hello world!\\\"\"}}}")
      new_gist = Gist.new(attributes)
      new_gist.should be_an_instance_of Gist
    end
  end


  context '.create' do 
    it 'POSTs a new Gist to the user\'s account' do
      gist = {:public => 'true',
              :description => 'a test gist',  
              :files => {'test_file' => {:content => 'puts "hello world!"'}} 
            }

      stub = stub_request(:post, "https://epicodusstudent:Poiu0987@api.github.com/gists").with(:body => gist.to_json).to_return(:body => "{\"public\":\"true\",\"description\":\"a test gist\",\"files\":{\"test_file\":{\"content\":\"puts \\\"hello world!\\\"\"}}}")
      Gist.create(gist)
      stub.should have_been_requested
    end

    it 'returns an instance of Gist' do 
      gist = {:public => 'true',
              :description => 'a test gist',  
              :files => {'test_file' => {:content => 'puts "hello world!"'}} 
            }

      stub = stub_request(:post, "https://epicodusstudent:Poiu0987@api.github.com/gists").with(:body => gist.to_json).to_return(:body => "{\"public\":\"true\",\"description\":\"a test gist\",\"files\":{\"test_file\":{\"content\":\"puts \\\"hello world!\\\"\"}}}")
      new_gist = Gist.create(gist)
      new_gist.should be_an_instance_of Gist
    end
  end

  context '.list' do
    it 'lists all the the current gists' do
      stub = stub_request(:get, "https://api.github.com/users/epicodusstudent/gists")
      Gist.list
      stub.should have_been_requested
    end
  end

  context '#readers' do
    it 'returns the description of the gist' do 
      gist = {:public => 'true',
                :description => 'a test gist',  
                :files => {'test_file' => {:content => 'puts "hello world!"'}} 
              }

      stub = stub_request(:post, "https://epicodusstudent:Poiu0987@api.github.com/gists").with(:body => gist.to_json).to_return(:body => "{\"public\":\"true\",\"description\":\"a test gist\",\"files\":{\"test_file\":{\"content\":\"puts \\\"hello world!\\\"\"}}}")
      new_gist = Gist.create(gist)
      new_gist.description.should eq "a test gist"
    end

    it 'returns the public_status of the gist' do
      gist = {:public => 'true',
                :description => 'a test gist',  
                :files => {'test_file' => {:content => 'puts "hello world!"'}} 
              }
      stub = stub_request(:post, "https://epicodusstudent:Poiu0987@api.github.com/gists").with(:body => gist.to_json).to_return(:body => "{\"url\":\"https://api.github.com/gists/5191469\",\"forks_url\":\"https://api.github.com/gists/5191469/forks\",\"commits_url\":\"https://api.github.com/gists/5191469/commits\",\"id\":\"5191469\",\"git_pull_url\":\"https://gist.github.com/5191469.git\",\"git_push_url\":\"https://gist.github.com/5191469.git\",\"html_url\":\"https://gist.github.com/5191469\",\"files\":{\"test_for_gistfile.rb\":{\"filename\":\"test_for_gistfile.rb\",\"type\":\"application/ruby\",\"language\":\"Ruby\",\"raw_url\":\"https://gist.github.com/raw/5191469/607ad8a1f765979ee7f723b4542a8aa00c9c54d9/test_for_gistfile.rb\",\"size\":51,\"content\":\"this is a test_file to give us an extra file to use\"},\"test_for_gistfile2.rb\":{\"filename\":\"test_for_gistfile2.rb\",\"type\":\"application/ruby\",\"language\":\"Ruby\",\"raw_url\":\"https://gist.github.com/raw/5191469/93057fb727bf5f2f2149ef4e7fae045cfd5426b5/test_for_gistfile2.rb\",\"size\":67,\"content\":\"another test_file to find out what happens when there are two files\"}},\"public\":true,\"created_at\":\"2013-03-18T22:36:14Z\",\"updated_at\":\"2013-03-18T22:36:15Z\",\"description\":\"a test gist\",\"comments\":0,\"user\":{\"login\":\"mfpiccolo\",\"id\":3249825,\"avatar_url\":\"https://secure.gravatar.com/avatar/7c9fda048420a5139f7ed90cc03e708a?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png\",\"gravatar_id\":\"7c9fda048420a5139f7ed90cc03e708a\",\"url\":\"https://api.github.com/users/mfpiccolo\",\"html_url\":\"https://github.com/mfpiccolo\",\"followers_url\":\"https://api.github.com/users/mfpiccolo/followers\",\"following_url\":\"https://api.github.com/users/mfpiccolo/following\",\"gists_url\":\"https://api.github.com/users/mfpiccolo/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/mfpiccolo/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/mfpiccolo/subscriptions\",\"organizations_url\":\"https://api.github.com/users/mfpiccolo/orgs\",\"repos_url\":\"https://api.github.com/users/mfpiccolo/repos\",\"events_url\":\"https://api.github.com/users/mfpiccolo/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/mfpiccolo/received_events\",\"type\":\"User\"},\"comments_url\":\"https://api.github.com/gists/5191469/comments\",\"forks\":[],\"history\":[{\"user\":{\"login\":\"mfpiccolo\",\"id\":3249825,\"avatar_url\":\"https://secure.gravatar.com/avatar/7c9fda048420a5139f7ed90cc03e708a?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png\",\"gravatar_id\":\"7c9fda048420a5139f7ed90cc03e708a\",\"url\":\"https://api.github.com/users/mfpiccolo\",\"html_url\":\"https://github.com/mfpiccolo\",\"followers_url\":\"https://api.github.com/users/mfpiccolo/followers\",\"following_url\":\"https://api.github.com/users/mfpiccolo/following\",\"gists_url\":\"https://api.github.com/users/mfpiccolo/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/mfpiccolo/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/mfpiccolo/subscriptions\",\"organizations_url\":\"https://api.github.com/users/mfpiccolo/orgs\",\"repos_url\":\"https://api.github.com/users/mfpiccolo/repos\",\"events_url\":\"https://api.github.com/users/mfpiccolo/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/mfpiccolo/received_events\",\"type\":\"User\"},\"version\":\"28d81be857ae21a09de13ca8269681c110aced8b\",\"committed_at\":\"2013-03-18T22:36:14Z\",\"change_status\":{\"total\":2,\"additions\":2,\"deletions\":0},\"url\":\"https://api.github.com/gists/5191469/28d81be857ae21a09de13ca8269681c110aced8b\"}]}" )
      new_gist = Gist.create(gist)
      new_gist.public_status.should eq true
    end

    it 'returns the array of GistFiles' do 
      gist = {:public => 'true',
                :description => 'a test gist',  
                :files => {'test_file' => {:content => 'puts "hello world!"'}} 
              }
      gist1 = "{\"url\":\"https://api.github.com/gists/5191469\",\"forks_url\":\"https://api.github.com/gists/5191469/forks\",\"commits_url\":\"https://api.github.com/gists/5191469/commits\",\"id\":\"5191469\",\"git_pull_url\":\"https://gist.github.com/5191469.git\",\"git_push_url\":\"https://gist.github.com/5191469.git\",\"html_url\":\"https://gist.github.com/5191469\",\"files\":{\"test_for_gistfile.rb\":{\"filename\":\"test_for_gistfile.rb\",\"type\":\"application/ruby\",\"language\":\"Ruby\",\"raw_url\":\"https://gist.github.com/raw/5191469/607ad8a1f765979ee7f723b4542a8aa00c9c54d9/test_for_gistfile.rb\",\"size\":51,\"content\":\"this is a test_file to give us an extra file to use\"},\"test_for_gistfile2.rb\":{\"filename\":\"test_for_gistfile2.rb\",\"type\":\"application/ruby\",\"language\":\"Ruby\",\"raw_url\":\"https://gist.github.com/raw/5191469/93057fb727bf5f2f2149ef4e7fae045cfd5426b5/test_for_gistfile2.rb\",\"size\":67,\"content\":\"another test_file to find out what happens when there are two files\"}},\"public\":true,\"created_at\":\"2013-03-18T22:36:14Z\",\"updated_at\":\"2013-03-18T22:36:15Z\",\"description\":\"a test gist\",\"comments\":0,\"user\":{\"login\":\"mfpiccolo\",\"id\":3249825,\"avatar_url\":\"https://secure.gravatar.com/avatar/7c9fda048420a5139f7ed90cc03e708a?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png\",\"gravatar_id\":\"7c9fda048420a5139f7ed90cc03e708a\",\"url\":\"https://api.github.com/users/mfpiccolo\",\"html_url\":\"https://github.com/mfpiccolo\",\"followers_url\":\"https://api.github.com/users/mfpiccolo/followers\",\"following_url\":\"https://api.github.com/users/mfpiccolo/following\",\"gists_url\":\"https://api.github.com/users/mfpiccolo/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/mfpiccolo/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/mfpiccolo/subscriptions\",\"organizations_url\":\"https://api.github.com/users/mfpiccolo/orgs\",\"repos_url\":\"https://api.github.com/users/mfpiccolo/repos\",\"events_url\":\"https://api.github.com/users/mfpiccolo/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/mfpiccolo/received_events\",\"type\":\"User\"},\"comments_url\":\"https://api.github.com/gists/5191469/comments\",\"forks\":[],\"history\":[{\"user\":{\"login\":\"mfpiccolo\",\"id\":3249825,\"avatar_url\":\"https://secure.gravatar.com/avatar/7c9fda048420a5139f7ed90cc03e708a?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png\",\"gravatar_id\":\"7c9fda048420a5139f7ed90cc03e708a\",\"url\":\"https://api.github.com/users/mfpiccolo\",\"html_url\":\"https://github.com/mfpiccolo\",\"followers_url\":\"https://api.github.com/users/mfpiccolo/followers\",\"following_url\":\"https://api.github.com/users/mfpiccolo/following\",\"gists_url\":\"https://api.github.com/users/mfpiccolo/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/mfpiccolo/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/mfpiccolo/subscriptions\",\"organizations_url\":\"https://api.github.com/users/mfpiccolo/orgs\",\"repos_url\":\"https://api.github.com/users/mfpiccolo/repos\",\"events_url\":\"https://api.github.com/users/mfpiccolo/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/mfpiccolo/received_events\",\"type\":\"User\"},\"version\":\"28d81be857ae21a09de13ca8269681c110aced8b\",\"committed_at\":\"2013-03-18T22:36:14Z\",\"change_status\":{\"total\":2,\"additions\":2,\"deletions\":0},\"url\":\"https://api.github.com/gists/5191469/28d81be857ae21a09de13ca8269681c110aced8b\"}]}"
      stub = stub_request(:post, "https://epicodusstudent:Poiu0987@api.github.com/gists").with(:body => gist.to_json).to_return(:body => "{\"url\":\"https://api.github.com/gists/5191469\",\"forks_url\":\"https://api.github.com/gists/5191469/forks\",\"commits_url\":\"https://api.github.com/gists/5191469/commits\",\"id\":\"5191469\",\"git_pull_url\":\"https://gist.github.com/5191469.git\",\"git_push_url\":\"https://gist.github.com/5191469.git\",\"html_url\":\"https://gist.github.com/5191469\",\"files\":{\"test_for_gistfile.rb\":{\"filename\":\"test_for_gistfile.rb\",\"type\":\"application/ruby\",\"language\":\"Ruby\",\"raw_url\":\"https://gist.github.com/raw/5191469/607ad8a1f765979ee7f723b4542a8aa00c9c54d9/test_for_gistfile.rb\",\"size\":51,\"content\":\"this is a test_file to give us an extra file to use\"},\"test_for_gistfile2.rb\":{\"filename\":\"test_for_gistfile2.rb\",\"type\":\"application/ruby\",\"language\":\"Ruby\",\"raw_url\":\"https://gist.github.com/raw/5191469/93057fb727bf5f2f2149ef4e7fae045cfd5426b5/test_for_gistfile2.rb\",\"size\":67,\"content\":\"another test_file to find out what happens when there are two files\"}},\"public\":true,\"created_at\":\"2013-03-18T22:36:14Z\",\"updated_at\":\"2013-03-18T22:36:15Z\",\"description\":\"a test gist\",\"comments\":0,\"user\":{\"login\":\"mfpiccolo\",\"id\":3249825,\"avatar_url\":\"https://secure.gravatar.com/avatar/7c9fda048420a5139f7ed90cc03e708a?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png\",\"gravatar_id\":\"7c9fda048420a5139f7ed90cc03e708a\",\"url\":\"https://api.github.com/users/mfpiccolo\",\"html_url\":\"https://github.com/mfpiccolo\",\"followers_url\":\"https://api.github.com/users/mfpiccolo/followers\",\"following_url\":\"https://api.github.com/users/mfpiccolo/following\",\"gists_url\":\"https://api.github.com/users/mfpiccolo/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/mfpiccolo/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/mfpiccolo/subscriptions\",\"organizations_url\":\"https://api.github.com/users/mfpiccolo/orgs\",\"repos_url\":\"https://api.github.com/users/mfpiccolo/repos\",\"events_url\":\"https://api.github.com/users/mfpiccolo/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/mfpiccolo/received_events\",\"type\":\"User\"},\"comments_url\":\"https://api.github.com/gists/5191469/comments\",\"forks\":[],\"history\":[{\"user\":{\"login\":\"mfpiccolo\",\"id\":3249825,\"avatar_url\":\"https://secure.gravatar.com/avatar/7c9fda048420a5139f7ed90cc03e708a?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png\",\"gravatar_id\":\"7c9fda048420a5139f7ed90cc03e708a\",\"url\":\"https://api.github.com/users/mfpiccolo\",\"html_url\":\"https://github.com/mfpiccolo\",\"followers_url\":\"https://api.github.com/users/mfpiccolo/followers\",\"following_url\":\"https://api.github.com/users/mfpiccolo/following\",\"gists_url\":\"https://api.github.com/users/mfpiccolo/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/mfpiccolo/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/mfpiccolo/subscriptions\",\"organizations_url\":\"https://api.github.com/users/mfpiccolo/orgs\",\"repos_url\":\"https://api.github.com/users/mfpiccolo/repos\",\"events_url\":\"https://api.github.com/users/mfpiccolo/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/mfpiccolo/received_events\",\"type\":\"User\"},\"version\":\"28d81be857ae21a09de13ca8269681c110aced8b\",\"committed_at\":\"2013-03-18T22:36:14Z\",\"change_status\":{\"total\":2,\"additions\":2,\"deletions\":0},\"url\":\"https://api.github.com/gists/5191469/28d81be857ae21a09de13ca8269681c110aced8b\"}]}" )
      new_gist = Gist.create(gist)
      gist_array = [Gist.create(JSON.parse(gist1)), Gist.create(JSON.parse(gist1))]
      new_gist.files.should eq gist_array
    end
  end

  # context '#==' do 
  #   it 'says two arrays are equal when they contain the same number and kind of elements' do
  #     gist = {'public' => 'true',
  #         'description' => 'a test gist',  
  #         'files' => {'test_file' => {'content' => 'puts "hello world!"'}} 
  #       }

  #     gist_array1 = [Gist.new(gist), Gist.new(gist)]
  #     gist_array2 = [Gist.new(gist), Gist.new(gist)]
  #     gist_array1.should eq gist_array2


  #   end
  # end



end










