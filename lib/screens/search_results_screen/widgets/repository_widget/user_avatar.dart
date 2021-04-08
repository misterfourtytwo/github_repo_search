import 'package:flutter/material.dart';
import 'package:github_repo_search/styles/colors.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: DecoratedBox(
        decoration: BoxDecoration(color: MyColors.imageBackground),
        child: SizedBox(
          height: 30,
          width: 30,
          child: url.isNotEmpty
              ? Image.network(
                  url,
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                )
              : null,
        ),
      ),
    );
  }
}
