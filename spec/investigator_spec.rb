describe KittenFinder::Investigator do
  subject { KittenFinder::Investigator.new 'dsbonev@gmail.com' }

  before do
    stub_api_calls
  end

  it 'should successfully locate kittens' do
    subject.locate_kittens.should eq [5, 2]
  end

  def stub_api_calls
    directions_url = "#{KittenFinder::ForensicsApi::BASE_URL}api/dsbonev@gmail.com/directions"
    directions_response = File.new(File.join(File.dirname(__dir__), 'spec/fixtures/directions.txt'))
    stub_request(:get, directions_url).to_return(directions_response)

    location_url = "#{KittenFinder::ForensicsApi::BASE_URL}api/dsbonev@gmail.com/location/5/2"
    location_response = File.new(File.join(File.dirname(__dir__), 'spec/fixtures/location.txt'))
    stub_request(:get, location_url).to_return(location_response)
  end
end
