import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_26/controller/auth_controller.dart';
import 'package:pas_mobile_11pplg1_26/controller/product_controller.dart';
import 'package:pas_mobile_11pplg1_26/page/product_card_page.dart';
import 'package:pas_mobile_11pplg1_26/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pc = Get.put(ProductController());
    final auth = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
        actions: [
          IconButton(onPressed: () => Get.toNamed(AppRoutes.FAVORITES), icon: const Icon(Icons.favorite)),
          IconButton(onPressed: () => Get.toNamed(AppRoutes.PROFILE), icon: const Icon(Icons.person)),
        ],
      ),
      body: Obx(() {
        if (pc.loading.value) return const Center(child: CircularProgressIndicator());
        return RefreshIndicator(
          onRefresh: pc.fetchProducts,
          child: GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.62,
            ),
            itemCount: pc.products.length,
            itemBuilder: (context, idx) {
              final p = pc.products[idx];
              return ProductCard(product: p, onBookmark: () => pc.toggleBookmark(p));
            },
          ),
        );
      }),
    );
  }
}
