import 'package:feedsubscriber/models/feed.dart';
import 'package:feedsubscriber/widgets/ImageContainer.dart';
import 'package:flutter/material.dart';

class FeedTile extends StatelessWidget {
  const FeedTile({
    Key? key,
    required this.feeder,
  }) : super(key: key);

  final Feeder feeder;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          ImageContainer(width: 50, height: 50, url: feeder.feedProfile ?? ''),
      title: Text(feeder.feedName),
      trailing: const Icon(Icons.feed_outlined),
      onTap: () {},
    );
  }
}
