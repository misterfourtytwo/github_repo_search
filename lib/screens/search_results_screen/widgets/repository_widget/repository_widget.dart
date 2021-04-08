import 'package:flutter/material.dart';
import 'package:github_repo_search/models/github_repository_data.dart';
import 'package:github_repo_search/screens/search_results_screen/widgets/repository_widget/stars_badge.dart';
import 'package:github_repo_search/screens/search_results_screen/widgets/repository_widget/user_avatar.dart';
import 'package:github_repo_search/styles/colors.dart';
import 'package:github_repo_search/styles/text_styles.dart';
import 'package:intl/intl.dart';

class RepositoryWidget extends StatelessWidget {
  const RepositoryWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  static final dateFormatter = DateFormat('d MMMM', 'ru_RU');

  final GithubRepositoryData data;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColors.borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 109,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          data.title,
                          style: repoTitleTextStyle,
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            UserAvatar(url: data.userAvatar),
                            SizedBox(width: 8),
                            Text(
                              data.username,
                              style: repoUsernameTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  StarsBadge(count: data.stars),
                ],
              ),
              SizedBox(height: 8),
              Divider(
                height: 1,
                color: MyColors.shimmerColor,
              ),
              SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  text: 'Обновлено: ',
                  children: [
                    TextSpan(
                      text:
                          '${data.updatedAt != null ? dateFormatter.format(data.updatedAt!) : 'Неизвестно'}',
                      style: searchResultsSubtitleTextStyle.copyWith(
                        color: MyColors.black,
                      ),
                    ),
                  ],
                  style: searchResultsSubtitleTextStyle,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
