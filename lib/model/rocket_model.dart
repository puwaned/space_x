class RocketModel {
  final String id;
  final List<String> images;
  final String name;
  final int? costPerLaunch;
  final String country;
  final String company;
  final String description;
  final String wikipedia;
  final RocketLandingLeg landingLeg;
  final RocketMassModel mass;
  final RocketHeightModel height;

  final List<RocketPayloadWeightModel> payloadWeights;

  factory RocketModel.fromJson(Map<String, dynamic> json) {
    var height = RocketHeightModel.fromJson(json['height']);
    var mass = RocketMassModel.fromJson(json['mass']);
    var landingLeg = RocketLandingLeg.fromJson(json['landing_legs']);
    var payloadWeights =
        RocketPayloadWeightModel.parseList(json['payload_weights']);

    return RocketModel(
        id: json['id'],
        height: height,
        mass: mass,
        landingLeg: landingLeg,
        payloadWeights: payloadWeights,
        wikipedia: json['wikipedia'],
        images: List<String>.from(json['flickr_images'] ?? []),
        name: json['name'],
        company: json['company'],
        costPerLaunch: json['costPerLaunch'],
        country: json['country'],
        description: json['description']);
  }

  RocketModel(
      {required this.id,
      required this.wikipedia,
      required this.images,
      required this.name,
      required this.company,
      required this.costPerLaunch,
      required this.country,
      required this.description,
      required this.height,
      required this.landingLeg,
      required this.mass,
      required this.payloadWeights});
}

class RocketHeightModel {
  final double meters;
  final double feet;

  factory RocketHeightModel.fromJson(Map<String, dynamic> json) {
    return RocketHeightModel(
        feet: json['feet'].toDouble(), meters: json['meters'].toDouble());
  }

  RocketHeightModel({required this.feet, required this.meters});
}

class RocketMassModel {
  final double kg;
  final double lb;

  factory RocketMassModel.fromJson(Map<String, dynamic> json) {
    return RocketMassModel(
        kg: json['kg'].toDouble(), lb: json['lb'].toDouble());
  }

  RocketMassModel({required this.kg, required this.lb});
}

class RocketLandingLeg {
  final int number;
  final String material;

  factory RocketLandingLeg.fromJson(Map<String, dynamic> json) {
    return RocketLandingLeg(material: json['material'], number: json['number']);
  }

  RocketLandingLeg({required this.material, required this.number});
}

class RocketPayloadWeightModel {
  final String id;
  final String name;
  final double kg;
  final double lb;

  factory RocketPayloadWeightModel.fromJson(Map<String, dynamic> json) {
    return RocketPayloadWeightModel(
        kg: json['kg'].toDouble(),
        lb: json['lb'].toDouble(),
        name: json['name'],
        id: json['id']);
  }

  static List<RocketPayloadWeightModel> parseList(List<dynamic> list) {
    return list.map((e) => RocketPayloadWeightModel.fromJson(e)).toList();
  }

  RocketPayloadWeightModel(
      {required this.lb,
      required this.kg,
      required this.name,
      required this.id});
}
