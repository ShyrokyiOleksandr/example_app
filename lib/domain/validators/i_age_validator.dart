abstract class IAgeValidator {
  AgeValidationStatus validate(int? age);
}

enum AgeValidationStatus {
  unvalidated,
  empty,
  underage,
  overage,
  valid,
}
