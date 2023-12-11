import 'package:flutter/material.dart';
import 'package:itfsd/app/core/common/input/common_form_field_widget.dart';
import 'package:itfsd/app/core/common/input/form_field_widget.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';

import '../../presentation/controllers/agricultural_products/agricultural_products_constant.dart';

class CustomGestureDetector<T> extends StatelessWidget {
  const CustomGestureDetector({super.key, 
    required this.context,
    required this.setValueFunc,
    required this.isEnabled,
    required this.controllerEditting,
    this.idName,
    required this.icon,
    required this.itemCount,
    required this.items,
    required this.displayFunction,
    required this.onPressed,
  });

  final BuildContext context;
  final Function setValueFunc;
  final bool isEnabled;
  final TextEditingController controllerEditting;
  final String? idName;
  final Widget icon;
  final int itemCount;
  final Function(T) onPressed;
  final List<T> items;
  final String Function(T item) displayFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (idName != null) {
          return;
        } else {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            builder: (context) {
              return SizedBox(
                height: UtilsReponsive.height(context, 300),
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: UtilsReponsive.height(context, 10),
                    ),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Column(
                          children: [
                            ListTile(
                              trailing: icon,
                              onTap: () {
                                onPressed(items[index]); // Sửa đoạn này để gọi hàm onPressed
                                // Get.back();
                              },
                              title: Text(displayFunction(items[index])),
                            ),
                          ],
                        ),
                        separatorBuilder: (context, index) => const Divider(
                          thickness: 1.0,
                        ),
                        itemCount: itemCount,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
      child: CommonFormFieldWidget(
        isEnabled: isEnabled,
        suffixIcon: const Icon(Icons.arrow_drop_down),
        controllerEditting: controllerEditting,
        setValueFunc: setValueFunc,
      ),
    );
  }
}
