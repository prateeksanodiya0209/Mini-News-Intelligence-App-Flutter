import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider.dart';
import 'login_page.dart';
import '../../news/presentation/pages/news_page.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(authProvider);

    // 🔐 Auto decide screen
    if (isLoggedIn) {
      return NewsPage();
    } else {
      return LoginPage();
    }
  }
}