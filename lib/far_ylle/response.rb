module FarYlle

  class Response < Rack::Response

    attr_accessor :resource, :accept, :template

    def initialize(resource, accept = nil)
      super()
      @resource = resource
      @accept  = accept

      generate_output
    end

    private

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

    def html_response
      template = Slim::Template.new('lib/far_ylle/views/fiber.slim')
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