import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class ServiceLocation {

  final String key = 'AIzaSyB1BBOstkmbxcdvNPz-l7X3YZjZydIAGrU';

  Future<String> getLocationId(String input) async {
    final String url = 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var locationId = json['candidates'][0]['place_id'] as String;
    print(locationId);
    return locationId;
  }


  Future<Map<String, dynamic>> getLocation(String input) async {
    final locationId = getLocation(input);
    final String url = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$locationId&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var resultat = json['result'] as Map<String, dynamic>;
    print(resultat);
    return resultat;
  }

}