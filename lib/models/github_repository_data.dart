class GithubRepositoryData {
  final int id;
  final String title;
  final String username;
  final String url;
  final String description;
  final String userAvatar;
  final int stars;
  final String _updatedAt;
  DateTime? get updatedAt => DateTime.tryParse(_updatedAt) ?? null;

  const GithubRepositoryData({
    required this.id,
    required this.title,
    required this.username,
    this.url = '',
    this.description = '',
    this.userAvatar = '',
    this.stars = 0,
    String? updatedTimestamp,
  }) : _updatedAt = updatedTimestamp ?? '';
}
