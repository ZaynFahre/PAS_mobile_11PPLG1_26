import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_26/controller/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(radius: 48, child: Text(auth.username.value.isEmpty ? 'U' : auth.username.value[0].toUpperCase(), style: const TextStyle(fontSize: 32))),
            const SizedBox(height: 12),
            Text(auth.username.value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(auth.email.value),
            const SizedBox(height: 20),
            ElevatedButton.icon(onPressed: () => auth.logout(), icon: const Icon(Icons.logout), label: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}

