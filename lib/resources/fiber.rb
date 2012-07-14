require 'resources/resource'

module Resources

  class Fiber
    include DataMapper::Resource
    
    property :id,          Serial
    property :description, String
    property :picture,     String
    property :name,        String
    property :token,       String 

    include Resource
  end

end