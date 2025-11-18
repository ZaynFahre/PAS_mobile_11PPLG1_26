import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_26/controller/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    final userC = TextEditingController();
    final passC = TextEditingController();
    final nameC = TextEditingController();
    final emailC = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(controller: userC, decoration: const InputDecoration(labelText: 'Username')),
            const SizedBox(height: 8),
            TextField(controller: passC, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 8),
            TextField(controller: nameC, decoration: const InputDecoration(labelText: 'Full Name')),
            const SizedBox(height: 8),
            TextField(controller: emailC, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 16),
            Obx(() => ElevatedButton(
              onPressed: auth.isLoading.value ? null : () => auth.register(userC.text.trim(), passC.text.trim(), nameC.text.trim(), emailC.text.trim()),
              child: auth.isLoading.value ? const CircularProgressIndicator(color: Colors.white) : const Text('Register'),
            )),
          ],
        ),
      ),
    );
  }
}


