
class LaunchFilter {
  final int page;
  String? search;
  int? sortName;
  int? sortFireDate;

  LaunchFilter(
      {required this.page, this.sortName, this.sortFireDate, this.search});

  LaunchFilter copyWith(
      {int? page, String? search, int? sortName, int? sortFireDate}) {
    return LaunchFilter(
        page: page ?? this.page,
        search: search ?? this.search,
        sortName: sortName ?? this.sortName,
        sortFireDate: sortFireDate ?? this.sortFireDate);
  }
}

class LaunchModel {
  final String id;
  final LinksModel? links;
  final String? details;
  final bool? success;
  final String name;
  final DateTime? fireDate;
  final List<String> crews;
  final String? rocket;
  final String? launchPad;

  static List<LaunchModel> parseList(List<dynamic> list) {
    return list.map((e) => LaunchModel.fromJson(e)).toList();
  }

  factory LaunchModel.fromJson(Map<String, dynamic> json) {
    var fd = json['static_fire_date_utc'];
    var fireDate = fd != null
        ? DateTime.parse(json['static_fire_date_utc']).toLocal()
        : null;
    var links =
        json['links'] != null ? LinksModel.fromJson(json['links']) : null;
    var crews = json['crew'].map((e) => e['crew']!).toList();

    return LaunchModel(
        links: links,
        id: json['id'] ?? 'null',
        details: json['details'],
        name: json['name'] ?? 'null',
        fireDate: fireDate,
        success: json['success'],
        rocket: json['rocket'],
        launchPad: json['launchpad'],
        crews: List<String>.from(crews));
  }

  LaunchModel(
      {required this.links,
      required this.id,
      required this.details,
      required this.name,
      required this.fireDate,
      required this.success,
      required this.crews,
      required this.launchPad,
      required this.rocket});
}

class LinksModel {
  final FlickrModel? flickr;
  final PatchModel? patch;
  final String webcast;

  factory LinksModel.fromJson(Map<String, dynamic> json) {
    var flickr =
        json['flickr'] != null ? FlickrModel.fromJson(json['flickr']) : null;
    var patch =
        json['patch'] != null ? PatchModel.fromJson(json['patch']) : null;
    return LinksModel(
        flickr: flickr, patch: patch, webcast: json['webcast'] ?? 'null');
  }

  LinksModel(
      {required this.flickr, required this.patch, required this.webcast});
}

class PatchModel {
  final String? small;
  final String? large;

  factory PatchModel.fromJson(Map<String, dynamic> json) {
    return PatchModel(small: json['small'], large: json['large']);
  }

  PatchModel({required this.small, required this.large});
}

class FlickrModel {
  final List<String> small;
  final List<String> original;

  factory FlickrModel.fromJson(Map<String, dynamic> json) {
    return FlickrModel(
        original: List<String>.from(json['original'] ?? []),
        small: List<String>.from(json['small'] ?? []));
  }

  FlickrModel({required this.original, required this.small});
}
