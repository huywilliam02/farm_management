import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:itfsd/data/model/crops/crop_model.dart';
import 'package:itfsd/data/model/crops/crops_detail.dart';
import 'package:itfsd/presentation/controllers/start_app/start_app_controller.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import 'package:itfsd/data/model/category/product.dart';

class CropsFarmApi {
  static Future<List<Product>> getAllDataByTypeCategory(String type) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/categories/getsByCategory?type=$type');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('getAllDataByTypeCategory: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      List<Product> listProduct = [];
      final mapData = jsonDecode(response.body).cast<Map<String, dynamic>>();
      listProduct = mapData.map<Product>((json) {
        return Product.fromJson(json);
      }).toList();
      return listProduct;
    } else {
      return Future<List<Product>>.value([]);
    }
  }

  // static Future<List<CropsDetail>> getAllCropsFarm(int indexPage) async {
  //   var url = Uri.parse(
  //       'http://116.118.49.43:8878/api/crops?order=ASC&page=$indexPage&take=10');
  //   final response = await http.get(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Accept': 'application/json; charset=UTF-8',
  //       'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
  //     },
  //   );
  //   log('getAllCropsFarm: ${response.statusCode} ${response.body}');
  //
  //   if (response.statusCode.toString() == '200') {
  //     List<CropsDetail> listCropsFarm = [];
  //     final mapData =
  //         jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
  //     listCropsFarm = mapData.map<CropsDetail>((json) {
  //       return CropsDetail.fromJson(json);
  //     }).toList();
  //
  //     return listCropsFarm;
  //   } else {
  //     return Future<List<CropsDetail>>.value([]);
  //   }
  // }
  //
  // static Future<bool> createNewCrops(
  //     CropsFarmModel model, List<String> listPath) async {
  //   var dioRequest = dio.Dio();
  //   dioRequest.options.headers = {
  //     'Authorization': 'Bearer ${Get.find<StartAppController>().accessToken}',
  //     'Content-Type': 'multipart/form-data',
  //     'Accept': 'application/json'
  //   };
  //
  //   var formData = dio.FormData.fromMap({
  //     "name": model.name,
  //     "disease": model.disease,
  //     "growth": model.growth,
  //     "use": model.use,
  //     "harvest": model.harvest,
  //     "price": model.price,
  //     "groupCrop": model.groupCrop,
  //   });
  //
  //   await Future.forEach(listPath, (String path) async {
  //     final multiPartFile = await dio.MultipartFile.fromFile(
  //       path,
  //       contentType: MediaType("image", "jpeg"),
  //     );
  //     formData.files.add(MapEntry('images', multiPartFile));
  //   });
  //   var response = await dioRequest.post(
  //     'http://116.118.49.43:8878/api/crops',
  //     data: formData,
  //   );
  //   log('createcrops- status code : ${response.statusCode}');
  //   log('createcrops - body code : ');
  //   if (response.statusCode == 201) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  static Future<bool> deleteTree(String idTree) async {
    var url = Uri.parse('url$idTree');
    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('deleteTree: ${response.statusCode} ${response.body}');

    if (response.statusCode.toString() == '200') {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<CropsDetail>> searchlistCropsFarm(
      String searchData) async {
    var url = Uri.parse(
        'http://116.118.49.43:8878/api/crops?order=ASC&page=1&take=10&search=$searchData');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'bearer ${Get.find<StartAppController>().accessToken}'
      },
    );
    log('searchAllDatacropsFarm: ${response.statusCode} ${response.body}');
    if (response.statusCode.toString() == '200') {
      List<CropsDetail> listCropsFarmDetail = [];
      final mapData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      listCropsFarmDetail = mapData.map<CropsDetail>((json) {
        return CropsDetail.fromJson(json);
      }).toList();
      return listCropsFarmDetail;
    } else {
      return Future<List<CropsDetail>>.value([]);
    }
  }
}
