import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/models/yearmodel.dart';
import '../../../domain/years/contracts/i.years.repository.dart';

class YearsRepository implements IYearsRepository {
  final _firestore = FirebaseFirestore.instance;
  static const String yearscollection = "years";

  @override
  Stream<YearsModel>get yearsStream {
   final docRef =
        _firestore.collection(yearscollection).doc("classes");
    final snapshots = docRef.snapshots();
    return snapshots.map((current) => YearsModel.fromJson(current.data()!));
  }
}
