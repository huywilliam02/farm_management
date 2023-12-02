import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/controllers/viewfull/view_full_controller.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';

class ProductTypeView extends BaseView<ViewFullController> {
  const ProductTypeView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return SizedBox(
      height: UtilsReponsive.height(context, 500),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: UtilsReponsive.height(context, 10),
          ),
          Row(
            children: [
              SizedBox(
                width: UtilsReponsive.width(context, 20),
              ),
              const Text(
                "Loại sản phẩm",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: UtilsReponsive.height(context, 10),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: UtilsReponsive.width(context, 20),
                          ),
                          Container(
                            height: 20,
                            width: 50,
                            color: controller.parseRGBStringToColor(controller
                                .listProduct[index].childColumn!.color!),
                          ),
                          SizedBox(
                            width: UtilsReponsive.width(context, 20),
                          ),
                          Text(
                            controller.listProduct[index].name!,
                            style: GoogleFonts.roboto(
                              // textStyle: Theme.of(context).textTheme.displayLarge,
                              textStyle: TextStyleConstant.blackBold16,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),

                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: controller.listProduct.value.length),
          ),
          SizedBox(
            height: UtilsReponsive.height(context, 20),
          ),
        ],
      ),
    );
  }
}
