import 'dart:async';

import 'package:fl_logindemo/screens/home/ParamPage.dart';
import 'package:fl_logindemo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ServiceLocation.dart';


class MapsPage extends StatefulWidget{
  @override
  _MapsPageState createState() => _MapsPageState();


}

class _MapsPageState extends State<MapsPage> {
  final AuthService _auth = new AuthService();

  Completer<GoogleMapController> _mapController = Completer(); //contrller for Google map
  TextEditingController _searchController = TextEditingController();
  final Set<Marker> markers = new Set(); //markers for google map
  static const LatLng showLocation = const LatLng(48.86215, 2.33913); //location to show in map

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            title: Text("City Heritage Care"),
            actions: <Widget> [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  print('vers page ajouter');
                },
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ParamPage()),
                  );
                },
              ),
              IconButton(
                  icon: Icon(Icons.account_balance),
                  onPressed: () async => {
                  await _auth.signOut(),
                  }
              ),
            ]
        ),

        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(hintText: 'Trouver un Lieu'),
                      onChanged: (value) {
                        print(value);
                      },
                    )
                ),
                IconButton(
                    onPressed:() async {
                      print('search');
                      var place = await ServiceLocation().getLocation(_searchController.text);
                      _gotoLocation(place);
                    },
                    icon: Icon(Icons.search)
                ),
              ],
            ),

            Expanded(
              child: GoogleMap( //Map widget from google_maps_flutter package
                zoomGesturesEnabled: true, //enable Zoom in, out on map
                initialCameraPosition: CameraPosition( //innital position in map
                  target: showLocation, //initial position
                  zoom: 12.0, //initial zoom level
                ),
                markers: getmarkers(), //markers to show on map
                mapType: MapType.normal, //map type
                onMapCreated: (controller) { //method called when map is created
                  setState(() {
                    _mapController.complete(controller) ;
                  });
                },
              ),
            )
          ],
        )
    );
  }

  Future<void> _goToParam() async {

  }

  Future<void> _gotoLocation(Map<String,dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat,lng), zoom: 12),
      ),
    );
  }
  Set<Marker> getmarkers() { //markers to place on map
    setState(() {


      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(48.86661, 2.35542), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Musée des Arts et Métiers ',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(48.86046, 2.32541), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Musée Orsay ',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(48.84401, 2.31100), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Musée Pasteur',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(48.87513, 2.34285), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Musée Grévin',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(48.89233, 2.34032), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Musée Montmartre',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(48.85939, 2.27993), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Maison de Balzac',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }
}
