module FarYlle
  module Resource
      # attr_accessor :id, :description, :picture
      # attr_reader :name

      # Sets the name of the Resource.
      # Gets a string, make it lower case, replace whitespaces with underscores
      # and removes everything, what is not a ASCII letter
      #
      # @param [String] value The new name
      #
      def name=(value)
        super

        # Set id here
        # The id is the name, but lowercase, only a-z and underlines instead of
        # spaces
        attribute_set(
          :id,
          name.rstrip.downcase.gsub(/[ ]/, '_').gsub(/[^a-z_]*/, '')
        )
      end

  end
end
