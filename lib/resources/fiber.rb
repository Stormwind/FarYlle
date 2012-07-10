require 'resources/resource'

module Resources

  class Fiber
    include DataMapper::Resource
    include Resource

    property :id,          Serial
    property :description, String
    property :picture,     String
    property :name,        String
    property :token,       String 

  end

end