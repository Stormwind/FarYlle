require 'sinatra'
require 'slim'

# Fix load path
$LOAD_PATH << File.expand_path('lib')

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

get '/' do
  slim :index
end

# create a new fiber
post '/fibers' do
  fiber = Resources::Fiber.new
  # Read name and description, to create a new fiber resource
  fiber.name = params[:name]
  fiber.description = params[:description]
  return fiber.save.to_json
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
    # This is only implemented to get some readable output, will be converted in
    # something useful later
    fiber.to_json
  end
end