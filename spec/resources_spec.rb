# encoding: UTF-8
require 'resources/resource'

describe Resources::Resource, '#name' do
  it 'sets the name' do
    resource = Resources::Resource.new
    resource.name = 'Cotton'
    resource.name.should eq('Cotton')
  end
end

describe Resources::Resource, '#name' do
  it 'sets the token in lowercase' do
    resource = Resources::Resource.new
    resource.name = 'Cotton'
    resource.token.should eq('cotton')
  end
end

describe Resources::Resource, '#name' do
  it 'sets the token, translated whitespaces to underlines' do
    resource = Resources::Resource.new
    resource.name = 'Sheep wool'
    resource.token.should eq('sheep_wool')
  end
end

describe Resources::Resource, '#name' do
  it 'sets the token and trims probably whitespaces at the end' do
    resource = Resources::Resource.new
    resource.name = 'whitespace wool    '
    resource.token.should eq('whitespace_wool')
  end
end

describe Resources::Resource, '#name' do
  it 'sets the token, but remove all not a-z or _ chars' do
    resource = Resources::Resource.new
    resource.name = 'Cööl wööl with mäny ümläüts in näme'
    resource.token.should eq('cl_wl_with_mny_mlts_in_nme')
    # Maybe we can use here a mapping later so ä => a, but not now
  end
end
