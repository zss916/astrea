import 'package:astrea/core/signIn/firebase.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

mixin LoginChannelMixin {
  ///谷歌登录
  void googleSignIn(GoogleCallBack callback) async {
    try {
      await GoogleSignIn.instance.initialize();
      final isSupport = GoogleSignIn.instance.supportsAuthenticate();
      if (!isSupport) {
        debugPrint("google supportsAuthenticate => $isSupport");
        callback.call(success: false);
        return;
      }
      final googleUser = await GoogleSignIn.instance.authenticate();
      await FireBaseTools.signInWithCredential(
        credential: FireBaseTools.credential(
          idToken: googleUser.authentication.idToken,
        ),
      );
      String? token = await FireBaseTools.getIdToken();
      debugPrint("google token => $token");
      if (token != null) {
        callback.call(
          success: true,
          idToken: token,
          token: null,
          id: googleUser.id,
          nickname: googleUser.displayName,
          cover: googleUser.photoUrl,
        );
      } else {
        debugPrint("google error: token is null");
        callback.call(success: false);
      }
    } catch (error) {
      debugPrint("google error:${error.toString()}");
      callback.call(success: false);
    }
  }

  ///苹果登录
  void appleLogin(AppleCallBack callBack) async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      String name = (credential.givenName) ?? credential.familyName ?? "";
      String authorizationCode = credential.authorizationCode;
      String? identityToken = credential.identityToken;
      String? userIdentifier = credential.userIdentifier;

      if (authorizationCode.isEmpty ||
          identityToken == null ||
          userIdentifier == null) {
        callBack.call(success: false);
      } else {
        callBack.call(
          success: true,
          authorizationCode: authorizationCode,
          identityToken: identityToken,
          userIdentifier: userIdentifier,
          nickname: name,
        );
      }
    } catch (e) {
      callBack.call(success: false);
    }
  }
}

typedef GoogleCallBack =
    void Function({
      required bool success,
      String? idToken,
      String? token,
      String? id,
      String? nickname,
      String? cover,
    });

typedef AppleCallBack =
    void Function({
      required bool success,
      String? authorizationCode,
      String? identityToken,
      String? userIdentifier,
      String? nickname,
    });
