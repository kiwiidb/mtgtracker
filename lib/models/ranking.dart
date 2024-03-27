class Ranking {
  int wins;
  String name;
  String profileImageUrl;
  Ranking({
    required this.wins,
    required this.name,
    required this.profileImageUrl,
  });
  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
        wins: json['wins'],
        name: json['name'],
        profileImageUrl: json['profileImageUrl']);
  }
}

class RankingResponse {
  final List<Ranking> ranking;
  RankingResponse({required this.ranking});
  factory RankingResponse.fromJson(List<dynamic> json) {
    return RankingResponse(
        ranking: json.map((dynamic json) => Ranking.fromJson(json)).toList());
  }
}
