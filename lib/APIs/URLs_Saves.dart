import 'package:http/http.dart' as http;
import 'dart:convert';


//! Endpoints URLs
const fetchLogosDataURL = "https://api.jsonbin.io/v3/b/64745339b89b1e2299a6aaef";
const fetchTopDataURL = "https://api.jsonbin.io/v3/b/6473d4659d312622a36703a1";
const fetchOtherDataURL = "https://api.jsonbin.io/v3/b/647449899d312622a36732fb";


//! i am for the logos: i am use to display the logos on the screen
Future<List<dynamic>> fetchLogosURL() async {
    try {
      final response = await http.get(
          Uri.parse(fetchLogosDataURL));
      if (response.statusCode == 200) {
        final responseBody = response.body;

        if (responseBody != null) {
          final parsedData = json.decode(responseBody)['record']['data'];
          return parsedData;
        }
      }
      return []; // Set an empty list to indicate no data
    } catch (error) {
      return []; // Set an empty list to indicate no data
    }
  }

//! i am meant for the displaying top or most pressing sites in the world
  Future<List<dynamic>> fetchTopData() async {
    try {
      final response = await http.get(
          Uri.parse(fetchTopDataURL));
      if (response.statusCode == 200) {
        final responseBody = response.body;
        if (responseBody != null) {
          final parsedData = json.decode(responseBody)['record']['data'];
          return parsedData;
        }
      }
    } catch (error) {
      print('Error fetching data: $error');
    }

    return []; // Set an empty list to indicate no data
  }


  //! they call me others yes i am use to display many sites
  Future<List<dynamic>> fetchOtherData() async {
    try {
      final response = await http.get(
          Uri.parse(fetchOtherDataURL));
      if (response.statusCode == 200) {
        final responseBody = response.body;

        if (responseBody != null) {
          final parsedData = json.decode(responseBody)['record']['data'];
          return parsedData;
        }
      }
      return [];
    } catch (error) {
      return [];
    }
  }

  