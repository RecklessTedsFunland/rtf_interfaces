# Message from GPGGA NMEA String
std_msgs/Header header

string message_id

# UTC seconds from midnight
float64 utc_seconds

# Latitude in decimal degrees
float64 lat
# Longitude in decimal degrees
float64 lon

string lat_dir
string lon_dir

uint32 gps_qual

uint32 num_sats
float32 hdop 
float32 alt
string altitude_units

float32 undulation
string undulation_units
uint32 diff_age
string station_id
