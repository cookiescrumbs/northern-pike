describe NorthernPike do
    os_ref = 'HU260490'
    lat = 60.22449376366477
    lng = -1.532501734194322
    location = OpenStruct.new({
        lat:  1.0511157065227419,
        lon: -0.026747201054213885
    })
    os_location = OpenStruct.new({
        easting: "426000",
        northing: "1349000",
        map_reference: os_ref
    });
    
    describe '.os_reference_to_lat_lng :os_ref' do
        
        before(:each) do
            
            global_convertion_input = {
                projection: :osgb36,
                lon: os_location.easting.to_i,
                lat: os_location.northing.to_i
            }
    
            global_convertion_output = {
                projection: :wgs84
            }
    
            allow(OsMapRef::Location).to receive(:for).with(os_ref).and_return(os_location)
            expect(GlobalConvert::Location).to receive(:new).with(input: global_convertion_input, output: global_convertion_output).and_return(location)
        end

        it 'converts OS map ref to lat,lng ' do
            location = NorthernPike.os_ref_to_lat_lng(os_ref: os_ref)
            expect(location).to include(lat:lat, lng: lng)
        end 
    end

    describe '.lat_lng_to_os_ref :lat, lng:' do

        before(:each) do 
            global_convertion_input = {
                projection: :wgs84,
                lon: (Math::PI * lng.to_f / 180),
                lat: (Math::PI * lat.to_f / 180)
            }
    
            global_convertion_output = {
                projection: :osgb36
            }

            location = OpenStruct.new({
                lat:  1.0511157065227419,
                lon: -0.026747201054213885
            })

            expect(GlobalConvert::Location).to receive(:new).with(input: global_convertion_input, output: global_convertion_output).and_return(location)
            allow(OsMapRef::Location).to receive(:for).with("#{location.lon},#{location.lat}").and_return(os_location)
        end

        it 'converts lat, lng to os map ref' do
            location = NorthernPike.lat_lng_to_os_ref(lat: lat, lng: lng)
            expect(location).to include(os_map_ref: os_ref)
        end 
    end
end
