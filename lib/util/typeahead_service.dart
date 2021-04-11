import 'dart:convert';

import 'package:http/http.dart' as http;

class StateServiceCategory {
  static Future<List<dynamic>> getSuggestions(String query) async {
    final response = await http
        .get("https://genius.remax.co.id/papi/ListingCategory?language=id_ID");
    List list = json.decode(response.body)['data'];

    list.retainWhere(
            (s) => s['lsclName'].toLowerCase().contains(query.toLowerCase()));
    return list;
  }
}

class StateServicePropertyType {
  static Future<List<dynamic>> getSuggestions(String query) async {
    final response = await http
        .get("https://genius.remax.co.id/papi/PropertyType?language=id_ID");
    List list = json.decode(response.body)['data'];

    list.retainWhere(
            (s) => s['prtlName'].toLowerCase().contains(query.toLowerCase()));
    return list;
  }
}

class StateServiceFacilites {
  static Future<List<dynamic>> getSuggestions(String query) async {
    final response = await http
        .get("https://genius.remax.co.id/papi/facility?language=id_ID");
    List list = json.decode(response.body)['data'];

    list.retainWhere(
            (s) => s['fctlName'].toLowerCase().contains(query.toLowerCase()));
    return list;
  }
}
class StateServiceRentFreq {
  static Future<List<dynamic>> getSuggestions(String query) async {
    final response = await http
        .get("https://genius.remax.co.id/papi/RentFrequency?language=id_ID");
    List list = json.decode(response.body)['data'];

    list.retainWhere(
            (s) => s['rfqlName'].toLowerCase().contains(query.toLowerCase()));
    return list;
  }
}

class StateServiceListingStatus {
  static Future<List<dynamic>> getSuggestions(String query) async {
    final response = await http
        .get("https://genius.remax.co.id/papi/ListingStatus?language=id_ID");
    List list = json.decode(response.body)['data'];

    list.retainWhere(
            (s) => s['lstlName'].toLowerCase().contains(query.toLowerCase()));
    return list;
  }
}

