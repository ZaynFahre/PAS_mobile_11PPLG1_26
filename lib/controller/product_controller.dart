import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_26/helper/db_helper.dart';
import 'package:pas_mobile_11pplg1_26/services/api_services.dart';
import '../models/product.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var loading = false.obs;
  var bookmarks = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    loadBookmarks();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      loading.value = true;
      final res = await ApiService.fetchProducts();
      products.value = res.map((e) => Product.fromJson(e)).toList();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      loading.value = false;
    }
  }

  Future<void> toggleBookmark(Product p) async {
    final exists = await DbHelper.isBookmarked(p.id);
    if (exists) {
      await DbHelper.removeBookmark(p.id);
      bookmarks.removeWhere((e) => e.id == p.id);
      Get.snackbar('Dihapus', '${p.title} dihapus dari favorit');
    } else {
      await DbHelper.insertBookmark(p.toMap());
      bookmarks.add(p);
      Get.snackbar('Tersimpan', '${p.title} disimpan ke favorit');
    }
  }

  Future<void> loadBookmarks() async {
    final list = await DbHelper.getBookmarks();
    bookmarks.value = list.map((m) => Product(
      id: m['id'] as int,
      title: m['title'] as String,
      price: (m['price'] as num).toDouble(),
      description: m['description'] as String,
      category: m['category'] as String,
      image: m['image'] as String,
    )).toList();
  }

  Future<void> removeBookmark(int id) async {
    await DbHelper.removeBookmark(id);
    bookmarks.removeWhere((e) => e.id == id);
  }
}

