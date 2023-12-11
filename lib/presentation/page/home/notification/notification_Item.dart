import 'package:intl/intl.dart';

class AgriculturalNotification {
  final int id;
  final String title;
  final String content;
  final DateTime timestamp;
  final String imageUrl;

  AgriculturalNotification({
    required this.id,
    required this.title,
    required this.content,
    required this.timestamp,
    required this.imageUrl,
  });
}