import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

Color colour = Colors.white;
Color textColor = Colors.black;
bool light = true;
String themeAppText = 'Enable Dark Mode';
Color appBarTheme =  Color.fromARGB(255, 40, 69, 84);
IconData themeIconn = Icons.mode_night;
Color colorofIcon = Colors.white;
changeColor(){
  if (light == false) {
    colour = Colors.black;
    textColor = Colors.white;
themeAppText = 'Enable Day Mode';
themeIconn = Icons.mode_night_sharp;
colorofIcon = Colors.white;
  }
  else if (light == true)
  {colour = Colors.white;
  textColor = Colors.black;
  themeAppText = 'Enable Dark Mode';
  themeIconn = Icons.sunny;
  colorofIcon = Colors.black;
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
                 Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0,0,0),
                  child: changedIcon(themeIcon: themeIconn,colorIcon: colorofIcon,),
                  
                ),
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

class changedIcon extends StatelessWidget {
 
 changedIcon({required this.themeIcon,required this.colorIcon});
final Color colorIcon;
final IconData themeIcon;
  @override
  Widget build(BuildContext context) {
    return Icon(themeIcon,color: colorIcon,);
  }
}