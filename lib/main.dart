import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

Color colour = Colors.white;
Color textColor = Colors.black;
bool light = true;
String themeAppText = 'Day Mode';
changeColor(){
  if (light == false) {
    colour = Colors.black;
    textColor = Colors.white;
themeAppText = 'Dark Mode';
  }
  else if (light == true)
  {colour = Colors.white;
  textColor = Colors.black;
  themeAppText = 'Day Mode';
  }
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      home: AppTheme(),
    );
  }
}
class AppTheme extends StatefulWidget {
  const AppTheme({super.key});

  @override
  State<AppTheme> createState() => _AppThemeState();
}



class _AppThemeState extends State<AppTheme> {
  
  @override
  Widget build(BuildContext  
  
  context) {
    return  Scaffold(
      appBar: AppBar(title: Text('App Theme'),backgroundColor: Color.fromARGB(255, 40, 69, 84),),
      
      body: Container(
        decoration: BoxDecoration(color: colour),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          
          children: [
           
            Row(
             
              children: [
                
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(25.0, 10.0,0,0),
                    child: Text(themeAppText,
                    
                    style: TextStyle(color: textColor,
                    fontSize: 20.0),),
                  ),
                ),
                
                Padding(
                  padding:  EdgeInsets.fromLTRB(0, 10.0,25.0,0),
                  child: Switch(
                      
                      value: light,
                      activeColor: Colors.blueAccent,
                      inactiveThumbColor: textColor,
                      inactiveTrackColor: Colors.white,
                      onChanged: (value) {
                        
                        setState(() {
                          light = value;
                          changeColor();
                          
                        });
                      },
                    ),
                ),
                
              ],
            ),
            Divider(height: Checkbox.width,thickness: 2,color: textColor.withOpacity(0.2),),
          ],
        ),
      ),
    );

  }
}