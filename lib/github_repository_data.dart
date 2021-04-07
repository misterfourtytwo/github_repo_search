class GithubRepositoryData {
  final String title;
  final String username;
  final String userAvatar;
  final int stars;
  final DateTime dateLastUpdated;

  const GithubRepositoryData({
    required this.title,
    required this.username,
    this.stars = 0,
    required this.dateLastUpdated,
    this.userAvatar = '',
  });
}
