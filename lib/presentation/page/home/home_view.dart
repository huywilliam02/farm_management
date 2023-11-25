import 'package:itfsd/app/core/common/common_app_bar.dart';
import 'package:itfsd/app/core/common/common_scaffold.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/components/buttons/button_tab_view.dart';
import 'package:itfsd/app/util/reponsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Stack(
          children: [
            CommonAppBar(
              title: "Biên Hòa",

              titleType: AppBarTitle.text,
              centerTitle: true,
              titleTextStyle: AppTextStyle.textTitleAppBar,
              backgroundColor: Colors.green,
              leadingIcon: const CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=2000",
                ),
              ),
              onLeadingPressed: () {},
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Image(
                    image: AssetImage("assets/icons/messenger.png"),
                    color: Colors.white,
                    height: 24,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Image(
                    image: AssetImage("assets/icons/notification.png"),
                    color: Colors.white,
                    height: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: UtilsReponsive.height(context, 10),
            ),
            const ButtonTabView(),
          ],
        ),
      ),
    );
  }
}
