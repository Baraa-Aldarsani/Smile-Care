import 'package:smile_care/core/core.dart';

class StringsAr extends Strings {
  StringsAr([String locale = 'ar']) : super(locale);

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get email => 'إيميل';

  @override
  String get password => 'كلمة السر';
  @override
  String get confirmPassword => 'أعد كلمة السر';
  @override
  String get forgotPassword => 'هل نسيت كلمة السر؟';

  @override
  String get account => 'ليس لديك حساب؟';
}
