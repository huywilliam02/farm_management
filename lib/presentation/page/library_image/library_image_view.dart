import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/app/core/constants/color_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/library_image/library_image_controller.dart';

class LibraryImageView extends BaseView<LibraryImageController> {
  const LibraryImageView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: ColorConstant.primary,
        title: const Text('LibraryImageView'),
        centerTitle: true,
        actions: const [
          Icon(Icons.add)
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Center(
                child: Obx(
              () => CachedNetworkImage(
                imageUrl: "http://116.118.49.43:8878${controller.images.value[controller.indexChoose.value]}",
                errorWidget: (context, url, error) => const Icon(Icons.info),
                progressIndicatorBuilder: (context, url, progress) =>
                    const CircularProgressIndicator(),
                fit: BoxFit.contain,
              ),
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child:  ListView.separated(
                    itemCount: controller.images.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        controller.onTapImage(index);
                      },
                      child: SizedBox(
                        width: 60,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: "http://116.118.49.43:8878${controller.images.value[index]}",
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.info),
                              progressIndicatorBuilder:
                                  (context, url, progress) =>
                                      const CircularProgressIndicator(),
                              fit: BoxFit.fill,
                            ),
                      Obx(() =>      controller.indexChoose.value != index
                                ? Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    color: Colors.black.withOpacity(0.3),
                                  )
                                : const SizedBox())
                          ],
                        ),
                      ),
                    ),
                  )),
          // Expanded(
          //     child: Container(
          //       color:Colors.white,
          //       child: Row(
          //         mainAxisAlignment:MainAxisAlignment.spaceAround,
          //         children: [
          //           Icon(Icons.delete),
          //           Icon(Icons.add)
          //         ],
          //       ),
          //     ))
        ],
      )),
    );
  }
}
