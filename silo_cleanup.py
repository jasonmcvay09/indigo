import geopandas as gpd
import pandas as pd
import fiona

df = pd.read_csv("silo_capacity.csv")
silos = ("silos_ilmenard.shp")

# Get a list of unique diameter values from the csv
diameter_range = list(df.Diameter.unique())

# Dictionaries for Bushel ranges based on Diameter
bushel_dict_min = df.groupby('Diameter')['Bushels'].min().to_dict()
bushel_dict_max = df.groupby('Diameter')['Bushels'].max().to_dict()
bushel_dict = df.groupby('Diameter')['Bushels'].median().to_dict()

# Function to get closest diameter from silo df
def closest_diameter(number):
    return min(diameter_range, key=lambda x:abs(x-number))

# Function to capture range of posssible bushel values based on diameter
def get_bushel_values(shapefile):
    a = gpd.read_file(shapefile)
    a['closest_di'] = a['DIAMETER'].apply(closest_diameter)
    a['low_bushels'] = a['closest_di'].map(bushel_dict_min)
    a['high_bushels'] = a['closest_di'].map(bushel_dict_max)
    a['median_bushels'] = a['closest_di'].map(bushel_dict)
    a.to_file("bushels_{}.shp".format(shapefile), driver='ESRI Shapefile')
    return(print('function completed'))

# Run the function
get_bushel_values(silos)