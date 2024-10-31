import '../../../../../core/api/end_points.dart';

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json[ApiKeys.name];
    url = json[ApiKeys.url];
  }
}