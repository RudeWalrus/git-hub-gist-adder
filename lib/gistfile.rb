class GistFile

  def initialize(file_array)
    @file_array = file_array  
  end

  def file_name
    p @file_array.first
    @file_array.first.keys.first
  end

  def content
    @file_array.first['test_file']['content']
  end

  def ==(other)
    if other.class != self.class
      false
    else
      self.file_name == other.file_name && self.content == other.content
    end
  end

end