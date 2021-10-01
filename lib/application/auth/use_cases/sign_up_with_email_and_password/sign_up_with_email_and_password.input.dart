import '../../../../domain/models/adminmodel.dart';




class SignUpWithEmailAndPasswordUseCaseInput {
  final AdminModel? user;
  final String? password;

  SignUpWithEmailAndPasswordUseCaseInput({
    this.user,
    this.password,
  });
}
