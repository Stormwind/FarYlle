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
      # Gets the classname of the given resource and tranforms it into a string,
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