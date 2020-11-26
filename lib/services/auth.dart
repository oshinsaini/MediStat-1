import 'package:dbapp/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn=new GoogleSignIn();

  //create user object based on firebase user
  User _userFromFireBaseUser(FirebaseUser user){
    return user!=null ? User(uid:user.uid) : null;
  }

  //auth change using stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
          .map(_userFromFireBaseUser);
  }
   
  //sign in anonymously
  Future signInAnon() async{
    try{
      AuthResult result =await _auth.signInAnonymously();
      FirebaseUser user=result.user;
      return _userFromFireBaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with google
    Future<FirebaseUser> googleSignIn() async{
      GoogleSignInAccount googleSignInAccount=await _googleSignIn.signIn();
      GoogleSignInAuthentication gsa=await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: gsa.accessToken,
        idToken: gsa.idToken,
      );
      final AuthResult authResult = await _auth.signInWithCredential(credential);
      print("auth result is ");
      print(authResult);
      FirebaseUser user = authResult.user;
      print("user name "+user.displayName);
      return user;
      

  }

  //sign in with email and password
  Future signin(String email,String password) async{
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      FirebaseUser user=result.user;
      return _userFromFireBaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register wit email and password
  Future register(String email,String password) async{
    try{
      AuthResult result=await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      FirebaseUser user=result.user;
      return _userFromFireBaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async{
    try{
      await _googleSignIn.signOut();
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}