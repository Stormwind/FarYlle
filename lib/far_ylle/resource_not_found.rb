module FarYlle

  # The class representation, if a resource could not be found.
  # Behaves similar to a real resource, but it doesn't exist, so it is no
  # resource... somehow.
  #
  class ResourceNotFound
    attr_accessor :id
  end
end