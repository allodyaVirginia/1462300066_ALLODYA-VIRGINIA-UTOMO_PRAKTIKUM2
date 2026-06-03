import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nbiController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    nbiController.dispose();
    emailController.dispose();
    alamatController.dispose();
    instagramController.dispose();
    super.dispose();
  }

  void simpanData() {
    if (namaController.text.isEmpty ||
        nbiController.text.isEmpty ||
        emailController.text.isEmpty ||
        alamatController.text.isEmpty ||
        instagramController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Semua data wajib diisi!"),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Data berhasil disimpan"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F2F2),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Gambar
            Image.asset(
              "assets/register.jpg",
              height: 140,
            ),

            const SizedBox(height: 15),

            const Text(
              "WELCOME",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              "Praktikum PAB 2026",
              style: TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 30),

            buildTextField(
              controller: namaController,
              hint: "Masukan Nama",
            ),

            const SizedBox(height: 15),

            buildTextField(
              controller: nbiController,
              hint: "Masukan NBI",
            ),

            const SizedBox(height: 15),

            buildTextField(
              controller: emailController,
              hint: "Masukan Email",
            ),

            const SizedBox(height: 15),

            buildTextField(
              controller: alamatController,
              hint: "Masukan Alamat",
            ),

            const SizedBox(height: 15),

            buildTextField(
              controller: instagramController,
              hint: "Masukan Akun Instagram",
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: simpanData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Daftar",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}