require 'sinatra'
require 'slim'

# Fix load path
$LOAD_PATH << File.expand_path('lib')

# Load own dependencies
require 'response'

# Load datamapper
require 'data_mapper'
require 'json'

# Create a temporary sqlite table
DataMapper.setup(:default, 'sqlite::memory:')

# Load models
require 'resources/resource'
require 'resources/fiber'

# Create tables and finalize models
DataMapper.auto_migrate!
DataMapper.finalize

# TODO Maybe we can put this somewhere extra, so it is not in the way
def create_response(resource, request)
  Response.new(resource, request.accept)
  # TODO Throw a nice exception, because, we to not support the given accept
  # type
end

get '/' do
  slim :index
end

# create a new fiber
post '/fibers' do
  fiber = Resources::Fiber.new
  # Read name and description, to create a new fiber resource
  fiber.name = params[:name]
  fiber.description = params[:description]
  saved = fiber.save
  if saved
    status 201
  else
    status 409
  end
  saved.to_json
end

# get all fibers
get '/fibers' do
  
end

# get a certain fiber
get '/fibers/:key' do
  fiber = Resources::Fiber.first(:id => params[:key])
  if fiber.nil?
    status 404
    slim :resource_not_found
  else
    create_response(fiber, request)
  end
end