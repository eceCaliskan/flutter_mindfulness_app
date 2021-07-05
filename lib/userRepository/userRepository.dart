import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UserRepository{
  final FirebaseAuth _firebaseAuth; //defining the firebase
  final firestoreInstance = FirebaseFirestore.instance; //defining the instance
  DateTime _now = new DateTime.now();

  //getting the instance from the firebase authentication
  UserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  //signs user into the account
  Future <String> signInWithEmail({String email, String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return "Success";
  }

  //register the user to the authentication system
  Future <String> signUpWithEmail({String email, String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return "Success";
  }

  //signs the user out of the system
  Future <String> signOut() async {
    await _firebaseAuth.signOut();
    return "Success";
  }

   //returns the current user
  Future <bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future <String> getUser() async {

    var userUid =  _firebaseAuth.currentUser.uid;
   // if (firestoreInstance.collection('users').doc(userUid).get() != null){
      return await _firebaseAuth.currentUser.email;
   // }
  }

  Future <String> getUserUID() async {
    final currentUser = await _firebaseAuth.currentUser;
    print(currentUser.toString());
  }

  //returns the username of the user from cloud firestore
  Future<String> getName() async {
    var userUid =  _firebaseAuth.currentUser.uid;
    DocumentSnapshot variable = await Firestore.instance.collection('users').doc(userUid).get();
    return variable.data()['username'];
  }


  Future<List> getTexts() async{
    var userUid =  _firebaseAuth.currentUser.uid;
    DocumentSnapshot variable = await Firestore.instance.collection('users').doc(userUid).get();
    List checkin=
    [
      variable.data()['reflection'],
    ];
    return checkin;
  }


  //Adding the answers and questions to the database of the user
  Future <void> addTextToDatabase(String text1, String text2, String text3,
      String question1, String question2, String question3 ) async{
    var userUid =  _firebaseAuth.currentUser.uid;
    firestoreInstance.collection('users').doc(userUid).update({
      "reflection": {
        "post date": _now,
        question1: text1,
        question2: text2,
        question3: text3
      }
    });
  }

  Future <void> addUserToDatabase (String username) {
    var userUid =  _firebaseAuth.currentUser.uid;
    firestoreInstance.collection('users').doc(userUid).set({
      "username": username,
      "register date": _now,
    });
  }

  ////added to test
 Stream<User> get userTest => _firebaseAuth.authStateChanges();

}