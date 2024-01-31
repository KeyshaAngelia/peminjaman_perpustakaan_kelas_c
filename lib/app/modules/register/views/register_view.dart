import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjaman_perpustakan_kelas_c/app/data/MODEL/response_pinjam.dart';
import 'package:peminjaman_perpustakan_kelas_c/app/modules/register/controllers/register_controller.dart';
import 'package:peminjaman_perpustakan_kelas_c/app/modules/register/bindings/register_binding.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RegisterView'),
          centerTitle: true,
        ),
        body: controller.obx((state) => ListView.separated(
          itemCount:  state!.length,
          itemBuilder: (context, index){
            DataPinjam dataPinjam= state [index];
            return ListTile(
              title: Text("Buku ${dataPinjam.book?.judul}"),
              subtitle: Text("Tanggal Pinjam: ${dataPinjam.tanggalPinjam}\ntanggal kembali: ${dataPinjam.tanggalKembali}") ,
            );
          },
          separatorBuilder: (context, index)=> Divider(),
        ))
    );
  }
}