import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/app/core/common/page_view/loading_view/common_loading_page_progress_indicator.dart';
import 'package:itfsd/base/base_view.dart';
import 'package:itfsd/data/model/news/news_model.dart';
import 'package:itfsd/presentation/controllers/news/news_controller.dart';
import 'package:itfsd/presentation/page/news/home_page.dart';
import 'package:itfsd/presentation/page/news/widgets/newsCard.dart';

class NewsView extends BaseView<NewsController> {
  const NewsView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 243, 252),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   "assets/newsNightLogo.png",
            //   height: 100,
            //   width: 100,
            // ),
            Text("Bảng tin")
          ],
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CommonLoadingPageProgressIndicator(),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 2,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: controller.newsArticles.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        title: controller.newsArticles[index].title!,
                        description:
                            controller.newsArticles[index].description!,
                        imageUrl:
                            controller.newsArticles[index].urlToImage ?? "",
                        author: controller.newsArticles[index].author ?? "",
                        publishedAt: controller.newsArticles[index].publishedAt
                            .toString(),
                        content: controller.newsArticles[index].content!,
                      ),
                    ),
                  ),
                  child: NewsCard(
                    title: controller.newsArticles[index].title!,
                    description: controller.newsArticles[index].description!,
                    imageUrl: controller.newsArticles[index].urlToImage ?? "",
                    author: controller.newsArticles[index].author ?? "",
                    publishedAt:
                        controller.newsArticles[index].publishedAt.toString(),
                  ),
                ),
              ),
      ),
    );
  }
}
