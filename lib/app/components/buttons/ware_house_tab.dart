import 'package:google_fonts/google_fonts.dart';
import 'package:itfsd/app/core/common/menu/common_card_button.dart';
import 'package:itfsd/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/components/buttons/list_button_statistics.dart';
import 'package:itfsd/app/components/buttons/list_icon_phone_number.dart';
import 'package:itfsd/app/components/buttons/list_icon_view_pet.dart';
import 'package:itfsd/app/components/buttons/list_icon_view_tree.dart';
import 'package:itfsd/app/components/buttons/list_icon_ware_house.dart';
import 'package:itfsd/app/components/buttons/list_icon_wage.dart';
import 'package:itfsd/app/components/buttons/tab_crop_view.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/presentation/page/fundnumber/investment.dart';

import 'package:itfsd/presentation/page/planttracking/planttracking_view.dart';
import 'package:itfsd/presentation/page/sign_up/sign_up_view.dart';

class WareHouseTabView extends StatefulWidget {
  const WareHouseTabView({super.key});

  @override
  _WareHouseTabViewState createState() => _WareHouseTabViewState();
}

class _WareHouseTabViewState extends State<WareHouseTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "    Kho",
          style: GoogleFonts.roboto(
            textStyle: TextStyleConstant.black16Roboto,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.white,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            children: [
              CommonCardButton(
                title: "Tồn kho",
                iconButton: "assets/icons/storage.png",
                onPressed: () {
                  Get.to(() => const ListIconwarehouseView());
                },
              ),
              CommonCardButton(
                title: "Bán hàng",
                iconButton: "assets/icons/shoppingcart.png",
                onPressed: () {
                  Get.toNamed(Routes.SHOPPINGS);
                },
              ),
              CommonCardButton(
                title: "Phiếu yêu cầu",
                iconButton: "assets/icons/form.png",
                onPressed: () {
                  Get.toNamed(Routes.REQUESTFORM);
                },
              ),
              CommonCardButton(
                title: "Đầu tư",
                iconButton: "assets/icons/requestform.png",
                onPressed: () {
                  Get.to(() => InvestmentPage());
                },
              ),
              CommonCardButton(
                title: "Sổ tay",
                iconButton: "assets/icons/book.png",
                onPressed: () {
                  Get.to(() => const ListIconPhoneNumber());
                },
              ),
              CommonCardButton(
                title: "Nhà cung cấp",
                iconButton: "assets/icons/handshake.png",
                onPressed: () {
                  Get.toNamed(Routes.SUPPLIER);
                },
              ),
              CommonCardButton(
                title: "Vật tư",
                iconButton: "assets/icons/supplies.png",
                onPressed: () {
                  Get.toNamed(Routes.MATERIAL);
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "    Vật tư & sản phẩm",
          style: GoogleFonts.roboto(
            textStyle: TextStyleConstant.black16Roboto,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
        ),

      ],
    );
  }
}
