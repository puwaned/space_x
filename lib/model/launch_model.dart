class LaunchModel {
  final String id;
  final LinksModel? links;
  final String details;
  final bool success;
  final String name;
  final DateTime? dateLocal;

  static List<LaunchModel> parseList(List<dynamic> list) {
    return list.map((e) => LaunchModel.fromJson(e)).toList();
  }

  factory LaunchModel.fromJson(Map<String, dynamic> json) {
    var fireDate = json['static_fire_date_utc'];
    var dateLocal = fireDate != null
        ? DateTime.parse(json['static_fire_date_utc']).toLocal()
        : null;
    var links =
        json['links'] != null ? LinksModel.fromJson(json['links']) : null;
    return LaunchModel(
        links: links,
        id: json['id'] ?? 'null',
        details: json['details'] ?? 'null',
        name: json['name'] ?? 'null',
        dateLocal: dateLocal,
        success: json['success']);
  }

  LaunchModel(
      {required this.links,
      required this.id,
      required this.details,
      required this.name,
      required this.dateLocal,
      required this.success});
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
  final String small;
  final String large;

  factory PatchModel.fromJson(Map<String, dynamic> json) {
    return PatchModel(
        small: json['small'] ?? 'null', large: json['large'] ?? 'null');
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
