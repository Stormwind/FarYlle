require 'spec_helper'

describe 'GET /fibers/:key' do
  it 'returns status 404, if fiber does not exist' do
    response = Excon.get('http://127.0.0.1:4567/fibers/sheep_wool')

    response.status.should eq(404)
  end
end

describe 'POST /fibers' do
  it 'returns status 201, and creates a fiber' do
    response = Excon.post(
      'http://127.0.0.1:4567/fibers?name=Sheep%20wool&description=Cool%20wool'
    )

    response.status.should eq(201)
    response.body.should eq('true')
  end
end

describe 'GET /fibers/:key' do
  it 'returns status 200, if fiber exists' do
    response = Excon.get('http://127.0.0.1:4567/fibers/sheep_wool')

    response.status.should eq(200)
    response.body.should eq(
      '{"id":"sheep_wool",'+
      '"description":"Cool wool",'+
      '"picture":null,'+
      '"name":"Sheep wool"}'
    )
  end
end