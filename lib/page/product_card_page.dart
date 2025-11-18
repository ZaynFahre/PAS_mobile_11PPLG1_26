import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onBookmark;
  const ProductCard({super.key, required this.product, required this.onBookmark});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(product.image, fit: BoxFit.contain),
            ),
            const SizedBox(height: 8),
            Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Rp ${product.price.toString()}', style: const TextStyle(color: Colors.green)),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.category, style: const TextStyle(fontSize: 12)),
                IconButton(onPressed: onBookmark, icon: const Icon(Icons.bookmark_add_outlined)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
