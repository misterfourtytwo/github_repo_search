import 'package:flutter/material.dart';
import 'package:github_repo_search/styles/text_styles.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: SizedBox(
            height: 42,
            child: Center(
              child: Text(
                'Найти'.toUpperCase(),
                style: homeSearchButtonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
