require 'spec_helper'

describe FarYlle::ResourceNotFound, '#id' do
  it 'should return the id' do
    not_found = FarYlle::ResourceNotFound.new
    not_found.id = 'not_found'

    not_found.id.should eq('not_found')
  end
end
