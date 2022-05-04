// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // String? adminId;
  DatabaseService();
  //collection reference
  final CollectionReference adminCollection =
      FirebaseFirestore.instance.collection('admin');

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference bookingCollection =
      FirebaseFirestore.instance.collection('appointmentData');

  Stream<QuerySnapshot> get adminDetails {
    return adminCollection.snapshots();
  }

  Stream<QuerySnapshot> get userDetails {
    return userCollection.snapshots();
  }

  Stream<QuerySnapshot> get bookingDetails {
    return bookingCollection.snapshots();
  }

  Future<void> deleteBooking(var docId) async {
    try {
      DocumentReference documentReferencer = bookingCollection.doc(docId);
      print('doc ref: $documentReferencer');
      await documentReferencer
          .delete()
          .whenComplete(() => print('Note item deleted from the database'))
          .catchError((e) => print(e));
    } catch (e) {
      print(e);
    }
  }

  Future<DocumentReference> bookAppoointment(Map data) {
    return bookingCollection.add(data);
  }

  Future<dynamic> loginCreds() async {
    Map response;
    // try {
    DocumentReference documentReferencer =
        adminCollection.doc('H1OvIhbg3okAKXcNyjmC');
    DocumentSnapshot<Object?> data = await documentReferencer.get();

    response = data.data() as Map;
    // print('doc ref: ${data.data() as Map}');
    print('doc ref: $response');
    return response;
    // } catch (e) {
    //   print(e);
    // }
  }
}
