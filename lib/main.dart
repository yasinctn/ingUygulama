import 'package:flutter/material.dart';
import 'furnitureList.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Project1(),
      );
  }
}
class Project1 extends StatefulWidget {
  const Project1({super.key});

  @override
  State<Project1> createState() => _Project1State();
}

bool isButtonActive = true;

class _Project1State extends State<Project1> {

final _textController = TextEditingController();

String userInput = '';

FurnitureLink furnitureFinder = FurnitureLink();

Color? colour = Colors.white.withOpacity(0);

List <Icon> scoreKeeper =[];

int correctAnswers=0, wrongAnswers=0;

int textFieldActive=0;

Color forwardArrayColor = Colors.black;

Color backArrayColor = Colors.white.withOpacity(0);

Color ColourBorder = Colors.yellow.shade600;

void checkingTime(){
  if(correctAnswers+wrongAnswers==10){
   Alert(
      context: context,
      type: AlertType.success,
      title: "THE TEST IS COMPLETED! CONGRATS!",
      desc: "Number of correct answers: $correctAnswers\nNumber of wrong answers: $wrongAnswers",
      buttons: [
        DialogButton(child: Text(
          "DONE",
           style: TextStyle(color: Colors.white, fontSize: 20),
        ),
         onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),),
      ]
    ).show();
    scoreKeeper.clear();
    furnitureFinder.keepTrack=0;
    colour = colour;
  }
}
void theEnd(){
 
  Alert(
      context: context,
      type: AlertType.warning,
      title: "THE TEST IS NOT COMPLETED YET",
      desc: "You didn't complete the test. Are you sure you want to submit the test?",
      buttons: [
         DialogButton(
           child: Text(
            "YES",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "CANCEL ",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.red,
        )
      ],
    ).show();
}
void isVisible(){
  if(furnitureFinder.keepTrack==0){
    backArrayColor = Colors.white.withOpacity(0);
    forwardArrayColor = Colors.black;
  }
  else if (furnitureFinder.keepTrack==furnitureFinder.furnitureBank.length-1){
    backArrayColor = Colors.black;
    forwardArrayColor = Colors.white.withOpacity(0);
  }
  else {
    backArrayColor = Colors.black;
    forwardArrayColor = Colors.black;
  }
}
void checkIt(){
  setState(() {
    
    String correct = furnitureFinder.QuestionEng();
  if(userInput!=correct){
    print('renk degisti');
    scoreKeeper.add(
         const Icon(Icons.close,
        color: Color.fromARGB(255, 255, 255, 255)),
    );
    
    colour = const Color.fromARGB(255, 198, 56, 45).withRed(170);
    wrongAnswers++;
    furnitureFinder.furnitureBank[furnitureFinder.keepTrack].correction=2;
    ColourBorder = Colors.red;
  }
  else {
    scoreKeeper.add(
        const Icon(Icons.check,
        color: Color.fromARGB(255, 255, 255, 255),
        ),
    );
       
    colour = Color.fromARGB(255, 47, 106, 49).withGreen(220);
    correctAnswers++;
    furnitureFinder.furnitureBank[furnitureFinder.keepTrack].correction=1;
    ColourBorder = Colors.green; 
   }
  });
}
void lightColor(){
  if (furnitureFinder.furnitureBank[furnitureFinder.keepTrack].correction==1) {
    colour=const Color.fromARGB(255, 47, 106, 49).withGreen(220);
    isButtonActive=false;
    textFieldActive=1;
    ColourBorder = Color.fromARGB(255, 40, 185, 45);
  }
  else if (furnitureFinder.furnitureBank[furnitureFinder.keepTrack].correction==2) {
    colour=const Color.fromARGB(255, 198, 56, 45).withRed(170);
    isButtonActive=false;
    textFieldActive=1;
    ColourBorder = Colors.red;
  }
  else if(furnitureFinder.furnitureBank[furnitureFinder.keepTrack].correction==0) {
    colour = colour;
    isButtonActive=true;
   ColourBorder = Colors.yellow.shade600;
  }
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: AppBar(

        leading:  IconButton(onPressed: (){
           setState(() {
  
            });
            
        },
           icon: const Icon(Icons.arrow_back_ios_new)),

        backgroundColor: const Color.fromRGBO(96, 114, 116,1),
        title: const Text('Find The Word'),
        actions: [
          
           IconButton(onPressed: (){
            setState(() {
                theEnd();
            });
           },
           icon: const Icon(Icons.settings)),
        ],      
        ),
      body: Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(250, 238, 209, 1)),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        
        child: SafeArea(
          child:  Column (
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Expanded(
                flex: 7,
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                             setState(() {
                              print('going back');
                              furnitureFinder.goBack();
                              furnitureFinder.QuestionImage();
                              furnitureFinder.QuestionEng();
                              furnitureFinder.QuestionTr();
                              colour=Colors.white.withOpacity(0); 
                              lightColor();
                              isVisible();
                              }); 
                          },
                             icon: const Icon(Icons.arrow_back_ios_new),
                             color: backArrayColor,),
                
                    Expanded(
                      flex: 6,
                      child: Container(
                      width: 280.0,
                      height: 300.0,
                     
                      decoration: BoxDecoration(
                        
                        image: DecorationImage(
                        
                        fit: BoxFit.scaleDown, 
                        image: AssetImage(furnitureFinder.QuestionImage(),),),
                        
                        borderRadius: const BorderRadius.all(Radius.circular(23.0)),
                        
                        color: Colors.white,
                        border: Border.all(color: ColourBorder),
                      ),
                    ),
                    ),
                     IconButton(onPressed: (){
                               setState(() {
                               print('going forward');
                               furnitureFinder.goForward();
                               furnitureFinder.QuestionImage();
                               furnitureFinder.QuestionEng();
                               furnitureFinder.QuestionTr(); 
                               colour=Colors.white.withOpacity(0);
                              lightColor();
                              isVisible();
                               }); 
                              },
                              icon: const Icon(Icons.arrow_forward_ios),
                              color: forwardArrayColor,),
                  ],
                ),
              ),
              
                   const Expanded(
                  flex: 1,
                   child: SizedBox(
                    height: 1.0, 
                   ),
                    ),
                    
                  Expanded(
                    flex: 2,
                    child: Text(
                        furnitureFinder.QuestionTr(),
                        style: const TextStyle(fontSize: 32.0,
                        color: Color.fromRGBO(62, 75, 76, 1),
                        fontWeight: FontWeight.w500,
                        ),
                        
                      ),
                  ),
                    
               Expanded(
                flex: 2,
                 child: Text(furnitureFinder.QuestionEng(),
                             style: TextStyle(
                             color: colour,
                             fontSize: 32.0,
                             
                             ),
                           ),
               ),
          const Expanded(
                  flex: 1,
                   child: SizedBox(
                    height: 1.0, 
                   ),
                    ),
          
                Expanded(
                  flex: 2,
                  child: TextField(
                    
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                      cursorWidth: 5.0,
                        controller: _textController,
                        cursorColor:const Color.fromRGBO(96, 114, 116,1),
                        
                      decoration: InputDecoration(
                      
                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),

                        focusedBorder: const OutlineInputBorder(

                          borderSide: BorderSide(color: Color.fromARGB(255, 58, 70, 71),),

                          borderRadius: BorderRadius.all(Radius.circular(20)),

                          ),
                        labelText: 'Enter your answer',

                        border:  const OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            
                        ),
                        
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _textController.clear();
                            });
                            
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 54, 64, 65),
                            ),),),
                            ),
                ),
  
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: MaterialButton(
                  disabledColor: const Color.fromRGBO(222, 208, 182, 1),
                  onPressed:
                isButtonActive ?
                 (){
                  setState(() 
                  {
                    userInput = _textController.text;
                    _textController.clear();
                    checkIt();
                    isButtonActive=false;
                    checkingTime();
                  });
                  
                }
                : null,
                
                height: 40.0,
                minWidth: 140.0,
                color: const Color.fromRGBO(178, 165, 155,1),
                child: const Text('Check',style: TextStyle(color: Colors.white,fontSize: 25.0),),
                ),
              ),
              const Expanded(
                  flex: 1,
                   child: SizedBox(
                    height: 2.0, 
                   ),
                    ),
                    Container(
                      margin:const EdgeInsets.only(left: 50,right: 50),
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      decoration: const BoxDecoration(
                        color:  Color.fromRGBO(142, 142, 142, 0.782),
                        borderRadius: const BorderRadius.all(Radius.circular(10.0),),
                      ),
                      child: Row(
                        children: scoreKeeper,
                      ),
                    )
          ],),
          
          ),
      ),
     
    );
    
  }
}
