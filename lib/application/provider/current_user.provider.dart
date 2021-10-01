import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models/adminmodel.dart';
import 'user.repository.provider.dart';

final currentUserProvider = StreamProvider<AdminModel>(
    (ref) => ref.watch(adminRepositoryProvider).currentUserStream);
