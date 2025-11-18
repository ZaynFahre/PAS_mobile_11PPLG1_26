import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_26/controller/auth_controller.dart';
import 'package:pas_mobile_11pplg1_26/routes/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    final userC = TextEditingController();
    final passC = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: userC, decoration: const InputDecoration(labelText: 'Username')),
            const SizedBox(height: 8),
            TextField(controller: passC, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 16),
            Obx(() => ElevatedButton(
              onPressed: auth.isLoading.value ? null : () => auth.login(userC.text.trim(), passC.text.trim()),
              child: auth.isLoading.value ? const CircularProgressIndicator(color: Colors.white) : const Text('Login'),
            )),
            TextButton(onPressed: () => Get.toNamed(AppRoutes.REGISTER), child: const Text('Belum punya akun? Register')),
          ],
        ),
      ),
    );
  }
}
