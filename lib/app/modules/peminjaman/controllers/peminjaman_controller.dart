import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_pinjam.dart';
import '../../../data/provider/app_provider.dart';
import '../../../data/provider/storage_provider.dart';

class PeminjamanController extends GetxController with StateMixin<List<DataPinjam>>{
  //TODO: Implement PeminjamanController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getPinjam();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getPinjam() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.pinjam+"/${StorageProvider.read(StorageKey.iduser)}" );
      if (response.statusCode == 200) {
        final ResponsePinjam responseBook = ResponsePinjam.fromJson(response.data);
        if (responseBook.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseBook.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        } else {
        change(null, status: RxStatus.error("Sorry ${e.response?.statusMessage}"));
        }
      } else {
        change(null, status: RxStatus.error("Sorry ${e.message}"));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}