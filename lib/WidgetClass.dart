import 'package:flutter/material.dart';
//color theme
Color p4 = Color.fromRGBO(4, 76, 146, 1.0);
Color p3 = Color.fromRGBO(4, 84, 158, 1.0);
Color p2 = Color.fromRGBO(4, 88, 166, 1.0);
Color p1 = Color.fromRGBO(61, 128, 191, 1.0);
Color sc_oran = Color.fromRGBO(242, 103, 29, 1.0);
Color sc_brow = Color.fromRGBO(166, 65, 12, 1.0);
Color sc_yell = Color.fromRGBO(242, 204, 29, 1.0);
Color sc_dyel = Color.fromRGBO(166, 138, 12, 1.0);
Color gpt_color_gre = Color.fromRGBO(109, 179, 191, 1.0);
Color b = Colors.black;
Color g = Colors.grey;
Color w = Colors.white;
Color wb = Color.fromRGBO(234, 243, 255, 1.0);
Color wg = Color.fromRGBO(217, 217, 217, 1.0);

Color txtcolor = Color.fromRGBO(153, 180, 251, 1.0);
Color checkcolor = Color.fromRGBO(115, 140, 205, 1.0);
Color baccoloru = Color.fromRGBO(238, 247, 254, 1.0);
Color baccolord = Color.fromRGBO(236, 237, 255, 1.0);



Map<int,Color>themeColor= {
  1:Color.fromRGBO(4, 76, 146, 1.0)
};
MaterialColor ThemeColor = MaterialColor(1, themeColor);


//手機RWD(only手機)
double RWDheight = 0;//螢幕高度
double RWDwidth = 0;//螢幕寬度
double RWDtxt = 0;//系統字級大小



//Text widget class
Widget h1txt(String str,{Color c = Colors.black}){
  return txt(str,s: 96,col: c,fontFam: "NotoSansTC-Light");
}

Widget h2txt(String str,{Color c = Colors.black}){
  return txt(str,s: 60,col: c,fontFam: "NotoSansTC-Light");
}

Widget h3txt(String str,{Color c = Colors.black}){
  return txt(str,s: 48,col: c,fontFam: "NotoSansTC-Regular");
}

Widget h4txt(String str,{Color c = Colors.black}){
  return txt(str,s: 34,col: c,fontFam: "NotoSansTC-Regular");
}

Widget h5txt(String str,{Color c = Colors.black}){
  return txt(str,s: 24,col: c,fontFam: "NotoSansTC-Regular");
}

Widget h6txt(String str,{Color c = Colors.black}){
  return txt(str,s: 20,col: c,fontFam: "NotoSansTC-Medium");
}

Widget subTitle1txt(String str,{Color c = Colors.black}){
  return txt(str,s: 16,col: c,fontFam: "NotoSansTC-Regular");
}

Widget subTitle2txt(String str,{Color c = Colors.black}){
  return txt(str,s: 14,col: c,fontFam: "NotoSansTC-Medium");
}

Widget body1txt(String str,{Color c = Colors.black}){
  return txt(str,s: 16,col: c,fontFam: "NotoSansTC-Regular");
}

Widget body2txt(String str,{Color c = Colors.black}){
  return txt(str,s: 14,col: c,fontFam: "NotoSansTC-Regular");
}


Widget txt(String str,{double s = 14,Color col = Colors.black,String fontFam = 'NotoSansTC-Regular'}){
  return Text(
    str,
    style: TextStyle(fontSize: s,color: col,fontFamily: fontFam),
  );
}

//Widget class
Widget space({double w = 10.0,double h = 10.0}){
  return Container(
    width: w,
    height: h,
  );
}

Widget underscore({double h = 0.5,Color lineC = Colors.black}){
  return Container(
    height: h,
    color: lineC,
  );
}

Widget betweenscore({double w = 0.5,Color lineC = Colors.black}){
  return Container(
    width: w,
    color: lineC,
  );
}

Widget cont(Widget wid,{Color c = Colors.transparent}){
  return Container(child: wid);
}

Widget contSize(Widget wid,double h,double w, {Color c = Colors.transparent, double mt = 0.0,double mb = 0.0,double ml = 0.0,double mr = 0.0,})
{
  return Container(
    width: w,
    height: h,
    child: wid,
    color: c,
    margin: EdgeInsets.only(top: mt,bottom: mb,left: ml,right: mr),
  );
}

Widget btn(Widget txt,final VoidCallback func,{Color btnC = const Color.fromRGBO(4, 76, 146, 1.0),double w = 150,double h = 75}){
  return Container(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: btnC),
      onPressed: func,
      child: txt,
    ),width: w,height: h,
  );
}

Widget txtField(TextEditingController txtEdit,FocusNode focus,final VoidCallback func,Function Chanfunc(var str)){
  return TextField(
    controller: txtEdit,
    focusNode: focus,
    onChanged: Chanfunc,//(value){txtEdit.text = value;},
    onEditingComplete: func,
  );
}

Widget formField(TextEditingController txtEdit,FocusNode focus,final VoidCallback func){
  return TextFormField(
    focusNode: focus,
    style: TextStyle(
      fontFamily: "NotoSansTC-Regular",
      fontSize: 16,
      color: Colors.black,
    ),
    onEditingComplete: func,
    controller: txtEdit,
    keyboardType: TextInputType.text,
    autofocus: false,
    decoration: InputDecoration(
      contentPadding:EdgeInsets.all(10*RWDwidth),
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.black,width: 1.0)
      ),
      focusedBorder:OutlineInputBorder(
          borderRadius:BorderRadius.circular(5.0),
          borderSide:const BorderSide(color: Colors.black,width: 1.0)
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.black,width: 1.0)
      ),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.black,width: 1.0)
      ),
    ),
  );
}

Widget padd(Widget wid,{double t = 8.0,double b = 8.0,double l = 8.0,double r = 8.0,}){
  return Padding(padding: EdgeInsets.only(top: t,bottom: b,left: l,right: r),
      child: wid,
  );
}

Widget alig(Alignment ali,Widget wid){
  return Align(alignment: ali,child: wid,);
}

//未來drawer每頁自行客製化(暫定)
Widget drawer(String til,final VoidCallback func,Widget wid){
  return Drawer(
    backgroundColor: wb,
    child: SafeArea(top: true,
      child: col([
        contSize(
          row([
            padd(cont(Center(child: body1txt(til),))),
            IconButton(
                onPressed: func,
                icon: Icon(Icons.clear,color: Colors.white,))
          ],main: MainAxisAlignment.spaceBetween),30,30,
          c: p1,
        ),
        ex(
          wid
        ),
      ]),
    ),
  );
}
//未來drawer每頁自行客製化(暫定)

Widget ex(Widget wid,{int f = 1}){
  return Expanded(flex: f,child: wid);
}

//listview index繼承問題還沒想好所以也先客製化
Widget listv_b(int ic,Widget wid){
  return ListView.builder(
      itemCount: ic,
      itemBuilder: (BuildContext context,int index){
       if(ic > 1){
         return wid;
       }
       else{
         return space();
       }
      });
}
//listview index繼承問題還沒想好所以也先客製化


//row column
Widget row(List<Widget> rowchild,{MainAxisAlignment main = MainAxisAlignment.start,CrossAxisAlignment cross = CrossAxisAlignment.start}){
  return Row(
    mainAxisAlignment: main,
    crossAxisAlignment: cross,
    children: rowchild,
    mainAxisSize: MainAxisSize.min,
  );
}

Widget col(List<Widget> colchild,{MainAxisAlignment main = MainAxisAlignment.start,CrossAxisAlignment cross = CrossAxisAlignment.start}){
  return Column(
    mainAxisAlignment: main,
    crossAxisAlignment: cross,
    children: colchild,
  );
}

Widget list(List<Widget> listchild){
  return ListView(
    children: listchild,
  );
}

Widget dialog(String tilmsg,String canceltxt,String confirmtxt,final VoidCallback cancelfunc,final VoidCallback okfunc,{Color bC = Colors.white,String contmsg = ""}){
  return Dialog(
    child: contSize(col([
      Container(child: Center(child: h4txt("${tilmsg}",c: w)),color: p1),
      space(h: 30),
      cont(Center(child: h5txt("${contmsg}"))),
      space(h: 20),
      padd(Container(child: TextButton(onPressed: okfunc, child: body1txt(confirmtxt,c: w)),color: gpt_color_gre,height: 40,width: 260,),b: 0),
      padd(Container(child: TextButton(onPressed: cancelfunc, child: body1txt(canceltxt)),color: wg,height: 40,width: 260,)),
    ]), 250, 100),
  );
}

Future<void> p_goto(PageController p,int i){
  return p.animateToPage(i, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
}

Future<void> p_backto(PageController p,int i){
  return p.animateToPage(i, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
}

void focus(BuildContext context,var f){
  return FocusScope.of(context).requestFocus(f);
}

Widget ges(Widget w,VoidCallback func){
  return GestureDetector(
    onTap: func,
    child: w,
  );
}
