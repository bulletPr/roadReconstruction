//实例化ZoomSlider控件并加载到地图容器中
  			var zoomslider = new ol.control.ZoomSlider();
  			map.addControl(zoomslider);
  			//实例化zoomToExtent控件并加载到地图容器中
  			var zoomToExtent = new ol.control.ZoomToExtent({
  				extent: [390030,5817060,395100,5825000]
  			});
  			map.addControl(zoomToExtent);
  			
  			//实例化鼠标位置控件并加载到地图容器中
  			var mousePositionControl = new ol.control.MousePosition({
					coordinateFormat: ol.coordinate.createStringXY(4),
					projection: 'EPSG:4839',
					className: 'custom-mouse-position',
					target: document.getElementById('mouse-position'),
					undefinedHTML: '&nbsp'
				});
				map.addControl(mousePositionControl);
				
				//增加比例尺、全屏显示控件
				var scaleLineControl = new ol.control.ScaleLine({
					units: "metric"
				});
				map.addControl(scaleLineControl);

				//var fullScreenControl = new ol.control.FullScreen;
				//map.addControl(fullScreenControl);