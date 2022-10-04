import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PrepifyFirebaseUser {
  PrepifyFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

PrepifyFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PrepifyFirebaseUser> prepifyFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<PrepifyFirebaseUser>(
        (user) => currentUser = PrepifyFirebaseUser(user));
