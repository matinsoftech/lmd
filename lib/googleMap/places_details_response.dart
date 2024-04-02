import 'dart:convert';

PlaceDetailsResponse placeDetailsResponseFromJson(String str) =>
    PlaceDetailsResponse.fromJson(json.decode(str));

class PlaceDetailsResponse {
  PlaceDetails result;
  String status;

  PlaceDetailsResponse({
    PlaceDetails? result,
    String? status,
  }) : result = result!,
       status = status!;

  factory PlaceDetailsResponse.fromJson(Map<String, dynamic> json) =>
      PlaceDetailsResponse(
        result: json["result"] == null
            ? null
            : PlaceDetails.fromJson(json["result"]),
        status: json["status"] ?? "",
      );
}

class PlaceDetails {
  Geometry geometry;

  PlaceDetails({
    Geometry? geometry,
  }) : geometry = geometry!;

  factory PlaceDetails.fromJson(Map<String, dynamic> json) => PlaceDetails(
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
      );
}

class Geometry {
  Location location;

  Geometry({
    Location? location,
  }) : location = location!;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
      );
}

class Location {
  double lat;
  double lng;

  Location({
    double? lat,
    double? lng,
  })  : lat = lat!,
        lng = lng!;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"] ?? 0.0,
        lng: json["lng"] ?? 0.0,
      );
}
