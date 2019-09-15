import 'package:evc/api/google_auth.dart';
import 'package:evc/data/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

// TODO update user to cloud firestore
// TODO sign out user
// TODO handle auth exceptions
class AuthBloc with ChangeNotifier {
  User _currentUser;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// initiatlize firebase auth to get the currently signedIn user
  Future<void> init() async {
    var firebaseUser = await _firebaseAuth.currentUser();
    if (firebaseUser == null) {
      currentUsr = null;
    }
    currentUsr = User(
        name: firebaseUser.displayName,
        id: firebaseUser.uid,
        profilePhoto: firebaseUser.photoUrl,
        email: firebaseUser.email);
  }

  /// expose the currently SignedIn user object
  User get currentUser => _currentUser;

  /// setter for the current user object
  set currentUsr(User user) {
    _currentUser = user;
    notifyListeners();
  }

  /// handles signIn from google auth provider takes [onDone] & [onError] params
  void signIn({Function onDone, Function onError}) async {
    var user = await signInWithGoogle();
    if (user != null) {
      currentUsr = user;
      onDone();
      notifyListeners();
    }
    onError();
  }

  /// signOut the currently signedIn user
  void signOut() async {
    await signOutGoogle().then((_) {
      currentUsr = null;
    });
  }
}
