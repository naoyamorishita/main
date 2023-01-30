"""
BASIC INFO
* Created by: Naoya Morishita
* Created on: 2023/ 01/ 29
* Data Source: https://www.mass.gov/orgs/massgis-bureau-of-geographic-information
"""
# TO DO: Import Relevant Libraries####
import os
import pandas
import geopandas
import matplotlib.pyplot as plt

os.chdir(r"/Users/naoyamorishita/Desktop/working/main/advanced_vector_gis_code")

# TO DO: Import Data####
a_hospitals=geopandas.read_file(r"./sample_data/acute_care_hospitals/HOSPITALS_PT.shp")
non_a_hospitals=geopandas.read_file(r"./sample_data/non_acute_care_hospitals/HOSPITALS_NONACUTE_PT.shp")
counties=geopandas.read_file(r"./sample_data/ma_counties/COUNTIES_POLY.shp")
school_dist=geopandas.read_file(r"./sample_data/schooldistricts/SCHOOLDISTRICTS_POLY.shp")
base=counties.plot(color='white',edgecolor='navy')

# TO DO: Merge Hospitals####
hospitals_all=pandas.concat([a_hospitals, non_a_hospitals])
hospitals_all.plot(ax=base,marker='o', color='blue', markersize=3);
plt.title=('All Hospitals')
plt.show()

# TO DO: Making 3km Radius Buffer from Hospitals####
print(hospitals_all.crs) # epsg 26986 # unit: meter # source:https://epsg.io/26986
hp_3km_bf=hospitals_all
hp_3km_bf['geometry']=hospitals_all.geometry.buffer(3000)
hp_3km_bf.plot(ax=base)
plt.show()

# TO DO: Looking For Areas that has No hospitals around 3km####
no_closed_hp=counties.overlay(hp_3km_bf,how='difference')
no_closed_hp.plot(ax=base,color='red')
plt.show()

# TO DO: Dissolve School Districts####
school_dist_d=school_dist.dissolve("DISTRICT_T")
#school_dist_d.plot(edgecolor="white")
#plt.show()

# TO DO: Intersect Hospitals with School Districts####
hospitals_i=hospitals_all.overlay(school_dist_d,how='intersection')
hospitals_i,plot()
plt.show()
