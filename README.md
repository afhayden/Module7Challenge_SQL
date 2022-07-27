# Module 7 Challenge Pewlett-Hackard Silver Tsunami Analysis
The project task is to provide weather information for list of randomly selected cities and closet hotels based on minimumum and max temperature preferences.

## Summary of Tasks
### Deliverable 1
* Generate a sample of 2,000 random latitudes and longitudes
* Retrieve the nearest city using citipy
* Obtain weather information using an API call to OpenWeatherMap
* Save the cities and weather data to WeatherPy_Database.csv within the Weather_Database folder

### Deliverable 2
* Obtain user info for minimum and maximum temperature preferences
* Using the data saved in WeatherPy_Database.csv, create DataFrame for cities that meet the minimum and maximum temperature crtieria
* Using Google Maps API, identify nearest hotels to those selected cities
* Add hotel info pop-up box data for each of those cities
* Save the updated cities information to WeatherPy_vacation.csv within the Vacation_Search folder
* Display Google Map with hotel name and weather information in markers

### Deliverable 3
* Select four (4) cities close in proximity to one another and in the same country
* Display a map of the cities with directional layer
* Display a map of the cities with hotel name and weather information in markers

## Resources
- Data Source: city_data.csv, ride_data.csv
- Software: Python 3.9.12, Jupyterlab 3.3.2, Pandas 1.4.2, citypy 0.0.5, numpy 1.21.5, requests 2.27.1
- APIs: OpenWeatherMap, GoogleMaps

## Summary of Results
### Map of Overall Global Search
![Map of Overall Global Search](Vacation_Search/WeatherPy_vacation_map.png)

### Map of Four Cities in Japan with Directional Layer
![Map of Four Cities in Japan with Directional Layer](Vacation_Itinerary/WeatherPy_travel_map.PNG)

### Map of Four Cities in Japan with Markers
![Map of Four Cities in Japan with Markers](Vacation_Itinerary/WeatherPy_travel_map_markers.png)

