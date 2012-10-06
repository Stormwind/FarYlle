module FarYlle
  module Resource
      # attr_accessor :id, :description, :picture
      # attr_reader :name

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
