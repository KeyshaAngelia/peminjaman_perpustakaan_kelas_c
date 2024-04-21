import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../../data/MODEL/response_pinjam.dart';
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/app_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class AddPeminjamanController extends GetxController with StateMixin<List<DataPinjam>>{
  //TODO: Implement PeminjamanController

  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController tanggal_pinjamController = TextEditingController();
  final TextEditingController tanggal_kembaliController = TextEditingController();

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
          change(
              null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  addpinjam() async {
    loading(true);
    try{
      FocusScope.of(Get.context!).unfocus();
      if(formKey.currentState!.validate()){
        final response = await ApiProvider.instance().post(Endpoint.pinjam,
            data: {
              "user_id":int.parse(StorageProvider.read(StorageKey.iduser)),
              "book_id":int.parse(Get.parameters['id'].toString()),
              "tanggal_pinjam":tanggal_pinjamController.text.toString(),
              "tanggal_kembali":tanggal_kembaliController.text.toString()
            });
        if (response.statusCode == 201) {
          Get.back();
        } else {
          Get.snackbar("Sorry", "Anda gagal meminjam buku", backgroundColor: Colors.orange);
        }
      }loading(false);
    } on DioException catch (e) {
      loading(false);
      if(e.response != null) {
        if(e.response?.data != null){
          Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {loading(false);
    Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}