import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itfsd/presentation/controllers/ingredients/ingredients_controller.dart';

class IngredientsDetailsView extends StatelessWidget {
  final String id; // Truyền vào ID của nguyên liệu cần hiển thị chi tiết

  const IngredientsDetailsView({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IngredientsController controller = Get.find<IngredientsController>();

    // Gọi hàm để lấy chi tiết nguyên liệu từ ID
    // controller.getIngredientDetails(id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết nguyên liệu'),
      ),
      body: Obx(
            () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            // Hiển thị thông tin chi tiết nguyên liệu
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tên nguyên liệu: ${controller.currentIngredient.value.name}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // const SizedBox(height: 8.0),
                  // Text('Số lượng: ${controller.currentIngredient.quantity}'),
                  // const SizedBox(height: 8.0),
                  // Text('Trọng lượng: ${controller.currentIngredient.weight}'),
                  // const SizedBox(height: 8.0),
                  // Text('Giá: ${controller.currentIngredient.money} đ'),
                  // const SizedBox(height: 8.0),
                  // Text('Thông tin: ${controller.currentIngredient.information}'),
                  // const SizedBox(height: 8.0),
                  // Text('Thời gian: ${controller.currentIngredient.time}'),
                  // const SizedBox(height: 8.0),
                  // Text('Trạng thái: ${controller.currentIngredient.status}'),
                  // const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý sự kiện khi nhấn nút
                    },
                    child: const Text('Chỉnh sửa'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
