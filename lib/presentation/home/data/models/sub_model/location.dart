import '../../../../../core/api/end_points.dart';

class Location {
  String? name;
  String? url;

  Location({this.name, this.url});

  Location.fromJson(Map<String, dynamic> json) {
    name = json[ApiKeys.name];
    url = json[ApiKeys.url];
  }
}
