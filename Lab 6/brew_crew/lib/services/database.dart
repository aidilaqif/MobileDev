import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/model/brew.dart';
import '../model/person.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .doc(uid)
        .set({'sugars': sugars, 'name': name, 'strength': strength});
  }

  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.get('name') ?? '',
        sugars: doc.get('sugars') ?? '',
        strength: doc.get('strength') ?? 0,
      );
    }).toList();
  }

  //userData from snapshot
  PersonData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return PersonData(uid: uid!, name: snapshot['name'], sugars: snapshot['sugars'], strength: snapshot['strength']);
  }

  //get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //get user doc stream
  Stream<PersonData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
