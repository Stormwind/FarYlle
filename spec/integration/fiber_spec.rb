require 'spec_helper'

describe 'GET /fibers/:key' do
  it 'returns status 404, if fiber does not exist' do
    response = Excon.get('http://127.0.0.1:4567/fibers/sheep_wool')

    response.status.should eq(404)
    response.body.should eq('<!DOCTYPE html><html>'+
      '<head><title>Not Found</title></head>'+
      '<body><div>Not Found</div>'+
      '</body></html>'
    )
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
      '<!DOCTYPE html><html>'+
      '<head><title>Awesome cool fiber</title></head>'+
      '<body><h1>Sheep wool</h1><p>Cool wool</p>'+
      '</body></html>'
    )
  end
end

# TODO write tests for different accept types