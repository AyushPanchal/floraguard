// To parse this JSON data, do
//
//     final depressedPatientDetailModel = depressedPatientDetailModelFromJson(jsonString);

import 'dart:convert';

PlantModel depressedPatientDetailModelFromJson(String str) =>
    PlantModel.fromJson(json.decode(str));

String depressedPatientDetailModelToJson(PlantModel data) =>
    json.encode(data.toJson());

class PlantModel {
  String? timeStamp;
  String? plantType;
  String? predictionResult;
  String? plantId;
  String? plantUrl;
  List<String?>? plantSolution;
  String? info;

  PlantModel({
    this.timeStamp,
    this.plantType,
    this.predictionResult,
    this.plantId,
    this.plantUrl,
    this.plantSolution,
    this.info,
  });

  PlantModel copyWith({
    String? timeStamp,
    String? plantType,
    String? predictionResult,
    String? plantId,
    String? plantUrl,
    List<String?>? plantSolution,
    String? info,
  }) =>
      PlantModel(
        timeStamp: timeStamp ?? this.timeStamp,
        plantType: plantType ?? this.plantType,
        predictionResult: predictionResult ?? this.predictionResult,
        plantId: plantId ?? this.plantId,
        plantUrl: plantUrl ?? this.plantUrl,
        plantSolution: plantSolution ?? this.plantSolution,
        info: info ?? this.info,
      );

  factory PlantModel.fromJson(Map<String, dynamic> json) => PlantModel(
        timeStamp: json["timeStamp"],
        plantType: json["plantType"],
        predictionResult: json["predictionResult"],
        plantId: json["plantId"],
        plantUrl: json["plantUrl"],
        plantSolution: List<String>.from(json["plantSolution"].map((x) => x)),
        info: json["info"],
      );

  Map<String, dynamic> toJson() => {
        "timeStamp": timeStamp,
        "plantType": plantType,
        "predictionResult": predictionResult,
        "plantId": plantId,
        "plantUrl": plantUrl,
        "plantSolution": List<dynamic>.from(plantSolution!.map((x) => x)),
        "info": info,
      };
}
