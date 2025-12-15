import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';
late Map data;
late List feature;
void main() async{
  data= await getJson();
  feature=data['features'];
  runApp(MaterialApp(
    title: 'QuakeApp',
    home: EarthQuake(),
  ));
}

class EarthQuake extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EarthQuake'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: ListView.builder(
          itemCount:feature.length,
            padding: const EdgeInsets.all(16.5),
            itemBuilder: (BuildContext context, int position){
            if(position.isOdd)return Divider();
            final index= position ~/2;
            var format= DateFormat.yMMMMd("en_US").add_jm();
            var date= format.format(DateTime.fromMicrosecondsSinceEpoch(feature[index]['properties']['time']*1000, isUtc: true));
            return ListTile(
              title: Text("At: $date",
              style: TextStyle(fontSize: 15.5,color: Colors.orange,fontWeight: FontWeight.w500),),
              subtitle: Text("${feature[index]['properties']['place']}",
                style: TextStyle(fontSize: 14.5,fontWeight: FontWeight.normal,color: Colors.grey,fontStyle: FontStyle.italic),),
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text("${feature[index]['properties']['mag']}",
                style: TextStyle(fontSize: 16.5,fontWeight: FontWeight.bold,color: Colors.white,fontStyle: FontStyle.normal),),
              ),
              onTap: (){showMessagealert(context, "${feature[index]['properties']['title']}" );}

            );
            }
        ),

      ),
    );
  }

  void showMessagealert(BuildContext context, String message) {
    var alert= AlertDialog(
      title: Text("App"),
      content:Text(message) ,
      actions: <Widget>[
        TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Ok'))
      ],
    );
    showDialog(context: context, builder: (context)=>alert);
  }

}
Future<Map>getJson() async{
  String apiUrl="https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
  http.Response response = await http.get(Uri.parse(apiUrl));
  return json.decode(response.body);
}