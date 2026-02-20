import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valentineproject/Provider/loveNoteProvider.dart';

class AddNoteScreen extends StatefulWidget {
  final int? index;
  final loveNote? note ;

  const AddNoteScreen({super.key, this.note, this.index});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void dispose() {
    _toController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.note != null){
      _toController.text = widget.note!.to;
      _bodyController.text = widget.note!.body;
    }
  }

  var note = AddNoteScreen().note;

  @override
  Widget build(BuildContext context) {
    if(widget.note == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Describe Your Feeling Freely"),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              TextField(
                controller: _toController,
                decoration: InputDecoration(
                  labelText: "Who's that girl  (name your belove one)",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.pink[200]!,
                          width: 1.5
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.pinkAccent,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: Icon(Icons.girl),
                  prefixIconColor: Colors.brown,
                  labelStyle: TextStyle(
                      color: Colors.pinkAccent
                  ),
                ),
              ),

              SizedBox(height: 50,
                child: Icon(
                  Icons.monitor_heart_outlined, color: Colors.pinkAccent,),),

              TextField(
                controller:_bodyController,
                decoration: InputDecoration(
                  labelText: "Tell Your Emotions About her  (whispher your belove one)",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.pink[200]!,
                          width: 1.5
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.pinkAccent,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: Icon(Icons.email),
                  prefixIconColor: Colors.brown,
                  labelStyle: TextStyle(
                      color: Colors.pinkAccent
                  ),
                ),
              ),

              SizedBox(height: 50,
                child: Icon(
                  Icons.monitor_heart_outlined, color: Colors.pinkAccent,),),

              Consumer<LoveNoteProvider>(
                  builder: (context, provider, child) {
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RadioListTile<bool>(
                              title: const Text("Favorite"),
                              contentPadding: EdgeInsets.zero,
                              groupValue: provider.defaultMode,
                              value: true,
                              activeColor: Colors.pinkAccent,
                              onChanged: (_) {
                                provider.changeMode(true);
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RadioListTile<bool>(
                              title: const Text("Later"),
                              groupValue: provider.defaultMode,
                              contentPadding: EdgeInsets.zero,
                              value: false,
                              activeColor: Colors.pinkAccent,
                              onChanged: (_) {
                                provider.changeMode(false);
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }
              ),

              Consumer<LoveNoteProvider>(
                builder: (context, provider, child) {
                  return ElevatedButton(
                    onPressed: () {
                      provider.addNote(_toController.text, _bodyController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Save Your Valentine's Memory ${provider.notes
                                    .length}"),
                            backgroundColor: Colors.pinkAccent,
                            behavior: SnackBarBehavior.floating,
                            // Makes it look modern
                            duration: Duration(seconds: 2),

                          )
                      );
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.local_florist_rounded),
                  );
                },
              )
            ],
          ),
        ),
      );
    }
    else{
      context.read<LoveNoteProvider>().changeMode(widget.note?.isFavorite);
      return Scaffold(

        appBar: AppBar(
          title: Text("Describe Your Feeling Freely"),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              TextField(
                controller: _toController,
                decoration: InputDecoration(
                  labelText: "Who's that girl  (name your belove one)",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.pink[200]!,
                          width: 1.5
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.pinkAccent,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: Icon(Icons.girl),
                  prefixIconColor: Colors.brown,
                  labelStyle: TextStyle(
                      color: Colors.pinkAccent
                  ),
                ),
              ),

              SizedBox(height: 50,
                child: Icon(
                  Icons.monitor_heart_outlined, color: Colors.pinkAccent,),),

              TextField(
                controller: _bodyController,
                decoration: InputDecoration(
                  labelText: "Tell Your Emotions About her  (whispher your belove one)",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.pink[200]!,
                          width: 1.5
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.pinkAccent,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: Icon(Icons.email),
                  prefixIconColor: Colors.brown,
                  labelStyle: TextStyle(
                      color: Colors.pinkAccent
                  ),
                ),
              ),

              SizedBox(height: 50,
                child: Icon(
                  Icons.monitor_heart_outlined, color: Colors.pinkAccent,)
                ,),

              Consumer<LoveNoteProvider>(
                  builder: (context, provider, child) {
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RadioListTile<bool>(
                              title: const Text("Favorite"),
                              contentPadding: EdgeInsets.zero,
                              groupValue: provider.defaultMode,
                              value: true,
                              activeColor: Colors.pinkAccent,
                              onChanged: (_) {
                                provider.changeMode(true);
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RadioListTile<bool>(
                              title: const Text("Later"),
                              groupValue: provider.defaultMode,
                              contentPadding: EdgeInsets.zero,
                              value: false,
                              activeColor: Colors.pinkAccent,
                              onChanged: (_) {
                                provider.changeMode(false);
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }
              ),

              Consumer<LoveNoteProvider>(
                builder: (context, provider, child) {
                  return ElevatedButton(
                    onPressed: () {
                      provider.editnote( widget.index! , new loveNote(body: _bodyController.text, to: _toController.text, isFavorite: provider.defaultMode));
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Change Your Valentine's Memory ${provider.notes
                                    .length}"),
                            backgroundColor: Colors.pinkAccent,
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),

                          )
                      );
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.local_florist_rounded),
                  );
                },
              )
            ],
          ),
        ),
      );
    }
  }
}

