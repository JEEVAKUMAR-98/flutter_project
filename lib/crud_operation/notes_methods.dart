import 'package:cloud_firestore/cloud_firestore.dart';

class NotesMethods {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection("notes");

  Future<void> createNote(String note) async {
    await notes.add({"note": note, "timestamp": DateTime.now()});
  }

  Stream<QuerySnapshot> getNotes() {
    final notestream =
        notes.orderBy("timestamp", descending: false).snapshots();
    return notestream;
  }

  Future<void> updateNote(String docId, String updatedNote) async {
    await notes
        .doc(docId)
        .update({"note": updatedNote, "timestamp": DateTime.now()});
  }

  Future<void> deleteDocument(String docId) async {
    await notes .doc(docId).delete();
  }
}
