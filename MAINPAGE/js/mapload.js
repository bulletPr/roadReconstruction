var vectorSource = new ol.source.Vector({
          url: 'data/result.geojson',
          format: new ol.format.GeoJSON(),
          wrapX:false
        })

        var vectorLayer = new ol.layer.Vector({
          source: vectorSource
        });
        
        var map = new ol.Map({
          layers: [
          new ol.layer.Tile({
            source: new ol.source.OSM()
          }),
          vectorLayer
          ],
          target: 'map',
          view: new ol.View({
            proj:'EPSG:4839',
            center: [392144.50705,5819957.15880],
            //center:[0,0],
            zoom: 14
          })
        });