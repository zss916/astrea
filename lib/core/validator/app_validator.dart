mixin AppValidatorMixin {
  String? isEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required.";
    final regex = RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) return "Enter a valid email.";
    return null;
  }

  String? isGoogleEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required.";
    final regex = RegExp(r'^[a-zA-Z0-9.]+@gmail\.com$');
    if (!regex.hasMatch(value)) return "Enter a valid email.";
    return null;
  }

  bool isPwd2(String? value) {
    if (value == null || value.isEmpty) return false;
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    if (regex.hasMatch(value)) return true;
    return false;
  }

  bool isPwd(String? value) {
    if (value == null || value.isEmpty) return false;
    final regex = RegExp(r'^.{8,20}$');
    if (regex.hasMatch(value)) return true;
    return false;
  }

  bool isMatchName(String? value) {
    if (value == null || value.isEmpty) return false;
    final regex = RegExp(r'^[a-zA-Z0-9_]{1,16}$');
    if (regex.hasMatch(value)) return true;
    return false;
  }
}
