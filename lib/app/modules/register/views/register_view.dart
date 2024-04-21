import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('RegisterView'),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Color(0xff1B255A),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/splash-polca.PNG', // Ganti dengan path menuju gambar logo
                        width: 250, // Sesuaikan dengan ukuran yang diinginkan
                      ),
                    ],
                  ),
                ),
                Container(
                    width: 350,
                    child:  Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: controller.namaController,
                            decoration: InputDecoration(
                              hintText: "Fullname",
                              hintStyle: TextStyle(color: Colors.grey),
                              // Warna Garis Bawah / Border
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff8FBEEA)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff8FBEEA)),
                              ),
                            ),
                            validator: (value){
                              if (value!.isEmpty) {
                                return "Nama tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: controller.usernameController,
                            decoration: InputDecoration(
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.grey),
                              // Warna Garis Bawah / Border
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff8FBEEA)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff8FBEEA)),
                              ),
                            ),
                            validator: (value){
                              if (value!.isEmpty) {
                                return "Username tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: controller.telpController,
                            decoration: InputDecoration(
                              hintText: "Phone Number",
                              hintStyle: TextStyle(color: Colors.grey),
                              // Warna Garis Bawah / Border
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff8FBEEA)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff8FBEEA)),
                              ),
                            ),
                            validator: (value){
                              if (value!.isEmpty) {
                                return "No. Telp tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: controller.alamatController,
                            decoration: InputDecoration(
                              hintText: "Address",
                              hintStyle: TextStyle(color: Colors.grey),
                              // Warna Garis Bawah / Border
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff8FBEEA)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff8FBEEA)),
                              ),
                            ),
                            validator: (value){
                              if (value!.isEmpty) {
                                return "Alamat tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey),
                              // Warna Garis Bawah / Border
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff8FBEEA)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff8FBEEA)),
                              ),
                            ),
                            validator: (value){
                              if (value!.isEmpty) {
                                return "Password tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20,),
                          Obx(() => controller.loading.value
                              ?CircularProgressIndicator()
                              : ElevatedButton(
                            onPressed: () {
                              controller.post();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero, // Menghapus border radius
                              ),
                              primary: Color(0xff8FBEEA), // Warna latar belakang tombol
                              onPrimary: Color(0xff1B255A), // Warna teks tombol
                            ),
                            child: Container(
                              width: double.infinity, // Memenuhi lebar parent (Column)
                              height: 50,
                              child: Center(
                                child: Text("Start Reading",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                              ),
                            ),

                          ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("have an account?",style: TextStyle(color: Colors.white)),
                                SizedBox(width: 10,),
                                GestureDetector(child: Text("Log In", style: TextStyle(
                                  color: Color(0xff8FBEEA),
                                  fontWeight: FontWeight.bold,
                                )
                                ), onTap: () {
                                  Get.offAllNamed(Routes.LOGIN);
                                },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),

        )
    );
  }
}