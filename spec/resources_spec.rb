# encoding: UTF-8
require 'resources/resource'

class DummyResource
  include Resource
  attr_accessor :id, :description, :picture
  attr_reader :name, :token
end

describe Resource, '#name' do
  it 'sets the name' do
    resource = DummyResource.new
    resource.name = 'Cotton'
    resource.name.should eq('Cotton')
  end
end

describe Resource, '#name' do
  it 'sets the token in lowercase' do
    resource = DummyResource.new
    resource.name = 'Cotton'
    resource.token.should eq('cotton')
  end
end

describe Resource, '#name' do
  it 'sets the token, translated whitespaces to underlines' do
    resource = DummyResource.new
    resource.name = 'Sheep wool'
    resource.token.should eq('sheep_wool')
  end
end

describe Resource, '#name' do
  it 'sets the token and trims probably whitespaces at the end' do
    resource = DummyResource.new
    resource.name = 'whitespace wool    '
    resource.token.should eq('whitespace_wool')
  end
end

describe Resource, '#name' do
  it 'sets the token, but remove all not a-z or _ chars' do
    resource = DummyResource.new
    resource.name = 'Cööl wööl with mäny ümläüts in näme'
    resource.token.should eq('cl_wl_with_mny_mlts_in_nme')
    # Maybe we can use here a mapping later so ä => a, but not now
  end
end
