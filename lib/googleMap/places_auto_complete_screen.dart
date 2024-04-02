
import 'dart:developer';

import 'package:courier_app/googleMap/places_auto_complete_response.dart';
import 'package:courier_app/googleMap/places_details_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlacesAutoCompleteScreen extends StatefulWidget {
  const PlacesAutoCompleteScreen({super.key});

  @override
  State<PlacesAutoCompleteScreen> createState() => _PlacesAutoCompleteScreenState();
}

class _PlacesAutoCompleteScreenState extends State<PlacesAutoCompleteScreen> {
  String apiKey = "AIzaSyBDAit_21ZT1Wdu95dfDAYEnIqz8lwMa2o";
  List<Prediction> _predictions = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title:Padding(padding: const EdgeInsets.all(8.0),
        child:TextField(
          onChanged: placeAutoComplete,
          decoration:const InputDecoration(
            hintText: 'Enter address'
          ),
        )
        )
      ),
      body: WillPopScope(
        onWillPop: ()async {
          return true;
        },
        child: Column(children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context,index){
                return Divider();
              },
              itemCount:_predictions.length,
              itemBuilder:(context,index){
                return ListTile(
                  leading:Icon(Icons.location_on),
                  title: Text(_predictions[index].description),
                  onTap: (){
                    getPlaceDetails(_predictions[index].placeId);
                    Navigator.of(context).pop(_predictions[index].description);
                  },
                );
              }
              )
          
          )
        ],),
      )
      );
  }


  void placeAutoComplete(String query) async{

    Uri uri = Uri.https(
      'maps.googleapis.com',
      'maps/api/place/autocomplete/json',
      {
        'key':apiKey,
        'input':query,
      }
    );

    try{
      var response = await http.get(
        uri,headers:{
          'Content-Type':'application/json',
        });
      if(response.statusCode == 200){
        PlaceAutoResponse placeAutoResponse = 
          placeAutoResponseFromJson(response.body);
          setState(() {
            _predictions = placeAutoResponse.predictions;
          });
      } else{
        log('Failed to fetch suggestions: ${response.statusCode}');
      } 
    }catch(e){
      log('Error occured: $e');
    }
  }


  Future<void> getPlaceDetails(String placeId) async {
  Uri detailsUri = Uri.https(
    'maps.googleapis.com',
    'maps/api/place/details/json',
    {
      'key': apiKey,
      'place_id': placeId,
    },
  );

  try {
    var detailsResponse = await http.get(detailsUri, headers: {
      'Content-Type': 'application/json',
    });

    if (detailsResponse.statusCode == 200) {
      PlaceDetailsResponse placeDetailsResponse =
          placeDetailsResponseFromJson(detailsResponse.body);

      double latitude = placeDetailsResponse.result.geometry.location.lat;
      double longitude = placeDetailsResponse.result.geometry.location.lng;

      print('Latitude: $latitude, Longitude: $longitude');
    } else {
      log('Failed to fetch place details: ${detailsResponse.statusCode}');
    }
  } catch (e) {
    log('Error occurred while fetching place details: $e');
  }
}

}

