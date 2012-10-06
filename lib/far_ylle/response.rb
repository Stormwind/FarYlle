module FarYlle

  # Response class, to put the models data into the view.
  # Inherits from Rack::Response for easier handling.
  #
  class Response < Rack::Response

    attr_accessor :resource, :accept, :template

    # Initialize Response. Needs a resource.
    #
    # @param [Resource] resource Something that behaves like a Resource
    # @param [Hash] accept accept type. Decides how the resource should be shown
    #
    def initialize(resource, accept = nil)
      super()
      @resource = resource
      @accept  = accept

      generate_output
    end

    private

    # Generates the output.
    # Evaluates the given accept type and choose how the resource should be
    # shown.
    #
    # @return [Boolean] true, if a representation is available
    #
    def generate_output
      return false if @resource.nil?

      # TODO find a way to write this shorter
      if @accept.empty? or @accept.index 'text/html'
        write html_response
      # elsif @accept.index 'application/json'
      #   write json_response
      # elsif @accept.index 'text/xml' or @accept.index 'application/xml'
      #   write xml_response
      end
      return true unless @body.nil?

      false
    end

    # Create a HTML view using Slim templates.
    # The templates must have the same name, as the classes, but instead of
    # capital letters underscore and lower case.
    # For Example "FooBar"s template name must be "foo_bar"
    #
    # @return [String] the rendered template
    #
    def html_response
      # Gets the classname of the given resource and transforms it into a string,
      # then split it on the '::' and converts 'HelloWorld' in something like
      # 'hello_world' to be able to find the view.
      template = Slim::Template.new(
        "lib/far_ylle/views/#{
          @resource.class.to_s.split("::").pop.
            gsub(/([A-Z])/, '_\1').gsub(/^[_]/, '').downcase
        }.slim"
      )
      template.render(@resource)
    end

    # def json_response
    #  @resource.to_json
    # end

    # def xml_response
    #  @resource.to_xml
    # end

  end
end