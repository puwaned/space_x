class LaunchPadModel {
  final String id;
  final String name;
  final String region;
  final String fullName;
  final String locality;
  final double latitude;
  final double longitude;
  final int? launchAttempt;
  final int? launchSuccess;
  final String? details;
  final List<String> images;

  factory LaunchPadModel.fromJson(Map<String, dynamic> json) {
    var images = json['images']['large'] ?? [];

    return LaunchPadModel(
        images: List<String>.from(images),
        name: json['name'],
        id: json['id'],
        details: json['details'],
        fullName: json['full_name'],
        latitude: json['latitude'],
        launchAttempt: json['launch_attempts'],
        launchSuccess: json['launch_successes'],
        locality: json['locality'],
        longitude: json['longitude'],
        region: json['region']);
  }

  LaunchPadModel(
      {required this.images,
      required this.name,
      required this.id,
      required this.details,
      required this.fullName,
      required this.latitude,
      required this.launchAttempt,
      required this.launchSuccess,
      required this.locality,
      required this.longitude,
      required this.region});
}
