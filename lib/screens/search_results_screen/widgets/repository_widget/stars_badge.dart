import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_repo_search/styles/text_styles.dart';

class StarsBadge extends StatelessWidget {
  const StarsBadge({
    Key? key,
    required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFFA6A6A6),
        borderRadius: BorderRadius.circular(50),
      ),
      child: SizedBox(
        height: 24,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 7),
            SvgPicture.asset(
              'assets/icons/star.svg',
              height: 16,
              color: Colors.white,
            ),
            SizedBox(width: 2),
            Text(
              '$count',
              style: repoStarCountTextStyle,
            ),
            SizedBox(width: 7),
          ],
        ),
      ),
    );
  }
}
