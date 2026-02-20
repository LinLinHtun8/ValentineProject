import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valentineproject/Provider/loveNoteProvider.dart';
import 'package:valentineproject/Screen/addNoteScreen.dart';


void main(){
  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (context)=> LoveNoteProvider()),


      ],
      child: MaterialApp(
        home: homeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    )
  );
}

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Hello Valentine", style: TextStyle(color: Colors.black),),
      ),

      body: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.5,
          ),
          itemCount: context.watch<LoveNoteProvider>().noteCount,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNoteScreen(note: context.read<LoveNoteProvider>().notes[index], index: index,)));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent[100],
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(width: 2, color: Colors.brown[400]!),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "သို့, ${context.read<LoveNoteProvider>().notes[index].to}",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            context.read<LoveNoteProvider>().notes[index].body,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ),
              
                    Row(
                      children: [
                        Align(
                          alignment:  Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: IconButton(
                                onPressed: (){
                                  context.read<LoveNoteProvider>().removeNotes(index);
                                },
                                icon: Icon(Icons.delete_forever, size: 30,),
                                color: Colors.red,
                            ),
                          ),
                        ),
                        Expanded(child: SizedBox(height: 12,)),

                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Consumer<LoveNoteProvider>(
                            builder: (BuildContext context, LoveNoteProvider provider, Widget? child) {
                              return IconButton(
                                  onPressed: () {
                                    provider.toggleFavorite(index);
                                  },
                                  icon: Icon(Icons.favorite, size: 30,
                                  color: provider.notes[index].isFavorite == true ? Colors.red: Colors.white,
                                  ),
                              );
                            },
                            ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            );
          }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNoteScreen()));
        },
        child: Icon(Icons.add, color: Colors.pinkAccent,),
      ),


    );
  }
}
