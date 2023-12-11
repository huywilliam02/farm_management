import 'package:flutter/material.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';

import '../../presentation/controllers/agricultural_products/agricultural_products_constant.dart';
import '../../presentation/page/crops_farm/crop.dart';

class MarkdownBody extends StatelessWidget {
  final String data;

  MarkdownBody({required this.data});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    List<String> lines = data.split('\n');
    for (String line in lines) {
      if (line.startsWith('**')) {
        widgets.add(
          Text(
            line.substring(2),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      } else if (line.startsWith('-')) {
        widgets.add(
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              line.substring(2),
            ),
          ),
        );
      } else {
        widgets.add(
          Text(line),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}

class TermsAndPrivacyPage extends StatelessWidget {
  final String termsAndConditions = '''
    **Chính sách và Điều kiện**

    Chào mừng bạn đến với ứng dụng của chúng tôi! Bằng cách sử dụng ứng dụng này, bạn đồng ý với các điều khoản và điều kiện sau đây:

    1. **Mục Đích Sử Dụng:**
        - Bạn cam kết sử dụng ứng dụng này theo đúng mục đích được thiết lập.
        - Bạn không được thực hiện bất kỳ hành động nào vi phạm pháp luật khi sử dụng ứng dụng.

    2. **Bảo vệ Thông Tin:**
        - Chúng tôi cam kết bảo vệ thông tin cá nhân của bạn.
        - Mọi thông tin cá nhân sẽ được lưu trữ an toàn và được bảo vệ theo các biện pháp an ninh thích hợp.

    **Bảo mật Thông tin**

    Chúng tôi cam kết bảo vệ thông tin cá nhân của bạn. Dưới đây là một số điều về Bảo mật Thông tin:

    1. **Chia Sẻ Thông Tin:**
        - Chúng tôi sẽ không chia sẻ thông tin cá nhân của bạn với bất kỳ bên thứ ba nào.
        - Thông tin cá nhân chỉ được sử dụng cho mục đích nội bộ của chúng tôi.

    2. **Bảo Mật Hệ Thống:**
        - Hệ thống của chúng tôi được bảo vệ chặt chẽ để đảm bảo an toàn thông tin cá nhân.

    Cảm ơn bạn đã sử dụng ứng dụng của chúng tôi!
  ''';

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundColor: ColorConstant.background_color,
      appBar: CommonAppBar(
        title: "Trung tâm hỗ trợ",
        titleType: AppBarTitle.text,
        centerTitle: true,
        titleTextStyle: AppTextStyle.textTitleAppBar,
        leadingIcon: IconsUtils.back,
        onLeadingPressed: () {
          Get.back();
        },
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chính sách và Điều kiện',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                MarkdownBody(data: termsAndConditions),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _showAcceptanceConfirmation(context);
                  },
                  child: Text('Chấp nhận'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showAcceptanceConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Xác nhận chấp nhận'),
          content: Text(
              'Cảm ơn bạn đã chấp nhận Chính sách và Điều kiện cũng như Bảo mật Thông tin của chúng tôi.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Đóng'),
            ),
          ],
        );
      },
    );
  }
}
