import 'dart:convert';

class GithubRepositoryData {
  final int id;
  final String title;
  final String username;
  final String url;

  final String userAvatar;
  final int stars;
  final String _updatedAt;
  DateTime? get updatedAt => DateTime.tryParse(_updatedAt) ?? null;

  const GithubRepositoryData({
    required this.id,
    required this.title,
    required this.username,
    this.url = '',
    this.userAvatar = '',
    this.stars = 0,
    String? updatedTimestamp,
  }) : _updatedAt = updatedTimestamp ?? '';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'username': username,
      'url': url,
      'userAvatar': userAvatar,
      'stars': stars,
      'updatedTimestamp': _updatedAt,
    };
  }

  factory GithubRepositoryData.fromMap(Map<String, dynamic?> map) {
    return GithubRepositoryData(
      id: map['id'],
      title: map['name'],
      url: map['html_url'],
      username: map['owner']['login'],
      userAvatar: map['owner']['avatar_url'],
      stars: map['stargazers_count'],
      updatedTimestamp: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubRepositoryData.fromJson(String source) =>
      GithubRepositoryData.fromMap(json.decode(source));
}
