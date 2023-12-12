import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:itfsd/app/core/common/menu/common_app_bar.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';
import 'package:itfsd/app/resources/theme/app_text_style.dart';
import 'package:itfsd/presentation/page/login/login.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class LandArea {
  String name;
  String description;
  int acreage;
  List<String> images;
  List<Location> locations;
  String code;
  String type;
  String representative;
  String phoneNumber;
  String email;
  String region;
  String address;
  double production;
  String businessType;

  LandArea({
    required this.name,
    required this.description,
    required this.acreage,
    required this.images,
    required this.locations,
    required this.code,
    required this.type,
    required this.representative,
    required this.phoneNumber,
    required this.email,
    required this.region,
    required this.address,
    required this.production,
    required this.businessType,
  });
}

class Location {
  double latitude;
  double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });
}

class LandAreaDetailScreen extends StatefulWidget {
  final LandArea landArea;

  LandAreaDetailScreen({required this.landArea});

  @override
  State<LandAreaDetailScreen> createState() => _LandAreaDetailScreenState();
}

class _LandAreaDetailScreenState extends State<LandAreaDetailScreen> {
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_pageController.page == widget.landArea.images.length - 1) {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return CommonScaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.4),
                  child: const Icon(Icons.chevron_left, color: Colors.white),
                ),
              ),
            ),
            expandedHeight: 300,
            flexibleSpace: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: widget.landArea.images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.landArea.images[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tên: ${widget.landArea.name}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Mã: ${widget.landArea.code}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Loại hình: ${widget.landArea.type}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Người đại diện: ${widget.landArea.representative}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Số điện thoại: ${widget.landArea.phoneNumber}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Email: ${widget.landArea.email}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Khu vực: ${widget.landArea.region}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Địa chỉ: ${widget.landArea.address}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Diện tích: ${widget.landArea.acreage} ha',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Sản lượng: ${widget.landArea.production}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Thuộc DN/Tc: ${widget.landArea.businessType}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Mô tả: ${widget.landArea.description}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    softWrap: true,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Vị trí:',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Container(
                    height: 200,
                    child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(
                          widget.landArea.locations.first.latitude,
                          widget.landArea.locations.first.longitude,
                        ),
                        zoom: 14.0,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName:
                              'dev.fleaflet.flutter_map.example',
                        ),
                        MarkerLayer(markers: [
                          Marker(
                            point: LatLng(
                              widget.landArea.locations.first.latitude,
                              widget.landArea.locations.first.longitude,
                            ),
                            builder: (context) => GestureDetector(
                              onTap: () {
                                openMap(
                                  widget.landArea.locations.first.latitude,
                                  widget.landArea.locations.first.longitude,
                                );
                              },
                              child: Container(
                                child: Icon(
                                  Icons.location_on,
                                  size: 40.0,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          )
                        ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Hàm để mở ứng dụng chỉ đường
  Future<void> openMap(double latitude, double longitude, {LaunchMode linkLaunchMode = LaunchMode.externalApplication}) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl), mode: linkLaunchMode);
    } else {
      throw 'Could not open the map.';
    }
  }
}
