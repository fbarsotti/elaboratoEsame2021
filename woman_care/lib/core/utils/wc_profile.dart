import 'package:firebase_auth/firebase_auth.dart';

mixin Profile {
  static User get user => FirebaseAuth.instance.currentUser;
}
