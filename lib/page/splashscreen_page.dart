import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_26/controller/auth_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    // check login after short delay
    Future.delayed(const Duration(milliseconds: 500), () => auth.checkLogin());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.shopping_bag, size: 80, color: Colors.indigo),
            SizedBox(height: 16),
            Text('PAS - Daftar Produk', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
