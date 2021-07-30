require 'rspec'
require 'album'

describe '#Album' do
  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end
end
