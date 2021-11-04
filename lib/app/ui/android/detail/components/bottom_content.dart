import 'package:ae_stagram_app/app/data/model/models.dart' show FeedInfo;
import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({
    Key? key,
    required this.feed,
  }) : super(key: key);

  final FeedInfo feed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${feed.displayName}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          // Text('${feed.content}'),
          Text('${feed.content}'),
        ],
      ),
    );
  }
}
