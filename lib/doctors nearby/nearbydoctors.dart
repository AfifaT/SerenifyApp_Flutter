import 'dart:convert';
import 'package:final_project/model/nearby_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:app_settings/app_settings.dart';


class NearbyDoctorsPage extends StatefulWidget {
  const NearbyDoctorsPage({Key? key}) : super(key: key);

  @override
  State<NearbyDoctorsPage> createState() => _NearbyDoctorsPageState();
}

class _NearbyDoctorsPageState extends State<NearbyDoctorsPage> {

  String apiKey = "AIzaSyC3h89eikvVgfPYRsehTfWvsDOMmzxxicw";
  String radius = "4000";
  String type = 'doctor';
  String keyword = "psychiatrist";


  NearbyPlacesResponse nearbyPlacesResponse = NearbyPlacesResponse();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psychiatrists nearby'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(

                onPressed: () async{
                  bool isEnabled = await _isLocationServiceEnabled();
                  if (!isEnabled) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Location services are disabled'),
                          content: Text('Please enable location services'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            // TextButton(
                            //   onPressed:(){ AppSettings.openLocationSettings();},
                            //   child: Text('Settings'),
                            // ),
                          ],
                        );
                      },
                    );
                    return;
                  }
                  getNearbyPlaces();
                },
                  child: const Text('Find'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical:10),
                  ),
              ),

            if(nearbyPlacesResponse.results != null)
              for(int i=0; i<nearbyPlacesResponse.results!.length; i++)
                nearbyPlacesWidget(nearbyPlacesResponse.results![i])
            ],
          ),
        ),
      ),
    );
  }

  void getNearbyPlaces() async{

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error("Location permission denied");
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error('Location permissions are permanently denied');
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    final location = "${position.latitude}, ${position.longitude}";
    var url = Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=' +
                            location.toString() + '&radius=' + radius + '&type=' + type + '&keyword=' + keyword + '&key='+apiKey);

    var response = await http.get(url);
    nearbyPlacesResponse = NearbyPlacesResponse.fromJson(jsonDecode(response.body));

   setState(() {});
  }

  Widget nearbyPlacesWidget(Results results){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          color: Colors.teal[100],
      ),

      child: Column(
        children: [
          Text("Name: ${results.name ?? ""}"),
          Text("Address: ${results.vicinity?.toString() ?? ""}"),
          //Text("Phone:" + phoneNumber),
          FutureBuilder(
            future: getPlaceDetails(results.placeId!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var details = snapshot.data;
                var phone="";
                if (details != null && details['result'] != null ){
                  phone = details['result']?['formatted_phone_number'] ?? "";
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(phone.isNotEmpty)
                    GestureDetector(
                        onTap: () async {
                            final Uri url = Uri(scheme:'tel' , path: '${phone.replaceAll(' ', '')}');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              throw "Could not launch $url";
                            }
                        },
                      child:
                        Text("Contact:  + $phone",style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,),),
                    ),
                    if(phone.isEmpty)
                      Text("Contact: Not Available"),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("snapshot.error.toString()");
              } else {
                return SizedBox(
                  height: 20,
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>> getPlaceDetails(String placeId) async {
    var url = Uri.parse('https://maps.googleapis.com/maps/api/place/details/json?place_id=' +
        placeId + '&fields=name,formatted_phone_number,website,rating,types&key=' + apiKey);
    var response = await http.get(url);
    return jsonDecode(response.body);
  }
  Future<bool> _isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }



}

