import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';


abstract class RegisterState extends Equatable {
  RegisterState([List props = const []]) ;
}

//When the form opens
class EmptyRegister extends RegisterState {}

//register is successful
class RegisterSuccess extends RegisterState{}

//failure in email
class RegisterEmailFailure extends RegisterState{}

//valid details
class RegisterSuccessEmailPassword extends RegisterState{}

//failure in password
class RegisterPasswordFailure extends RegisterState{}

//failure in registration
class Failure extends RegisterState{}

//the form is loading
class Loading extends RegisterState{}


//@immutable
//class RegisterState{
//  final bool isEmailValid;
//  final bool isPasswordValid;
//  final bool isSubmitting;
//  final bool isSuccess;
//  final bool isFailure;
//
//  bool get isFormValid => isEmailValid && isPasswordValid;


  //RegisterState({
  //  @required this.isEmailValid,
  //  @required this.isPasswordValid,
  //  @required this.isSubmitting,
  //  @required this.isSuccess,
  //  @required this.isFailure,
  //});


  //factory RegisterState.empty() {
    //return RegisterState(
      //isEmailValid: true,
      //isPasswordValid: true,
      //isSubmitting: false,
      //isSuccess: false,
      //isFailure: false,
    //);
 // }

  //factory RegisterState.loading() {
    //return RegisterState(
      //isEmailValid: true,
      //isPasswordValid: true,
      //isSubmitting: true,
      //isSuccess: false,
      //isFailure: false,
    //);
 //}

  //factory RegisterState.failure() {
//    return RegisterState(
  //    isEmailValid: true,
    //  isPasswordValid: true,
      //isSubmitting: false,
  //    isSuccess: false,
    //  isFailure: true,
   // );
  //}

  //factory RegisterState.success() {
  //  return RegisterState(
  //    isEmailValid: true,
  //    isPasswordValid: true,
  //    isSubmitting: false,
  //    isSuccess: true,
  //    isFailure: false,
  //  );

  //}

  //RegisterState update({
  //  bool isEmailValid,
  //  bool isPasswordValid,
 // }) {
   // return copyWith(
   //   isEmailValid: isEmailValid,
  //    isPasswordValid: isPasswordValid,
    //  isSubmitting: false,
//      isSuccess: false,
  //    isFailure: false,
  //  );
 // }

 // RegisterState copyWith({
   // bool isEmailValid,
  //  bool isPasswordValid,
   // bool isSubmitEnabled,
   // bool isSubmitting,
   // bool isSuccess,
   // bool isFailure,
  //}) {
    //return RegisterState(
 //     isEmailValid: isEmailValid ?? this.isEmailValid,
   //   isPasswordValid: isPasswordValid ?? this.isPasswordValid,
     // isSubmitting: isSubmitting ?? this.isSubmitting,
 //     isSuccess: isSuccess ?? this.isSuccess,
 //     isFailure: isFailure ?? this.isFailure,
 //   );
 // }

  //@override
  //String toString() {
  //  return '''isEmailValid: $isEmailValid,isPasswordValid: $isPasswordValid,isSubmitting: $isSubmitting,isSuccess: $isSuccess,isFailure: $isFailure,''';
 // }
//}