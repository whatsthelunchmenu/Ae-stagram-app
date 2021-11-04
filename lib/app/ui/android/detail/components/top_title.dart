import 'package:ae_stagram_app/app/data/model/models.dart' show FeedInfo;
import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  const Top({
    Key? key,
    required this.feed,
  }) : super(key: key);

  final FeedInfo feed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 10,
            right: 10,
            bottom: 10,
          ),
          child: CircleAvatar(
            radius: 15,
          ),
        ),
        Text(
          feed.displayName,
        ),
      ],
    );
  }
}
