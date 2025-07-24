import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

mixin LoginChannelMixin {
  ///谷歌登录
  void googleSignIn(GoogleCallBack callback) async {
    GoogleSignIn googleSign = GoogleSignIn();
    try {
      final isSigned = await googleSign.isSignedIn();
      if (isSigned) {
        await googleSign.signOut();
      }
      final result = await googleSign.signIn();
      final googleAuth = await result?.authentication;

      if (result?.id == null) {
        callback.call(success: false);
      } else {
        callback.call(
            success: true,
            idToken: googleAuth!.idToken,
            token: googleAuth.accessToken,
            id: result!.id,
            nickname: result.displayName,
            cover: result.photoUrl);
      }
    } catch (error) {
      callback.call(success: false);
    }
  }

  ///苹果登录
  void appleLogin(AppleCallBack callBack) async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);
      String name = (credential.givenName) ?? credential.familyName ?? "";
      credential.authorizationCode;
      String? appleToken = credential.identityToken;
      credential.userIdentifier;
      callBack.call(success: true, token: appleToken, nickname: name);
    } catch (e) {
      callBack.call(success: false);
    }
  }
}

typedef GoogleCallBack = void Function(
    {required bool success,
    String? idToken,
    String? token,
    String? id,
    String? nickname,
    String? cover});

typedef AppleCallBack = void Function(
    {required bool success, String? token, String? nickname});
