import 'package:flutter/material.dart';

import 'package:itfsd/base/base_view.dart';

import '../../../controllers/warehouse/warehouse_controller.dart';

class WarehouseView extends BaseView<WarehouseController> {
  const WarehouseView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WarehouseView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WarehouseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
