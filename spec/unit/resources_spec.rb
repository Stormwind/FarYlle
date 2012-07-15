# encoding: UTF-8
require 'spec_helper'

class DummyResource
    include DataMapper::Resource

    property :id,          String, :key => true, :unique => true
    property :description, String
    property :picture,     String
    property :name,        String
    # attr_accessor :id, :description, :picture
    # attr_reader :name, :id

    include Resource
end

describe Resource, '#name' do
  it 'sets the name' do
    resource = DummyResource.new
    resource.name = 'Cotton'
    resource.name.should eq('Cotton')
  end
end

describe Resource, '#name' do
  it 'sets the id in lowercase' do
    resource = DummyResource.new
    resource.name = 'Cotton'
    resource.id.should eq('cotton')
  end
end

describe Resource, '#name' do
  it 'sets the id, translated whitespaces to underlines' do
    resource = DummyResource.new
    resource.name = 'Sheep wool'
    resource.id.should eq('sheep_wool')
  end
end

describe Resource, '#name' do
  it 'sets the id and trims probably whitespaces at the end' do
    resource = DummyResource.new
    resource.name = 'whitespace wool    '
    resource.id.should eq('whitespace_wool')
  end
end

describe Resource, '#name' do
  it 'sets the id, but remove all not a-z or _ chars' do
    resource = DummyResource.new
    resource.name = 'Cööl wööl with mäny ümläüts in näme'
    resource.id.should eq('cl_wl_with_mny_mlts_in_nme')
    # Maybe we can use here a mapping later so ä => a, but not now
  end
end
