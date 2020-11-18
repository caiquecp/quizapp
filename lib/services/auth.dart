import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> get getUser => _auth.currentUser();
  Stream<FirebaseUser> get user => _auth.onAuthStateChanged;

  Future<FirebaseUser> anonSignIn() async {
    try {
      AuthResult authResult = await _auth.signInAnonymously();
      updateUserData(authResult.user);
      return authResult.user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<FirebaseUser> googleSignIn() async {
    try {
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      AuthResult authResult = await _auth.signInWithCredential(credential);
      updateUserData(authResult.user);
      return authResult.user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  Future<void> updateUserData(FirebaseUser user) {
    DocumentReference reportRef = _db.collection("reports").document(user.uid);
    return reportRef.setData({"uid": user.uid, "lastActivity": DateTime.now()},
        merge: true);
  }
}
