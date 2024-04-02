import 'dart:convert';

PlaceAutoResponse placeAutoResponseFromJson(String str) =>
    PlaceAutoResponse.fromJson(json.decode(str));

String placeAutoResponseToJson(PlaceAutoResponse data) =>
    json.encode(data.toJson());

class PlaceAutoResponse {
  List<Prediction> predictions;
  String status;

  PlaceAutoResponse({
    List<Prediction>? predictions,
    String? status,
  })  : predictions = predictions ?? [],
        status = status ?? "";

  factory PlaceAutoResponse.fromJson(Map<String, dynamic> json) =>
      PlaceAutoResponse(
        predictions: json["predictions"] == null
            ? []
            : List<Prediction>.from(
                json["predictions"].map((x) => Prediction.fromJson(x))),
        status: json["status"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "predictions": predictions.map((x) => x.toJson()).toList(),
        "status": status,
      };
}

class Prediction {
  String description;
  List<MatchedSubstring> matchedSubstrings;
  String placeId;
  String reference;
  StructuredFormatting structuredFormatting;
  List<Term> terms;
  List<String> types;

  Prediction({
    String? description,
    List<MatchedSubstring>? matchedSubstrings,
    String? placeId,
    String? reference,
    StructuredFormatting? structuredFormatting,
    List<Term>? terms,
    List<String>? types,
  })  : description = description ?? "",
        matchedSubstrings = matchedSubstrings ?? [],
        placeId = placeId ?? "",
        reference = reference ?? "",
        structuredFormatting = structuredFormatting!,
        terms = terms ?? [],
        types = types ?? [];

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
        description: json["description"] ?? "",
        matchedSubstrings: json["matched_substrings"] == null
            ? []
            : List<MatchedSubstring>.from(json["matched_substrings"]
                .map((x) => MatchedSubstring.fromJson(x))),
        placeId: json["place_id"] ?? "",
        reference: json["reference"] ?? "",
        structuredFormatting: json["structured_formatting"] == null
            ? null
            : StructuredFormatting.fromJson(json["structured_formatting"]),
        terms: json["terms"] == null
            ? []
            : List<Term>.from(json["terms"].map((x) => Term.fromJson(x))),
        types: json["types"] == null
            ? []
            : List<String>.from(json["types"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "matched_substrings": matchedSubstrings.map((x) => x.toJson()).toList(),
        "place_id": placeId,
        "reference": reference,
        "structured_formatting": structuredFormatting.toJson(),
        "terms": terms.map((x) => x.toJson()).toList(),
        "types": types,
      };
}

class MatchedSubstring {
  int length;
  int offset;

  MatchedSubstring({
    int? length,
    int? offset,
  })  : length = length ?? 0,
        offset = offset ?? 0;

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) =>
      MatchedSubstring(
        length: json["length"] ?? 0,
        offset: json["offset"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "length": length,
        "offset": offset,
      };
}

class StructuredFormatting {
  String mainText;
  List<MatchedSubstring> mainTextMatchedSubstrings;
  String secondaryText;

  StructuredFormatting({
    String? mainText,
    List<MatchedSubstring>? mainTextMatchedSubstrings,
    String? secondaryText,
  })  : mainText = mainText ?? "",
        mainTextMatchedSubstrings = mainTextMatchedSubstrings ?? [],
        secondaryText = secondaryText ?? "";

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) =>
      StructuredFormatting(
        mainText: json["main_text"] ?? "",
        mainTextMatchedSubstrings: json["main_text_matched_substrings"] == null
            ? []
            : List<MatchedSubstring>.from(json["main_text_matched_substrings"]
                .map((x) => MatchedSubstring.fromJson(x))),
        secondaryText: json["secondary_text"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "main_text": mainText,
        "main_text_matched_substrings":
            mainTextMatchedSubstrings.map((x) => x.toJson()).toList(),
        "secondary_text": secondaryText,
      };
}

class Term {
  int offset;
  String value;

  Term({
    int? offset,
    String? value,
  })  : offset = offset ?? 0,
        value = value ?? "";

  factory Term.fromJson(Map<String, dynamic> json) => Term(
        offset: json["offset"] ?? 0,
        value: json["value"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "value": value,
      };
}
