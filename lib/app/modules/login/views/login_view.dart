import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('LoginView'),
      //   centerTitle: true,
      // ),
      body: Container(
        color: Color(0xff1B255A),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/splash-polca.png', // Ganti dengan path menuju gambar logo
                    width: 300, // Sesuaikan dengan ukuran yang diinginkan
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
                child: Form(
                    key: controller.formkey,
                    child: Column(
                      children: [
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
                          validator: (value) {
                            if (value!.length < 2) {
                              return "Username Tidak Boleh Kosong ";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
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
                          validator: (value) {
                            if (value!.length < 2) {
                              return "Password Tidak Boleh Kosong ";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 70,),
                        Obx(() => controller.loading.value
                            ?CircularProgressIndicator()
                            : ElevatedButton(
                            onPressed: () {
                              controller.login();
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
                              Text("don't have an account?",style: TextStyle(color: Colors.white)),
                              SizedBox(width: 10,),
                              GestureDetector(child: Text("Sign Up", style: TextStyle(
                                  color: Color(0xff8FBEEA),
                                fontWeight: FontWeight.bold,
                              )
                              ), onTap: () {
                                Get.offAllNamed(Routes.REGISTER);
                              },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                )
            ),
          ],
        ),
      ),

    );
  }
}
