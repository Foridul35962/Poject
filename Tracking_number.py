# It just show only country name.
# My first baddest project.

import phonenumbers as ph
import opencage
import folium

from opencage.geocoder import OpenCageGeocode
from phonenumbers import geocoder
from phonenumbers import carrier


number=input("Enter the target number: ")
pep_num=ph.parse(number)
# This functiion converts a phone number into a structured format, allowing
# other functionalities (like validation, location tracking) to be applied.
# It is create separate country code and phone number. Like: country: 880 ph:1790..

location=geocoder.description_for_number(pep_num,"en")
# This function gives extract the location (country state) from the phone number.

print(location)
print(carrier.name_for_number(pep_num,"en"))
# This function gives extract the SIM provider (Mobile Operator) from the phone number.

key='ca14f746be1441f38874d8d13ff9109f'
# visit opencagedata.com then login and give API keys from Dashboard

geocoder=OpenCageGeocode(key)
# initialize opencage API

query = str(location)
result=geocoder.geocode(query)
# print(result); result has latitude and langitude full details

lat=result[0]['geometry']['lat']
lng=result[0]['geometry']['lng']
print(lat,lng)

myMap=folium.Map(location=[lat,lng],zoom_start=9)
# In this function create a interactive map based on lat and lng.

folium.Marker([lat,lng],popup=location).add_to(myMap)
# Create a marker point and add to map

myMap.save("my_location.html")