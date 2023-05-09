class PaginationModel<T> {
  List<T> docs;
  final int totalDocs;
  final int limit;
  final int page;
  final bool hasPrevPage;
  final bool hasNextPage;
  final int? nextPage;

  factory PaginationModel.fromJson(Map<String, dynamic> json, List<T> docs) {
    return PaginationModel(
        docs: docs,
        hasNextPage: json['hasNextPage'] ?? false,
        hasPrevPage: json['hasPrevPage'] ?? false,
        limit: json['limit'],
        nextPage: json['nextPage'],
        page: json['page'],
        totalDocs: json['totalDocs']);
  }

  PaginationModel(
      {required this.docs,
      required this.hasNextPage,
      required this.hasPrevPage,
      required this.limit,
      required this.nextPage,
      required this.page,
      required this.totalDocs});
}

class LaunchDetailScreenArguments {
  final String name;
  final String id;

  LaunchDetailScreenArguments({required this.name, required this.id});
}
