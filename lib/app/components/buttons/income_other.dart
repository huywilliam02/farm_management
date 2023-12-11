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

class IncomeTabView extends StatefulWidget {
  const IncomeTabView({super.key});

  @override
  _IncomeTabViewState createState() => _IncomeTabViewState();
}

class _IncomeTabViewState extends State<IncomeTabView>
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
          "    Chi tiêu & Khác",
          style: GoogleFonts.roboto(
            textStyle: TextStyleConstant.black16Roboto,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
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
                  Get.to(() => FundNumberView());
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
        Text(
          "    Bài viết nổi bật",
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
