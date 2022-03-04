import 'dart:convert';

import 'package:feedsubscriber/models/feed.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'base_feed.dart';

class FeedRepository extends BaseFeedRepository {
  final String apiUrl = 'http://192.168.42.142:3000/';

  @override
  // Future<List<PlaceAutocomplete>> getAutocomplete(String searchInput) async {
  //   final String url =
  //       'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

  //   var response = await http.get(Uri.parse(url));
  //   var json = convert.jsonDecode(response.body);
  //   var results = json['predictions'] as List;

  //   return results.map((place) => PlaceAutocomplete.fromJson(place)).toList();
  // }

  @override
  Future<List<Feeder>> getFeed([int startIndex = 0]) async {
    final response = await http.get(Uri.parse(
        apiUrl + 'feed?_start=${startIndex}&_end=${startIndex + 15}'));
    List<Feeder> feeds = <Feeder>[];
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      body.forEach((value) {
        feeds.add(Feeder.fromJson(value));
      });
      return feeds;
    }

    throw Exception('error fetching posts');
  }
}
