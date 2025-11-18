import 'dart:convert';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_26/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var token = ''.obs;
  var username = ''.obs;
  var email = ''.obs;

  Future<void> register(String username, String password, String fullName, String emailAddr) async {
    isLoading.value = true;
    final res = await ApiService.register({
      'username': username,
      'password': password,
      'full_name': fullName,
      'email': emailAddr,
    });
    isLoading.value = false;
    if (res.statusCode == 200 || res.statusCode == 201) {
      Get.snackbar('Sukses', 'Register berhasil. Silakan login.');
      Get.offNamed('/login');
    } else {
      Get.snackbar('Gagal', res.body);
    }
  }

  Future<void> login(String usernameInput, String password) async {
    isLoading.value = true;
    final res = await ApiService.login({
      'username': usernameInput,
      'password': password,
    });
    isLoading.value = false;
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      // assuming API returns a token field, otherwise store whole response
      final savedToken = data['token'] ?? data['data'] ?? res.body;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', savedToken.toString());
      await prefs.setString('username', usernameInput);
      await prefs.setString('email', data['email'] ?? 'user@example.com');
      token.value = savedToken.toString();
      username.value = usernameInput;
      email.value = prefs.getString('email') ?? '';
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Gagal', res.body);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('username');
    await prefs.remove('email');
    token.value = '';
    username.value = '';
    email.value = '';
    Get.offAllNamed('/login');
  }

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final t = prefs.getString('token');
    if (t != null && t.isNotEmpty) {
      token.value = t;
      username.value = prefs.getString('username') ?? '';
      email.value = prefs.getString('email') ?? '';
      Get.offAllNamed('/home');
    } else {
      Get.offAllNamed('/login');
    }
  }
}

