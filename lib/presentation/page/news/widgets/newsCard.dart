import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String publishedAt;
  final String author;
  final String imageUrl;
  const NewsCard(
      {required this.title,
      required this.author,
      required this.description,
      required this.imageUrl,
      required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white54),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(imageUrl)))),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 5),
            child: Column(
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person_rounded,
                      color: Colors.black26,
                    ),
                    Text(author),
                    Spacer(),
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.black26,
                    ),
                    Text(
                      publishedAt,
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
