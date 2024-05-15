import 'package:flora_guard/data/repositories/authentication/authentication_repository.dart';
import 'package:flora_guard/data/repositories/plant_detail/plant_detail_repository.dart';
import 'package:get/get.dart';

import '../model/plant_model.dart';

class PlantController extends GetxController {
  static PlantController get instance => Get.find();
  final PlantDetailRepository _plantDetailRepository =
      PlantDetailRepository.instance;
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository.instance;
  PlantModel plantModel = PlantModel(
      plantSolution: ["", ""],
      timeStamp: DateTime.now().toString(),
      info: "",
      plantType: "",
      predictionResult: "");

  updateCashewPlant(PlantModel plant, String userId) {
    _plantDetailRepository.updateCashewPlant(plant, userId);
  }

  updateCassavaPlant(PlantModel plant, String userId) {
    _plantDetailRepository.updateCassavaPlant(plant, userId);
  }

  updateMaizePlant(PlantModel plant, String userId) {
    _plantDetailRepository.updateMaizePlant(plant, userId);
  }

  updateTomatoPlant(PlantModel plant, String userId) {
    _plantDetailRepository.updateTomatoPlant(plant, userId);
  }

  Stream<PlantModel> getCurrentCashewPlant() {
    return _plantDetailRepository.getCurrentCashewPlant(
        plantModel.plantId!, _authenticationRepository.authUser!.uid);
  }

  Stream<PlantModel> getCurrentCassavaPlant() {
    return _plantDetailRepository.getCurrentCassavaPlant(
        plantModel.plantId!, _authenticationRepository.authUser!.uid);
  }

  Stream<PlantModel> getCurrentMaizePlant() {
    return _plantDetailRepository.getCurrentMaizePlant(
        plantModel.plantId!, _authenticationRepository.authUser!.uid);
  }

  Stream<PlantModel> getCurrentTomatoPlant() {
    return _plantDetailRepository.getCurrentTomatoPlant(
        plantModel.plantId!, _authenticationRepository.authUser!.uid);
  }
}
