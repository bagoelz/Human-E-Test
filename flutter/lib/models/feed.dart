class Feeder {
  final String feedId;
  final String feedName;
  final String? feedProfile;
  final List? subscriptionId;

  Feeder(
      {required this.feedId,
      required this.feedName,
      this.feedProfile,
      this.subscriptionId});

  factory Feeder.fromJson(Map<String, dynamic> json) {
    return Feeder(
        feedId: json['feedId'].toString(),
        feedName: json['feedName'],
        feedProfile: json['feedProfile'] .toString(),
        subscriptionId: json['subscriptionId'] ?? '');
  }
}
