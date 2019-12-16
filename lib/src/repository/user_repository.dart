import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _googleSignIn = googleSignIn ?? GoogleSignIn();
  
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  final Firestore _db = Firestore.instance;

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = 
      await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _firebaseAuth.signInWithCredential(credential);
    updateUserData(await _firebaseAuth.currentUser());
    return _firebaseAuth.currentUser();
  }

  Future<void> signInWithCredentials(String email, String password) async {
    _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    updateUserData(await _firebaseAuth.currentUser());
  }

  Future<void> signUp({String email, String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    updateUserData(await _firebaseAuth.currentUser());
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future updateUserData(FirebaseUser user) async {
    final DocumentReference ref = _db.collection('users').document(user.uid);

    final Map<String, dynamic> data = <String, dynamic>{
      'uid': user.uid,
      'email': user.email,
      'phoneNumber': user.phoneNumber,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
    };
    return ref.setData(data, merge: true);
  }

  Future<bool> isSignedIn() async {
    final FirebaseUser currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).email;
  }

  Future<FirebaseUser> getFirebaseUser() async {
    return await _firebaseAuth.currentUser();
  }
}