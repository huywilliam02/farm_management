import 'package:flutter/material.dart';
import 'package:itfsd/presentation/page/login/login.dart';

class HarvestedCrop {
  final String name;
  final String type;
  final double quantity;
  final String unit;
  String origin;
  final String farmerName;
  final String harvestDate;
  final String location;
  final double price;
  final int qualityRating;
  final String notes;
  final bool isOrganic;
  final String certification;
  final String storageConditions;
  final List<String> imageUrls;
  final String processingDetails;

  HarvestedCrop({
    required this.name,
    required this.type,
    required this.quantity,
    required this.unit,
    this.origin = '',
    required this.farmerName,
    required this.harvestDate,
    required this.location,
    required this.price,
    required this.qualityRating,
    required this.notes,
    required this.isOrganic,
    required this.certification,
    required this.storageConditions,
    required this.imageUrls,
    required this.processingDetails,
  });
}

class HarvestedCropDetailScreen extends StatefulWidget {
  final HarvestedCrop harvestedCrop;

  HarvestedCropDetailScreen({required this.harvestedCrop});

  @override
  _HarvestedCropDetailScreenState createState() =>
      _HarvestedCropDetailScreenState();
}

class _HarvestedCropDetailScreenState extends State<HarvestedCropDetailScreen> {
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_pageController.page == widget.harvestedCrop.imageUrls.length - 1) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  itemCount: widget.harvestedCrop.imageUrls.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.harvestedCrop.imageUrls[index],
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
                    'Tên: ${widget.harvestedCrop.name}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Màu chữ
                    ),
                  ),
                  Text(
                    'Loại: ${widget.harvestedCrop.type}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Số lượng: ${widget.harvestedCrop.quantity} ${widget.harvestedCrop.unit}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Nguồn gốc: ${widget.harvestedCrop.origin}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Người nông dân: ${widget.harvestedCrop.farmerName}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Ngày thu hoạch: ${widget.harvestedCrop.harvestDate}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Địa điểm: ${widget.harvestedCrop.location}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Giá: ${widget.harvestedCrop.price} VND',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Đánh giá chất lượng: ${widget.harvestedCrop.qualityRating} sao',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Ghi chú: ${widget.harvestedCrop.notes}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Hữu cơ: ${widget.harvestedCrop.isOrganic ? 'Có' : 'Không'}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Chứng nhận: ${widget.harvestedCrop.certification}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Điều kiện bảo quản: ${widget.harvestedCrop.storageConditions}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Thông tin xử lý: ${widget.harvestedCrop.processingDetails}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HarvestedCropListView extends StatelessWidget {
  final List<HarvestedCrop> harvestedCrops;

  HarvestedCropListView({required this.harvestedCrops});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: harvestedCrops.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(harvestedCrops[index].name),
          subtitle: Text('Loại: ${harvestedCrops[index].type}'),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HarvestedCropDetailScreen(
                  harvestedCrop: harvestedCrops[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
