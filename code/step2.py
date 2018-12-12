import arcpy

def conservesion():
	#set the workspace environment and run Clip_analysis
	arcpy.env.workspace = "F:\Lab\LHY\python\data"

	#to add a toolbox from a local server,provide the sever and toolbox name
	#delimited by a semi-colon
	arcpy.ImportToolbox("D:\Soft\ArcGIS\Desktop10.2\ArcToolbox\Toolboxes\Samples .tbx","mySamplesTool")

	#define the Text to Shp input file
	input_txt="F:\Lab\LHY\python\data\polyline.txt"

	#define the output shp name
	output_name = "bolinPolyline.shp"


	#define the spatial reference object

	#arcpy.mySamplesTool.CreateFeaturesFromTextFile(input_txt,".",output_name,"")

	arcpy.CreateFeaturesFromTextFile_mySamplesTool(input_txt,".",output_name,"")

	#Densify "bolinPolyline.shp" feature,no output
	arcpy.Densify_edit('bolinPolyline.shp',"DISTANCE","10 Meters")

	#define Feature Vertices To Point output file
	outFeature_name = "total_polyline.shp"
	arcpy.FeatureVerticesToPoints_management('bolinPolyline.shp',outFeature_name,"ALL")
















