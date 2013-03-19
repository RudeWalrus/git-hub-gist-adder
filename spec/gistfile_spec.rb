require 'spec_helper'

describe GistFile do
     
 let(:file) {["test_file"=>{"content"=>"puts \"hello world!\""}]}

  context '#initialize' do
    it 'initializes an insance of File with an argument' do
      GistFile.new(file).should be_an_instance_of GistFile
    end
  end

  context '#file_name' do
    it 'returns the file name of the gist' do
      gist_file = GistFile.new(file)
      gist_file.file_name.should eq "test_file"
    end
  end

  context '#content' do 
    it 'returns the content of the gist' do
      gist_file = GistFile.new(file)
      gist_file.content.should eq "puts \"hello world!\""
    end
  end

  context '#==' do 
    it 'says two arrays are equal when they contain the same number and kind of elements' do

      GistFile.new(file).should eq GistFile.new(file) 
    end
  end
end