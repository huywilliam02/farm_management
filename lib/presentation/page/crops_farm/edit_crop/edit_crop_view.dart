import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/crops_farm/controllers/edit_crop_controller.dart';

class EditCropView extends GetView<EditCropController> {
  const EditCropView({Key? key,this.cropId}) : super(key: key);
  final String? cropId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditCropView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditCropView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
