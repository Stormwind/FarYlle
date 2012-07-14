require 'resources/resource'

module Resources

  class Fiber
    include DataMapper::Resource
    
    property :id,          String, :key => true, :unique => true
    property :description, String
    property :picture,     String
    property :name,        String

    # Must be included here, to be sure not to be overwritten
    include Resource
  end

end