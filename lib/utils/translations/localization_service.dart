import 'package:get/get.dart';
class LocalizationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {"termsAndConditions": " I agree to the terms and conditions"},
        "bn_BD": {"termsAndConditions": " আমি শর্তাবলী সম্পর্কে সম্মত হয়েছি"},
      };
}