module FarYlle
  module Resources

    class Fiber
      include DataMapper::Resource
      
      property :id,          String, :key => true, :unique => true
      property :description, String
      property :picture,     String
      property :name,        String

      # Must be included here, to be sure not to be overwritten
      include Resource

      # Converts the Fiber to a Hash
      #
      # @return [Hash] The Fiber a Hash
      def to_hash
        {
          'id'          => @id,
          'description' => @description,
          'picture'     => @picture,
          'name'        => @name
        }
      end

    end

  end
end