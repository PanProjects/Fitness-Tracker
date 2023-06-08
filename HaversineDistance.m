function distance = HaversineDistance(lat, lon)

% Earth radius in kilometers
R = 6371;

% Convert degrees to radians
lat = deg2rad(lat);
lon = deg2rad(lon);

% Calculate differences in latitude and longitude
delta_lat = diff(lat);
delta_lon = diff(lon);

% Haversine formula in meters
a = sin(delta_lat/2).^2 + cos(lat(1:end-1)).*cos(lat(2:end)).*sin(delta_lon/2).^2;
c = 2 * atan2(sqrt(a), sqrt(1-a));
distance = R * c*1000;