import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_26/controller/product_controller.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pc = Get.find<ProductController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite')),
      body: Obx(() {
        if (pc.bookmarks.isEmpty) return const Center(child: Text('Belum ada favorit'));
        return ListView.builder(
          itemCount: pc.bookmarks.length,
          itemBuilder: (context, idx) {
            final p = pc.bookmarks[idx];
            return ListTile(
              leading: Image.network(p.image, width: 56, height: 56),
              title: Text(p.title, maxLines: 1, overflow: TextOverflow.ellipsis),
              subtitle: Text('Rp ${p.price}'),
              trailing: IconButton(onPressed: () => pc.removeBookmark(p.id), icon: const Icon(Icons.delete)),
            );
          },
        );
      }),
    );
  }
}
