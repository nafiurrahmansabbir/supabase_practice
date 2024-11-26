import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textTEController = TextEditingController();

  /*
  -Create note

   */
  void addNewNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textTEController,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    saveNote();
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ));
  }

  void saveNote() async {
    await Supabase.instance.client
        .from('notes')
        .insert({'data': textTEController.text});
  }

  /*
  read note

   */


  final _notesStream= Supabase.instance.client.from('notes').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _notesStream,
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator());
          }

          final notes=snapshot.data!;
          return ListView.builder(

            itemCount: notes.length,
            itemBuilder: (context,index){
              final note=notes[index];
              final noteText=note['data'];

              return Text(noteText);
            },


          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}
