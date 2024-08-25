import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:master_file_go/crud_operation/notes_methods.dart';

class Crudonboard1 extends StatefulWidget {
  const Crudonboard1({super.key});

  @override
  State<Crudonboard1> createState() => _Crudonboard1State();
}

class _Crudonboard1State extends State<Crudonboard1> {
  TextEditingController controller = TextEditingController();
  NotesMethods notesMethods = NotesMethods();

  void showPopup({String? docId}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              controller: controller,
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    if (docId == null) {
                      notesMethods.createNote(controller.text);
                    } else {
                      notesMethods.updateNote(docId, controller.text);
                    }
                    controller.clear();
                    Navigator.of(context).pop();
                  },
                  child: const Text("submit"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showPopup,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: notesMethods.getNotes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List notesList = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: notesList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = notesList[index];
                    String docId = document.id;
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5,
                      child: ListTile(
                        title: Text(data["note"]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  notesMethods.deleteDocument(docId);

                                  Fluttertoast.showToast(
                                      msg: "deleted successfully");
                                }),
                            IconButton(
                                icon: const Icon(Icons.settings),
                                onPressed: () => showPopup(docId: docId)),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(child: Text("NO NOTES"));
            }
          }),
    );
  }
}
