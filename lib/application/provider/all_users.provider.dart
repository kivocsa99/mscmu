import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mscmu/application/provider/user.repository.provider.dart';
import 'package:mscmu/domain/models/adminmodel.dart';

final allUserProvider = StreamProvider<List<AdminModel>>(
    (ref) => ref.watch(adminRepositoryProvider).allUsers);
