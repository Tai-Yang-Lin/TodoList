import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grltest_app/WidgetClass.dart';
import 'package:grltest_app/dataClass.dart';
import 'package:flutter_switch/flutter_switch.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: checkcolor),
        useMaterial3: true,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(checkcolor), // 滾動條的顏色
          trackColor: MaterialStateProperty.all(Colors.grey), // 滾動軌道的顏色
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _txtcontroller = TextEditingController();
  final _txtcontroller_focusNode = FocusNode();
  int tfNo = 0;
  double percent = 0;
  int percentUI = 0;
  bool sortCheckList = false;
  DateTime now = DateTime.now();

  void addList(){
    setState(() {
      now = DateTime.now();
    });
    checkList.add(check()..title = "${_txtcontroller.text}"..time = now);
    _txtcontroller.text = "";
    setState(() {});
  }

  void percentInt(bool b){
    if(b == true){
      tfNo += 1;
    }
    else if(b == false){
      tfNo -= 1;
    }
    percent = tfNo/checkList.length*100;
    percentUI = percent.truncate();
    print(percentUI);

  }

  void sortList(bool b){
    if(b == true){
      checkList.sort((a, b) => a.TF ? 1 : -1);
    }
    else{
      checkList.sort((a, b) => a.time!.compareTo(b.time!));
    }

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [baccoloru, baccolord],
            ),
          ),
          child: padd(
            col([
              h3txt("Todo List",c: txtcolor),
              h6txt("add things to do",c: txtcolor),
              underscore(h: 3,lineC: txtcolor),
              space(),
              row([
                ex(body2txt("${percentUI}%",c: txtcolor),f: 1),
                ex(Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: row([
                    ex(Container(color: checkcolor,),f: percentUI),
                    ex(Container(color: w,),f: 100-percentUI),
                  ]),
                ),f: 9),

              ],cross: CrossAxisAlignment.center),

              (checkList.isEmpty)?ex(space(),f: 3):ex(Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                thickness: 8.0, // 滾動條的厚度
                radius: Radius.circular(10), // 滾動條的圓角
                interactive: true, // 啟用滾動條的互動
                child: ListView.builder(
                    itemCount: checkList.length,
                    itemBuilder: (BuildContext contextm,int i){
                      return col([
                        Container(
                          child: row([
                            Container(width: 10,height: 100,color: checkcolor,),
                            ex(Container(child: row([
                              Checkbox(
                                value: checkList[i].TF,
                                onChanged: (bool? value){
                                  percentInt(value!);
                                  setState(() {
                                    checkList[i].TF = value;
                                  });
                                },),
                              ex(Text("${checkList[i].title}",style: TextStyle(
                                decoration: checkList[i].TF ? TextDecoration.lineThrough : null,
                                decorationColor: Colors.grey,
                                color: checkList[i].TF ? Colors.grey:txtcolor,
                                fontSize: 20,
                                fontFamily: 'NotoSansTC-Regular',
                              ))),
                              IconButton(
                                  onPressed: (){
                                    checkList.remove(checkList[i]);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.clear)
                              )
                            ],cross: CrossAxisAlignment.center),)),
                          ],cross: CrossAxisAlignment.center),
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), // 設置圓角
                            color: w,
                          ),
                        ),
                        space()
                      ]);
                    }
                    ),
              )
              ,f: 3),

              underscore(h: 3,lineC: txtcolor),
              space(),
              alig(Alignment.centerRight, row([
                body2txt("Move done things to end",c: txtcolor),
                space(),
                FlutterSwitch(
                  width: 45,
                  height: 25,
                  toggleSize: 20.0,
                  activeColor: txtcolor,
                  inactiveColor: w,
                  inactiveToggleColor: txtcolor,
                  value: sortCheckList,
                  borderRadius: 20.0,
                  padding: 2.0,
                  showOnOff: false,//switch裡的字
                  onToggle: (val){
                    sortList(val);
                    setState(() {
                      sortCheckList = val;
                    });
                  },
                ),
              ],main: MainAxisAlignment.end,cross: CrossAxisAlignment.center)),
              ex(space(),f: 1),
              body2txt("Add to list",c: txtcolor),
              row([
                ex(Container(height:50,child: formField(_txtcontroller,_txtcontroller_focusNode,(){
                  addList();
                }))),
                space(w: 5),
                Container(
                  child: MaterialButton(
                    onPressed: (){
                      addList();
                    },
                    child: Icon(Icons.add,color: w,),
                  ),//
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), // 設置圓角
                    color: checkcolor,
                  ),
                ),
              ],cross: CrossAxisAlignment.center),


            ]),t: 10
          ),
        ),
      ),
    );
  }
}
