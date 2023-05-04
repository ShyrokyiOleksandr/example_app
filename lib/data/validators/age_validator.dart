import 'package:avasoft_test/domain/validators/i_age_validator.dart';

class AgeValidator implements IAgeValidator {
  @override
  AgeValidationStatus validate(int? age) {
    if (age == null) return AgeValidationStatus.empty;
    if (age < 18) return AgeValidationStatus.underage;
    if (age > 98) return AgeValidationStatus.overage;
    return AgeValidationStatus.valid;
  }
}
