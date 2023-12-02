import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/constants/data_constant.dart';
import 'package:itfsd/app/util/icon_utils.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/presentation/page/chat_ai/widgets/chat_ai_view.dart';
import 'package:itfsd/presentation/page/chat_ai/widgets/conversation_provider.dart';
import 'package:itfsd/presentation/page/chat_ai/widgets/drawer.dart';
import 'package:itfsd/presentation/page/chat_ai/widgets/pop_menu.dart';
import 'package:provider/provider.dart';

import '../../controllers/chat_ai/chat_ai_controller.dart';

class ChatAiView extends BaseView<ChatAiController> {
  const ChatAiView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return CommonScaffold(
      appBar: AppBar(
        title: Text(
          Provider.of<ConversationProvider>(context, listen: true)
              .currentConversationTitle,
          style: const TextStyle(
            fontSize: 20.0, // change font size
            color: Colors.black, // change font color
            fontFamily: 'din-regular', // change font family
          ),
        ),
        leading: IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios_new)),
        backgroundColor: Colors.grey[100],
        elevation: 0, // remove box shadow
        toolbarHeight: 50,
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          CustomPopupMenu(),
        ],
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: ChatPage(),
      ),
    );
  }
}
