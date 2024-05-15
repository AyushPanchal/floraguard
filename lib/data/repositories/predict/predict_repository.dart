import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/constants/api_constants.dart';

class PredictRepository extends GetxController {
  static PredictRepository get instance => Get.find();

  Future<Map<String, String>> dummyRequest(File image) async {
    const url = '${apiUrl}predict';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      // Handle response from server if needed
      // jsonDecode(response.body)['message'];
      var responseBody = await response.stream.bytesToString();

      log("response body $responseBody");

      var predictionResult = jsonDecode(responseBody)["prediction"];
      var predictionInfo = jsonDecode(responseBody)["info"];
      log('Prediction result: $predictionResult');
      return {
        "predictionResult": predictionResult,
        "predictionInfo": predictionInfo,
      };
    } else {
      log('Failed to upload image');
      return {
        "predictionResult": "",
        "predictionInfo": "",
      };
      ;
    }
  }

  Future<Map<String, String>> cashewPredict(File image) async {
    const url = '${apiUrl}predict_cashew';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      log("here in repo");
      // Handle response from server if needed
      // jsonDecode(response.body)['message'];
      var responseBody = await response.stream.bytesToString();

      log("response body $responseBody");

      var predictionResult = jsonDecode(responseBody)["prediction"];
      var predictionInfo = jsonDecode(responseBody)["info"];
      log('Prediction result: $predictionResult');
      return {
        "predictionResult": predictionResult,
        "predictionInfo": predictionInfo,
      };
    } else {
      log('Failed to upload image');
      return {
        "predictionResult": "",
        "predictionInfo": "",
      };
      ;
    }
  }

  Future<Map<String, String>> cassavaPredict(File image) async {
    const url = '${apiUrl}predict_cassava';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      log("here in repo");
      // Handle response from server if needed
      // jsonDecode(response.body)['message'];
      var responseBody = await response.stream.bytesToString();

      log("response body $responseBody");

      var predictionResult = jsonDecode(responseBody)["prediction"];
      var predictionInfo = jsonDecode(responseBody)["info"];
      log('Prediction result: $predictionResult');
      return {
        "predictionResult": predictionResult,
        "predictionInfo": predictionInfo,
      };
    } else {
      log('Failed to upload image');
      return {
        "predictionResult": "",
        "predictionInfo": "",
      };
    }
  }

  Future<Map<String, String>> maizePredict(File image) async {
    const url = '${apiUrl}predict_maize';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      log("here in repo");
      // Handle response from server if needed
      // jsonDecode(response.body)['message'];
      var responseBody = await response.stream.bytesToString();

      log("response body $responseBody");

      var predictionResult = jsonDecode(responseBody)["prediction"];
      var predictionInfo = jsonDecode(responseBody)["info"];
      log('Prediction result: $predictionResult');
      return {
        "predictionResult": predictionResult,
        "predictionInfo": predictionInfo,
      };
    } else {
      log('Failed to upload image');
      return {
        "predictionResult": "",
        "predictionInfo": "",
      };
    }
  }

  Future<Map<String, String>> tomatoPredict(File image) async {
    const url = '${apiUrl}predict_tomato';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      log("here in repo");
      // Handle response from server if needed
      // jsonDecode(response.body)['message'];
      var responseBody = await response.stream.bytesToString();

      log("response body $responseBody");

      var predictionResult = jsonDecode(responseBody)["prediction"];
      var predictionInfo = jsonDecode(responseBody)["info"];
      log('Prediction result: $predictionResult');
      return {
        "predictionResult": predictionResult,
        "predictionInfo": predictionInfo,
      };
    } else {
      log('Failed to upload image');
      return {
        "predictionResult": "",
        "predictionInfo": "",
      };
    }
  }
}
