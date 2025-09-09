import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FireBaseTools {
  ///初始化
  static Future<void> init() async {
    FirebaseAuth.instanceFor(app: await Firebase.initializeApp());
    //await Firebase.initializeApp();
  }

  ///获取凭证
  static OAuthCredential credential({String? idToken, String? accessToken}) {
    final credential = GoogleAuthProvider.credential(
      accessToken: accessToken,
      idToken: idToken,
    );
    return credential;
  }

  ///登录
  static Future<UserCredential> signInWithCredential({
    required OAuthCredential credential,
  }) {
    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  ///获取idToken
  static Future<String?> getIdToken() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    currentUser?.displayName;
    if (currentUser != null) {
      final tokenResult = await currentUser.getIdToken();
      final token = tokenResult;
      debugPrint('-----token-----, $token');
      debugPrint(token);
      return token;
    } else {
      debugPrint('Login Failed');
      return null;
    }
  }

  ///登出
  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
