
module Resource
    # attr_accessor :id, :description, :picture
    # attr_reader :name, :token

    def name=(value)
      super

      # Set token here
      # The token is the name ,but lowercase, only a-z and underlines instead of
      # spaces
      attribute_set(
        :token,
        name.rstrip.downcase.gsub(/[ ]/, '_').gsub(/[^a-z_]*/, '')
      )
    end

end