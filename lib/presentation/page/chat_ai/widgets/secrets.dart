import 'package:flutter/material.dart';
import 'package:itfsd/presentation/controllers/agricultural_products/agricultural_products_constant.dart';
import 'package:provider/provider.dart';
import 'conversation_provider.dart';

void showProxyDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String newProxy = 'proxy của bạn';
      return AlertDialog(
        backgroundColor: ColorConstant.background_color,
        title: const Text('Cài đặt proxy'),
        content: TextField(
          // display the current name of the conversation
          decoration: InputDecoration(
            hintText: Provider.of<ConversationProvider>(context).yourProxy,
          ),
          onChanged: (value) {
            newProxy = value;
          },
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Thoát'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text(
              'Lưu',
              style: TextStyle(
                color: Color(0xff55bb8e),
              ),
            ),
            onPressed: () {
              if (newProxy == '') {
                Navigator.pop(context);
                return;
              }
              Provider.of<ConversationProvider>(context, listen: false)
                  .yourProxy = newProxy;
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

void showRenameDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String newName = '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';
      return AlertDialog(
        title: const Text('Cài đặt API'),
        content: TextField(
          // display the current name of the conversation
          decoration: InputDecoration(
            hintText: Provider.of<ConversationProvider>(context).yourApiKey,
          ),
          onChanged: (value) {
            newName = value;
          },
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Thoát'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text(
              'Lưu',
              style: TextStyle(
                color: Color(0xff55bb8e),
              ),
            ),
            onPressed: () {
              if (newName == '') {
                Navigator.pop(context);
                return;
              }
              Provider.of<ConversationProvider>(context, listen: false)
                  .yourApiKey = newName;
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
