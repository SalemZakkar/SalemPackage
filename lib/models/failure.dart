import 'package:salem_package/enums/failure_type.dart';

class Failure {
  final FailureType type;
  final String? code;
  const Failure({required this.type , this.code});
}
