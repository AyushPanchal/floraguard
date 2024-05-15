import 'dart:async';

import 'package:flora_guard/features/predict/controller/plant_controller.dart';
import 'package:flora_guard/features/predict/controller/predict_controller.dart';
import 'package:flora_guard/features/predict/model/plant_model.dart';
import 'package:flora_guard/features/predict/screen/choosing_plant_screen.dart';
import 'package:flora_guard/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flora_guard/common/widgets/appbar/appbar.dart';
import 'package:flora_guard/utils/constants/colors.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';

class PredictResultScreen extends StatelessWidget {
  const PredictResultScreen({super.key, required this.plantType});

  final PlantType plantType;
  @override
  Widget build(BuildContext context) {
    final predictController = PredictController.instance;
    final plantController = PlantController.instance;

    Stream<PlantModel> getStream() {
      if (plantType == PlantType.cashew) {
        return plantController.getCurrentCashewPlant();
      } else if (plantType == PlantType.cassava) {
        return plantController.getCurrentCassavaPlant();
      } else if (plantType == PlantType.maize) {
        return plantController.getCurrentMaizePlant();
      } else {
        return plantController.getCurrentTomatoPlant();
      }
    }

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Results",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: StreamBuilder(
            builder: (context, data) {
              if (data.data != null && data.hasData) {
                final plant = data.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: TSizes.spaceBtwSections * 0.9,
                    ),
                    Center(
                      child: Text(
                        "Plant Type : ${plant.plantType}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Center(
                      child: RoundedContainer(
                        height: 208,
                        width: 208,
                        backgroundColor: Colors.black,
                        showBorder: true,
                        child: plant.plantUrl != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image(
                                  image: NetworkImage(plant.plantUrl!),
                                ),
                              )
                            : Center(
                                child: Text(
                                  "Image not found",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(color: TColors.light),
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    plant.predictionResult!.isEmpty
                        ? const CircularProgressIndicator(
                            color: Colors.green,
                          )
                        : Text(
                            "Disease : ${plant.predictionResult!.capitalize}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: Colors.green),
                          ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Text(
                      "Disease Info",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: TColors.darkGrey),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    plant.info!.isEmpty
                        ? const CircularProgressIndicator(
                            color: TColors.darkGrey,
                          )
                        : Text(
                            plant.info!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: TColors.darkGrey),
                          ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     child: const Text("Potential Solution"),
                    //   ),
                    // ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () =>
                            Get.offAll(() => const NavigationMenu()),
                        child: const Text("Continue"),
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
            stream: getStream(),
          ),
        ),
      ),
    );
  }
}
