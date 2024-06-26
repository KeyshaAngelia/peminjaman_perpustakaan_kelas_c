import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/model/response_book.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/app_provider.dart';

import '../../../routes/app_pages.dart';

class BookDetailController extends GetxController with StateMixin<List<DataBook>> {
  //TODO: Implement BookDetailController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  // getData() async {
  //   change(null, status: RxStatus.loading());
  //   var idBuku = Get.parameters['id'];
  //   print(idBuku);
  //   try {
  //     final response = await ApiProvider.instance().get("${Endpoint.book}/$idBuku");
  //     if (response.statusCode == 200) {
  //       final ResponseBook responseBook = ResponseBook.fromJson(response.data);
  //       if(responseBook.data!.isEmpty){
  //         change(null, status: RxStatus.empty());
  //       }else{
  //         change(responseBook.data, status: RxStatus.success());
  //       }
  //     } else {
  //       change(null, status: RxStatus.error("Gagal mengambil data"));
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         change(null, status: RxStatus.error(" dio ${e.response?.data['message']}"));
  //       }
  //     } else {
  //       change(null, status: RxStatus.error("cek"+ (e.message ?? "")));
  //     }
  //   } catch (e) {
  //     change(null, status: RxStatus.error("catch "+e.toString()));
  //   }
  // }
}
