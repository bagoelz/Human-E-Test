import 'package:feedsubscriber/models/feed.dart';

abstract class BaseFeedRepository {
  //Future<List<Feeder>?> getAutocomplete(String searchInput) async {}

  Future<List<Feeder>?> getFeed() async {}
}
