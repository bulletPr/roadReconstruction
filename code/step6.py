import arcpy
import os

#set the workspace environment and run Clip_analysis
arcpy.env.workspace = "F:\Lab\LHY\python\data"

#to add a toolbox from a local server,provide the sever and toolbox name
#delimited by a semi-colon
arcpy.ImportToolbox("D:\Soft\ArcGIS\Desktop10.2\ArcToolbox\Toolboxes\Samples .tbx","mySamplesTool")

#define text to shp
output_name2 = "result.shp"
input_txt2="result.txt"
arcpy.CreateFeaturesFromTextFile_mySamplesTool(input_txt2,".",output_name2,"")

output_json = 'result.json'
arcpy.FeaturesToJSON_conversion('result.shp',output_json,"FORMATTED")




