import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
class FirebaseMethods{

  static void saveUserToFirebase({String uid,String name,String email})
  {
    db.collection('users').doc(uid).set({
      'name' : name ,
      'email' : email ,
    });
  }
static Future<void> getDataFromDatabase(String uid)
async {
    // for getting mail of a particular user
  // DocumentSnapshot snapshot = await db.collection('users').doc(uid).get();
  // print('---------------------');
  // print(snapshot.data()['email']);
  // print('----------------------');

  //for delete:
  //await db.collection('users').doc(uid).delete();

  //for getting all users data:
  QuerySnapshot snapshot = await db.collection('users').get();
print('---------List--------');
snapshot.docs.forEach((element) { print(element.data()['email']); });
print('------------');


}
}