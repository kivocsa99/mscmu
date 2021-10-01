import '../../models/yearmodel.dart';

abstract class IYearsRepository {
  Stream<YearsModel> get yearsStream;
}
