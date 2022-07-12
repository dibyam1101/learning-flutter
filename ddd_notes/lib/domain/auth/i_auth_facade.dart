import 'package:dartz/dartz.dart';
import 'package:ddd_notes/domain/auth/auth_failure.dart';
import 'package:ddd_notes/domain/auth/value_objects.dart';

//FirebaseAuth, GoogleSignIn
//Facade helps combine FirebaseAuth and GoogleSignIn Classes into one single interface

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
