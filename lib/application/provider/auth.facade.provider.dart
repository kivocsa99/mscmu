import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/auth/contracts/i.auth.facade.dart';
import '../../infrastructure/auth/services/firebase.auth_facade.dart';

final authFacadeProvider = Provider<IAuthFacade>((ref)=>FirebaseAuthFacade());
