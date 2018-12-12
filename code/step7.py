import os
#rename filename
os.rename('F:\Lab\LHY\python\data\\result.json','F:\Lab\LHY\python\data\\result.geojson')

#modify file
with open('F:\Lab\LHY\python\data\\result.geojson') as f:
	lines = f.readlines()
	curr = lines[:-1]

f=open('F:\Lab\LHY\python\data\\result.geojson','w')
f.writelines(curr)
f.close

f=open('F:\Lab\LHY\python\data\\result.geojson','w')
f.write('"crs":{"type":"name","properties":{"name":"usrn:ogc:def:crs:EPSG::4839"}}}')
