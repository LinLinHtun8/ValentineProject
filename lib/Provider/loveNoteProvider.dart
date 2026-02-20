import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LoveNoteProvider extends ChangeNotifier{


  List<loveNote> _notes = [loveNote( body: "Look, An Angel on my Eye, She's flying in my mind, i'm falling in your smile, i know one day you'll be mine", to: "You :)", isFavorite: false)];

  int get noteCount => _notes.length;

  bool _defaultMode = true;

  List<loveNote> get notes => _notes;

  bool get defaultMode => _defaultMode;
  
  List<loveNote> get favoriteNotes => 
      
      _notes.where((note) => note.isFavorite).toList();

  void addNote(String to, String body) {
    _notes.add(loveNote(
        body: body,
        to: to,
        isFavorite: _defaultMode
    ));
    notifyListeners();
  }

  void toggleFavorite(int index ){
    _notes[index].isFavorite = !_notes[index].isFavorite;
    notifyListeners();
  }

  void removeNotes(int index){

    _notes.removeAt(index);
    notifyListeners();

  }

  void changeMode(mode){
    _defaultMode = mode;
    notifyListeners();
  }
  
  void editnote(int index, loveNote note){
    _notes[index] = note;
    notifyListeners();
  }




}

class loveNote{

   String body;
   String to;
   bool isFavorite;

  loveNote({
    required this.body,
    required this.to ,
    required this.isFavorite
  });

}