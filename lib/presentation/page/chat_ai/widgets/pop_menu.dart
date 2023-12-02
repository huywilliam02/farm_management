import 'package:flutter/material.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:provider/provider.dart';
import 'conversation_provider.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: ColorConstant.background_color,
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          value: "rename",
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text("Đổi tên"),
          ),
        ),
        const PopupMenuItem(
          value: "refresh",
          child: ListTile(
            leading: Icon(Icons.refresh),
            title: Text('Làm mới'),
          ),
        ),
        const PopupMenuItem(
          value: "delete",
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Xoá'),
          ),
        ),
      ],
      elevation: 2,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onSelected: (value) {
        if (value == "rename") {
          // rename
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newName = '';
              return AlertDialog(
                title: const Text('Chủ đề'),
                content: TextField(
                  // display the current name of the conversation
                  decoration: InputDecoration(
                    hintText: Provider.of<ConversationProvider>(context,
                            listen: false)
                        .currentConversation
                        .title,
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
                      'Đổi tên',
                      style: TextStyle(
                        color: Color(0xff55bb8e),
                      ),
                    ),
                    onPressed: () {
                      // Call renameConversation method here with the new name
                      Provider.of<ConversationProvider>(context, listen: false)
                          .renameConversation(newName);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );

          // Provider.of<ConversationProvider>(context, listen: false)
          //     .renameCurrentConversation();
        } else if (value == "delete") {
          // delete
          Provider.of<ConversationProvider>(context, listen: false)
              .removeCurrentConversation();
        } else if (value == "refresh") {
          // refresh
          Provider.of<ConversationProvider>(context, listen: false)
              .clearCurrentConversation();
        }
      },
    );
  }
}
