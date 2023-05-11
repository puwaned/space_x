class PaginationModel<T> {
  List<T> docs;
  final int totalDocs;
  final int limit;
  final int page;
  final bool hasPrevPage;
  final bool hasNextPage;
  final int? nextPage;

  factory PaginationModel.empty() {
    return PaginationModel(
        docs: [],
        hasNextPage: false,
        hasPrevPage: false,
        limit: 0,
        nextPage: null,
        page: 1,
        totalDocs: 0);
  }

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
