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
          cover: result.photoUrl,
        );
      }
    } catch (error) {
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
      credential.authorizationCode;
      String? appleToken = credential.identityToken;
      credential.userIdentifier;
      String text =
          'name:$name,appleToken:$appleToken,userIdentifier:${credential.userIdentifier}';
      // AppLoading.toast(text, duration: Duration(seconds: 20));
      callBack.call(success: true, token: appleToken, nickname: name);
    } catch (e) {
      callBack.call(success: false);
      /*callBack.call(
        success: true,
        token:
            "eyJrawQioiJVYUlJRlkyZlcoliwiywxnljoiUlMyNTYifQ.eyJpc3MiOiJodHRwczovL2FwcGxlawQuYxBwbGUuY29tliwiyxVkljoiY29tLmFzdHJlYs5maw5kbxlzbcvmliwizxhwljoxNZU2ODA0MzAyLCJpYXQiOjE3NTY3MTC5MDIsInN1YiI6IjAWMTK1NC44MWZmNDYyNZM4MTCOMzUzYjkyZWNiMTU2OGQ1NmY4My4wNjl4liwiY19oYxNoljoicvhkMXB2eE1LWTNrNWppS1VjSmlDZylslmVtYwlsljoic2Fiyw5hbGx5bmvodGUzQGdtYWlsLmNvbSlsImVtYWlsx3ZlcmlmawvkljpocnVILCJhdXRox3RpbWUiOjE3NTY3MTc5MDIsIm5vbmNIX3N1CHBvcnRlZCI6dHJ1ZX0.SR_GEV1pqkpb BjCq1JYJIPW3E6OUDIPNApc6-fF9UjDRExQdvTDTpg8vKIHcbwVYP7hZ2GLojr9A9tohkBdO1L90lyh opJiaFiVwDb1lxPlHbwPUafst9hthKicHLYGHJJa41r6w-1cJhQ5hnhaegAoonVbMNkkgtYnuLCPoDJ390Hh88Ps92TlejJ0F5t0iTcuqqQjnlqllmol5NZiQ6Y9abAvR-_kH5qnM7hCWpzBCtlvKxSmZn2vTzSdMggT5etGN8LSlhw6n23wA-QxPPuYuLvilgBHqBsfgfY16xom3NuffqjIWEGOHR OxYM6MeJx1WR2BCyVqVNW5_A",
        nickname: "apple",
      );*/
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
    void Function({required bool success, String? token, String? nickname});
