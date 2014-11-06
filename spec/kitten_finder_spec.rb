describe KittenFinder do
  it 'should create investigator' do
    subject.investigator('test@example.com').should be_kind_of KittenFinder::Investigator
  end
end
