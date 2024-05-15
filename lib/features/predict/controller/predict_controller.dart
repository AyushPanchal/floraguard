import 'dart:developer';
import 'dart:io';

import 'package:flora_guard/common/widgets/loaders/loaders.dart';
import 'package:flora_guard/data/repositories/plant_detail/plant_detail_repository.dart';
import 'package:flora_guard/data/repositories/predict/predict_repository.dart';
import 'package:flora_guard/features/predict/controller/plant_controller.dart';
import 'package:flora_guard/features/predict/model/plant_model.dart';
import 'package:flora_guard/features/predict/screen/predict_result_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repositories/authentication/authentication_repository.dart';

class PredictController extends GetxController {
  static PredictController get instance => Get.find();

  Rx<File?> imageFile = Rx<File?>(null);
  final PredictRepository _predictRepository = PredictRepository.instance;
  final PlantDetailRepository _plantDetailRepository =
      PlantDetailRepository.instance;
  final PlantController _plantController = PlantController.instance;
  final result = "Upload image".obs;
  final resultInfo = "".obs;
  final imageSelected = true.obs;
  final _authenticationRepository = AuthenticationRepository.instance;

  Future<void> getImageAndUpload() async {
    imageSelected.value = false;
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    result.value = "";

    log("Message : ${result.value}");

    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
      imageSelected.value = true;

      // Upload image to Flask server
      Map<String, String> results =
          await _predictRepository.dummyRequest(imageFile.value!);
      result.value = results["predictionResult"]!;
      resultInfo.value = results["predictionInfo"]!;
    }

    log("Message : ${result.value}");
  }

  Future<void> getImagePredictCashew() async {
    // TLoaders._plantController.
    _plantController.plantModel.plantType = "Cashew";

    imageSelected.value = false;
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    result.value = "";

    log("Message : ${result.value}");

    if (pickedFile != null) {
      await _plantDetailRepository.addCashewPlant(
          _plantController.plantModel, _authenticationRepository.authUser!.uid);
      imageFile.value = File(pickedFile.path);
      imageSelected.value = true;
      String plantImageUrl =
          await _plantDetailRepository.uploadImageToStorage(imageFile.value!);
      _plantController.plantModel =
          _plantController.plantModel.copyWith(plantUrl: plantImageUrl);
      _plantController.updateCashewPlant(
          _plantController.plantModel, _authenticationRepository.authUser!.uid);

      // Upload image to Flask server
      Map<String, String> results =
          await _predictRepository.cashewPredict(imageFile.value!);
      result.value = results["predictionResult"]!;
      log(result.value);
      resultInfo.value = results["predictionInfo"]!;
      _plantController.plantModel =
          _plantController.plantModel.copyWith(predictionResult: result.value);
      _plantController.plantModel =
          _plantController.plantModel.copyWith(info: resultInfo.value);
      _plantDetailRepository
          .updateCashewPlant(_plantController.plantModel,
              _authenticationRepository.authUser!.uid)
          .then((value) => log("SuccessFull Prediction Stored"));
    }

    log("Message : ${result.value}");
  }

  Future<void> getImagePredictCassava() async {
    _plantController.plantModel.plantType = "Cassava";

    imageSelected.value = false;
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    result.value = "";

    log("Message : ${result.value}");

    if (pickedFile != null) {
      await _plantDetailRepository.addCassavaPlant(
          _plantController.plantModel, _authenticationRepository.authUser!.uid);
      imageFile.value = File(pickedFile.path);
      imageSelected.value = true;
      String plantImageUrl =
          await _plantDetailRepository.uploadImageToStorage(imageFile.value!);
      _plantController.plantModel =
          _plantController.plantModel.copyWith(plantUrl: plantImageUrl);
      _plantController.updateCassavaPlant(
          _plantController.plantModel, _authenticationRepository.authUser!.uid);

      // Upload image to Flask server
      Map<String, String> results =
          await _predictRepository.cassavaPredict(imageFile.value!);
      result.value = results["predictionResult"]!;
      log(result.value);
      resultInfo.value = results["predictionInfo"]!;
      _plantController.plantModel =
          _plantController.plantModel.copyWith(predictionResult: result.value);
      _plantController.plantModel =
          _plantController.plantModel.copyWith(info: resultInfo.value);
      _plantDetailRepository
          .updateCassavaPlant(_plantController.plantModel,
              _authenticationRepository.authUser!.uid)
          .then((value) => log("SuccessFull Prediction Stored"));
    }

    log("Message : ${result.value}");
  }

  Future<void> getImagePredictMaize() async {
    _plantController.plantModel.plantType = "Maize";

    imageSelected.value = false;
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    result.value = "";

    log("Message : ${result.value}");

    if (pickedFile != null) {
      await _plantDetailRepository.addMaizePlant(
          _plantController.plantModel, _authenticationRepository.authUser!.uid);
      imageFile.value = File(pickedFile.path);
      imageSelected.value = true;
      String plantImageUrl =
          await _plantDetailRepository.uploadImageToStorage(imageFile.value!);
      _plantController.plantModel =
          _plantController.plantModel.copyWith(plantUrl: plantImageUrl);
      _plantController.updateMaizePlant(
          _plantController.plantModel, _authenticationRepository.authUser!.uid);

      // Upload image to Flask server
      Map<String, String> results =
          await _predictRepository.maizePredict(imageFile.value!);
      result.value = results["predictionResult"]!;
      log(result.value);
      resultInfo.value = results["predictionInfo"]!;
      _plantController.plantModel =
          _plantController.plantModel.copyWith(predictionResult: result.value);
      _plantController.plantModel =
          _plantController.plantModel.copyWith(info: resultInfo.value);
      _plantDetailRepository
          .updateMaizePlant(_plantController.plantModel,
              _authenticationRepository.authUser!.uid)
          .then((value) => log("SuccessFull Prediction Stored"));
    }

    log("Message : ${result.value}");
  }

  Future<void> getImagePredictTomato() async {
    _plantController.plantModel.plantType = "Tomato";

    imageSelected.value = false;
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    result.value = "";

    log("Message : ${result.value}");

    if (pickedFile != null) {
      await _plantDetailRepository.addTomatoPlant(
          _plantController.plantModel, _authenticationRepository.authUser!.uid);
      imageFile.value = File(pickedFile.path);
      imageSelected.value = true;
      String plantImageUrl =
          await _plantDetailRepository.uploadImageToStorage(imageFile.value!);
      _plantController.plantModel =
          _plantController.plantModel.copyWith(plantUrl: plantImageUrl);
      _plantController.updateTomatoPlant(
          _plantController.plantModel, _authenticationRepository.authUser!.uid);

      // Upload image to Flask server
      Map<String, String> results =
          await _predictRepository.tomatoPredict(imageFile.value!);
      result.value = results["predictionResult"]!;
      log(result.value);
      resultInfo.value = results["predictionInfo"]!;
      _plantController.plantModel =
          _plantController.plantModel.copyWith(predictionResult: result.value);
      _plantController.plantModel =
          _plantController.plantModel.copyWith(info: resultInfo.value);
      _plantDetailRepository
          .updateTomatoPlant(_plantController.plantModel,
              _authenticationRepository.authUser!.uid)
          .then((value) => log("SuccessFull Prediction Stored"));
    }

    log("Message : ${result.value}");
  }
}
