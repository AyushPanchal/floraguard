import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flora_guard/features/predict/model/plant_model.dart';
import 'package:get/get.dart';

class PlantDetailRepository extends GetxController {
  static PlantDetailRepository get instance => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final cashewCollection = "cashew_collection";
  final cassavaCollection = "cassava_collection";
  final maizeCollection = "maize_collection";
  final tomatoCollection = "tomato_collection";
  final userCollection = "Users";

  Future<void> addCashewPlant(PlantModel plant, String userId) async {
    try {
      final plantRef = await _firestore
          .collection(userCollection)
          .doc(userId)
          .collection(cashewCollection)
          .add(plant.toJson());

      plant.plantId = plantRef.id;

      await plantRef.update({'plantId': plant.plantId});
    } catch (e) {
      log('Error adding plant: $e');
      rethrow;
    }
  }

  Future<void> addCassavaPlant(PlantModel plant, String userId) async {
    try {
      final plantRef = await _firestore
          .collection(userCollection)
          .doc(userId)
          .collection(cassavaCollection)
          .add(plant.toJson());

      plant.plantId = plantRef.id;

      await plantRef.update({'plantId': plant.plantId});
    } catch (e) {
      log('Error adding plant: $e');
      rethrow;
    }
  }

  Future<void> addMaizePlant(PlantModel plant, String userId) async {
    try {
      final plantRef = await _firestore
          .collection(userCollection)
          .doc(userId)
          .collection(maizeCollection)
          .add(plant.toJson());

      plant.plantId = plantRef.id;

      await plantRef.update({'plantId': plant.plantId});
    } catch (e) {
      log('Error adding plant: $e');
      rethrow;
    }
  }

  Future<void> addTomatoPlant(PlantModel plant, String userId) async {
    try {
      final plantRef = await _firestore
          .collection(userCollection)
          .doc(userId)
          .collection(tomatoCollection)
          .add(plant.toJson());

      plant.plantId = plantRef.id;

      await plantRef.update({'plantId': plant.plantId});
    } catch (e) {
      log('Error adding plant: $e');
      rethrow;
    }
  }

  Stream<PlantModel> getCurrentCashewPlant(String plantId, String userId) {
    return _firestore
        .collection(userCollection)
        .doc(userId)
        .collection(cashewCollection)
        .doc(plantId)
        .snapshots()
        .map((snapshot) {
      return PlantModel.fromJson(snapshot.data()!);
    });
  }

  Stream<PlantModel> getCurrentCassavaPlant(String plantId, String userId) {
    return _firestore
        .collection(userCollection)
        .doc(userId)
        .collection(cassavaCollection)
        .doc(plantId)
        .snapshots()
        .map((snapshot) {
      return PlantModel.fromJson(snapshot.data()!);
    });
  }

  Stream<PlantModel> getCurrentMaizePlant(String plantId, String userId) {
    return _firestore
        .collection(userCollection)
        .doc(userId)
        .collection(maizeCollection)
        .doc(plantId)
        .snapshots()
        .map((snapshot) {
      return PlantModel.fromJson(snapshot.data()!);
    });
  }

  Stream<PlantModel> getCurrentTomatoPlant(String plantId, String userId) {
    return _firestore
        .collection(userCollection)
        .doc(userId)
        .collection(tomatoCollection)
        .doc(plantId)
        .snapshots()
        .map((snapshot) {
      return PlantModel.fromJson(snapshot.data()!);
    });
  }

  Future<void> updateCashewPlant(PlantModel plant, String userId) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(userId)
          .collection(cashewCollection)
          .doc(plant.plantId)
          .update(plant.toJson());
    } catch (e) {
      log('Error updating patient: $e');
      rethrow;
    }
  }

  Future<void> updateCassavaPlant(PlantModel plant, String userId) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(userId)
          .collection(cassavaCollection)
          .doc(plant.plantId)
          .update(plant.toJson());
    } catch (e) {
      log('Error updating patient: $e');
      rethrow;
    }
  }

  Future<void> updateMaizePlant(PlantModel plant, String userId) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(userId)
          .collection(maizeCollection)
          .doc(plant.plantId)
          .update(plant.toJson());
    } catch (e) {
      log('Error updating patient: $e');
      rethrow;
    }
  }

  Future<void> updateTomatoPlant(PlantModel plant, String userId) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(userId)
          .collection(tomatoCollection)
          .doc(plant.plantId)
          .update(plant.toJson());
    } catch (e) {
      log('Error updating patient: $e');
      rethrow;
    }
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    try {
      // Create a reference for the image file
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = _storage.ref().child('plant_images/$fileName.jpg');

      // Upload the file to Firebase Storage
      await ref.putFile(imageFile);

      // Get the download URL of the uploaded image
      return await ref.getDownloadURL();
    } catch (e) {
      log('Error uploading image to Firebase Storage: $e');
      return "";
    }
  }
}
