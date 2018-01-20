describe NorthernPike do
  describe '.os_reference_to_lat_lng' do
    context 'OS ref without grid letters' do
      it 'converts OS map ref lat,lng ' do
        location = NorthernPike.os_reference_to_lat_lng(
          os_ref: '260490',
          grid_letters: 'HU'
        )
        expect(location).to include(lat: 60.22449376366477, lng: -1.532501734194322)
      end
    end

    context 'OS ref with grid letters' do
      it 'converts OS map ref lat,lng ' do
        location = NorthernPike.os_reference_to_lat_lng(
          os_ref: 'HU260490'
        )
        expect(location).to include(lat: 60.22449376366477, lng: -1.532501734194322)
      end
    end
  end

  describe '.chomp' do
    it 'returns array of waters from a string of text' do
      text = File.read(Dir.pwd + '/spec/fixtures/waters.txt')
      waters = NorthernPike.chomp text: text, grid_letters: 'HU'
      expect(waters.length).to eql 4
      expect(waters[0][0]).to eql 'Loch of Grunnavoe'
      expect(waters[0][1]).to eql 'Lying close to the village of Walls this largish loch holds fish of 8 to 10 ounces'\
      ' with the odd larger fish occasionally showing up. The south shore is thought'\
      ' to be the best place to start.'
      expect(waters[0][2]).to include(lat: 60.22449376366477, lng: -1.532501734194322)
    end
  end
end
