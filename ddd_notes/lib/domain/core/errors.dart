// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ddd_notes/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() => Error.safeToString(
      'Valuefailure at unexpected point. Terminating(Failutre: $valueFailure)');
}
