import 'package:flutter/material.dart';
import 'package:itfsd/app/core/common/menu/common_scaffold.dart';

class CompanyDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> companyData;

  CompanyDetailsScreen({required this.companyData});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: AppBar(
        title: Text('Chi tiết đơn hàng'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection('Thông tin cơ bản'),
              _buildInfoItem('Tên công ty', companyData['name']),
              _buildInfoItem('Mã công ty', companyData['k']),
              _buildInfoItem('Tổng số tiền', companyData['t']),
              _buildInfoItem('Ngày xuất hàng', companyData['y']),
              _buildInfoItem('Tình trạng xuất hàng', companyData['d']),
              _buildInfoItem('Tình trạng thanh toán', companyData['l']),
              _buildSection('Thông tin về cây trồng'),
              _buildInfoItem('Loại cây trồng', companyData['cây trồng']),
              _buildInfoItem('Số lượng', companyData['số lượng']),
              _buildInfoItem('Khu vực', companyData['khu vực']),
              _buildInfoItem('Ngày thu hoạch', companyData['ngày thu hoạch']),
              _buildInfoItem(
                  'Tình trạng cây trồng', companyData['tình trạng cây trồng']),
              _buildSection('Liên hệ công ty'),
              _buildInfoItem('Địa chỉ công ty', companyData['địa chỉ công ty']),
              _buildInfoItem('Người liên hệ', companyData['người liên hệ']),
              _buildInfoItem('Email', companyData['email']),
              _buildInfoItem('Số điện thoại', companyData['số điện thoại']),
              _buildSection('Thông tin doanh nghiệp'),
              _buildInfoItem('Loại hình doanh nghiệp',
                  companyData['loại hình doanh nghiệp']),
              _buildInfoItem('Thành lập', companyData['thành lập']),
              _buildInfoItem('Mã số thuế', companyData['mã số thuế']),
              _buildInfoItem('Website', companyData['website']),
              _buildSection('Danh sách sản phẩm'),
              _buildProductList(companyData['danh sách sản phẩm']),
              _buildSection('Đối tác kinh doanh'),
              _buildBusinessPartners(companyData['đối tác kinh doanh']),
              _buildSection('Đánh giá'),
              _buildRating(companyData['đánh giá']),
              _buildSection('Giao dịch gần đây'),
              _buildTransactionList(companyData['giao dịch gần đây']),
              _buildSection('Lịch sử mua hàng'),
              _buildPurchaseHistory(companyData['lịch sử mua hàng']),
              // _buildCompanyImage(companyData['hình ảnh công ty']),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList(List<dynamic> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: products
          .map((product) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text('- $product'),
              ))
          .toList(),
    );
  }

  Widget _buildBusinessPartners(List<dynamic> partners) {
    return Column(
      children: partners
          .map((partner) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tên đối tác: ${partner['tên']}'),
                    Text('Ngành nghề: ${partner['ngành nghề']}'),
                    // Image.network(partner['hình ảnh'], height: 100, width: 100),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _buildRating(Map<String, dynamic> ratings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoItem('Chất lượng', ratings['chất lượng'].toString()),
        _buildInfoItem('Dịch vụ', ratings['dịch vụ'].toString()),
        _buildInfoItem(
            'Thời gian giao hàng', ratings['thời gian giao hàng'].toString()),
      ],
    );
  }

  Widget _buildTransactionList(List<dynamic> transactions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: transactions
          .map((transaction) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mã giao dịch: ${transaction['mã giao dịch']}'),
                    Text('Số tiền: ${transaction['số tiền']}'),
                    Text('Ngày: ${transaction['ngày']}'),
                    Text('Sản phẩm: ${transaction['sản phẩm']}'),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _buildPurchaseHistory(List<dynamic> purchaseHistory) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: purchaseHistory
          .map((history) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mã hóa đơn: ${history['mã hóa đơn']}'),
                    Text('Số tiền: ${history['số tiền']}'),
                    Text('Ngày: ${history['ngày']}'),
                    Text('Sản phẩm: ${history['sản phẩm']}'),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCompanyImage(String imageUrl) {
    return imageUrl.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.network(imageUrl),
          )
        : SizedBox.shrink();
  }
}
