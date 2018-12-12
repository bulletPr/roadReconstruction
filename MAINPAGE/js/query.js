var select = new ol.interaction.Select({
          wrapX:false
        });
        map.addInteraction(select);

        var selectFeatures = select.getFeatures();

        //增加框选交互
        var dragBox = new ol.interaction.DragBox({
          condition: ol.events.condition.platformModifierKeyOnly
        });

        map.addInteraction(dragBox);

        var infoBox = document.getElementById('info');

        dragBox.on('boxend',function(){
          //在框里的要素被加入到被选择的要素集里，显示她们的file_ID在“info”div里边
          var info = [];
          var extent = dragBox.getGeometry().getExtent();
          vectorSource.forEachFeatureIntersectingExtent(extent,function(feature) {
            selectFeatures.push(feature);
            info.push(feature.get('File_ID'));
          });
          var htmls="";
          var i=0;
          if(info.length > 0){
            htmls = htmls + "<table style=\"width:100%\">";
            htmls = htmls + "<tr><td>File_ID</td></tr>";

            for(i;i<info.length;i++){
              if(i%2 ==0)
                htmls = htmls + "<tr>";
              else
                htmls = htmls + "<tr bgcolor=\"#F0F0F0\">";
              htmls = htmls + "<td>" + info[i] + "</td>";
              htmls = htmls + "</tr>";
            }
            htmls = htmls + "</table>"
            infoBox.innerHTML = htmls;
            //infoBox.innerHTML = info.join(',');
          }
        });

        //当重新画框或点击地图时清除选集
        dragBox.on('boxstart',function(){
          selectFeatures.clear();
          infoBox.innerHTML = '&nbsp';
        });

        map.on('click',function(){
          selectFeatures.clear();
          infoBox.innerHTML = '&nbsp';
        });