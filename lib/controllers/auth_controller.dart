import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/services/auth_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider<AuthServices>((ref) {
  return AuthServices(FirebaseAuth.instance);
});

final authStateChangeProvider = StreamProvider<User?>((ref) {
  return ref.read(authProvider).authStateChange;
});
