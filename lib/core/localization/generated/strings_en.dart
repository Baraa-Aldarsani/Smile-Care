import 'package:smile_care/core/core.dart';

class StringsEn extends Strings {
  StringsEn([String locale = 'en']) : super(locale);

  @override
  String get signIn => 'LOGIN';

  @override
  String get signUp => 'Register';

  @override
  String get email => 'Email';
  
  @override
  String get password => 'Password';
  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get forgotPassword => 'Forget your password?';

  @override
  String get account => 'Don’t have an account?';
}
