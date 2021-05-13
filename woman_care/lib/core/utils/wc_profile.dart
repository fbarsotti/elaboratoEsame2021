import 'package:firebase_auth/firebase_auth.dart';

class Profile {
  static User get user => FirebaseAuth.instance.currentUser;
}
