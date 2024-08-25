import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:master_file_go/hive/hive_localst_method_1.dart';

class HiveScreen1 extends StatefulWidget {
  const HiveScreen1({super.key});

  @override
  State<HiveScreen1> createState() => _HiveScreen1State();
}

class _HiveScreen1State extends State<HiveScreen1> {
  TextEditingController controller = TextEditingController();
  HiveMethods hiveMethods = HiveMethods();
  void showPopup({int? index}) {
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
                    if (index == null) {
                      hiveMethods.createNote(controller.text);
                      setState(() {
                        
                      });
                    } else {
                      hiveMethods.updateNote(index, controller.text);
                      setState(() {
                        
                      });
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
    List<String> notesList = hiveMethods.getNotes();
    return Scaffold(
      appBar: AppBar(
        title: const Text("HIVE CRUD"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showPopup,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(10),
                elevation: 5,
                child: ListTile(
                  title: Text(notesList[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            hiveMethods.deleteNote(index);
                            setState(() {
                              
                            });
                            Fluttertoast.showToast(msg: "deleted successfully");
                          }),
                      IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () => showPopup(index: index)),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
