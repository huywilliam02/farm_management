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
import 'package:itfsd/presentation/page/bill_farm/bill_farm_view.dart';
import 'package:itfsd/presentation/page/chat_ai/chat_ai_view.dart';
import 'package:itfsd/presentation/page/chat_ai/widgets/chat_ai_view.dart';
import 'package:itfsd/presentation/page/farm/more_farm.dart';
import 'package:itfsd/presentation/page/fundnumber/fundnumber_view.dart';
import 'package:itfsd/presentation/page/planttracking/planttracking_view.dart';
import 'package:itfsd/presentation/page/sign_up/sign_up_view.dart';

class ButtonTabView extends StatefulWidget {
  const ButtonTabView({super.key});

  @override
  _ButtonTabViewState createState() => _ButtonTabViewState();
}

class _ButtonTabViewState extends State<ButtonTabView>
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
        const SizedBox(
          height: 10,
        ),
        Text(
          "    Nông trại",
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
          color: ColorConstant.background_color,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            children: [
              CommonCardButton(
                title: "Trang trại",
                iconButton: "assets/icons/barn.png",
                onPressed: () {
                  Get.toNamed(Routes.FARM);
                },
              ),
              CommonCardButton(
                title: "Khu canh tác",
                iconButton: "assets/icons/area.png",
                onPressed: () {
                  Get.toNamed(Routes.VIEW_MORE_LAND);
                },
              ),
              CommonCardButton(
                title: "Vùng canh tác",
                iconButton: "assets/icons/land.png",
                onPressed: () {
                  Get.toNamed(Routes.VIEW_LANDFULL);
                },
              ),
              CommonCardButton(
                title: "Theo dõi vườn",
                iconButton: "assets/icons/iot.png",
                onPressed: () {
                  Get.to(() => const PlanttrackingView());
                },
              ),
              CommonCardButton(
                title: "Lịch canh tác",
                iconButton: "assets/icons/years.png",
                onPressed: () {
                  Get.toNamed(Routes.FARMING_CALENDAR);
                },
              ),
              CommonCardButton(
                title: "Nông sản",
                iconButton: "assets/icons/tree.png",
                onPressed: () {
                  Get.to(() => const ListIconTreeView());
                },
              ),
              CommonCardButton(
                title: "Vật nuôi",
                iconButton: "assets/icons/pet.png",
                onPressed: () {
                  Get.to(() => const ListIconPetView());
                },
              ),
              CommonCardButton(
                title: "Mùa vụ",
                iconButton: "assets/icons/season.png",
                onPressed: () {
                  Get.to(() => const TabCropView());
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
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
                  // Get.to(() => MoreFarm());
                  Get.toNamed(Routes.NEWS);
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
          height: 20,
        ),
        Text(
          "    Chi tiêu & Khác",
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
                title: "Bảng lương",
                iconButton: "assets/icons/formtax.png",
                onPressed: () {
                  Get.to(() => const ListIconwageView());
                },
              ),
              CommonCardButton(
                title: "Sổ quỹ",
                iconButton: "assets/icons/school.png",
                onPressed: () {
                  Get.to(() => const FundnumberView());
                },
              ),
              CommonCardButton(
                title: "Hóa đơn",
                iconButton: "assets/icons/bill.png",
                onPressed: () {
                  Get.to(() => const BillFarmView());
                },
              ),
              CommonCardButton(
                title: "Thống kê",
                iconButton: "assets/icons/description.png",
                onPressed: () {
                  Get.to(() => const ListIconStatistics());
                },
              ),
              CommonCardButton(
                title: "Tư vấn",
                iconButton: "assets/icons/socialmedia.png",
                onPressed: () {
                  Get.to(() => const ChatAiView());
                },
              ),
              CommonCardButton(
                title: "Tài liệu",
                iconButton: "assets/icons/folder.png",
                onPressed: () {
                  Get.toNamed(Routes.DOCUMENT);
                },
              ),
              CommonCardButton(
                title: "Liên hệ",
                iconButton: "assets/icons/contact.png",
                onPressed: () {
                  Get.toNamed(Routes.CONTACT);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
