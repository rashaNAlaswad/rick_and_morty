import '../../../../core/api/end_points.dart';
import 'sub_model/location.dart';
import 'sub_model/origin.dart';

class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  Character.fromJson(Map<String, dynamic> json) {
    id = json[ApiKeys.id];
    name = json[ApiKeys.name];
    status = json[ApiKeys.status];
    species = json[ApiKeys.species];
    type = json[ApiKeys.type];
    gender = json[ApiKeys.gender];
    origin = Origin.fromJson(json[ApiKeys.origin]);
    location = Location.fromJson(json[ApiKeys.location]);
    image = json[ApiKeys.image];
    episode = json[ApiKeys.episode].cast<String>();
    url = json[ApiKeys.url];
    created = json[ApiKeys.created];
  }
}
