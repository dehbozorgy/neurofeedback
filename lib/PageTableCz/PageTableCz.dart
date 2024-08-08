import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '/Component/MessageError.dart';
import '/ModelDataBase/TableCz.dart';
import 'Component/CartTableCz.dart';
import 'PannelCzCalculate/PannelCzCalculate.dart';
import '../ModelDataBase/TableUser.dart';
import 'Component/PannelTableCzSave.dart';
import '/Funcs.dart';
import '/DataBase.dart';
import '/Constant.dart';
import '/Component/PageTableCalculate.dart';

class PageTableCz extends StatefulWidget {

  final TableUser data;

  const PageTableCz({super.key,required this.data});

  @override
  State<PageTableCz> createState() => _PageTableCzState();
}

class _PageTableCzState extends State<PageTableCz> {

  Future<List<TableCz>> _getData() async {
    print(' ===========>>>>>>>>>>>>>>>>> getData TableCz');
    return (await GetUserByUser(widget.data)).ListTableCz;
  }

  List<int> SelectedItems = [];

  bool select_status = false;

  FuncSelect(int index){

    if(SelectedItems.contains(index)){
      SelectedItems.remove(index);
      if(SelectedItems.isEmpty)
        select_status = false;
    }
    else{
      SelectedItems.add(index);
      if(!select_status)
        select_status = true;
    }

    setState(() {});

  }

  Pop(bool didPop) async {

    print('didPop =========>>>>>>> $didPop');

    if(!didPop){

      setState(() {
        select_status = false;
        SelectedItems.clear();
      });

    }

  }

  openForEdit(TableCz OldTableCz,int index) async {

    TableCz? NewtableCz = await showMessageBoxByShrink(context, PannelTableCzSave(data: OldTableCz));

    if(NewtableCz!=null && NewtableCz!=OldTableCz){

      int IndexUser = await GetIndexUser(widget.data);

      TableUser OldTableUser = await GetUserByUser(widget.data);

      OldTableUser.ListTableCz.removeAt(index);

      OldTableUser.ListTableCz.insert(index, NewtableCz);

      await UpdateUser(IndexUser, OldTableUser);

      setState(() {});

    }

  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !select_status && SelectedItems.isEmpty,
      onPopInvoked: Pop,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Stack(
          clipBehavior: Clip.hardEdge,
          children: [

            Positioned(
              top: (-0.87.sw) + StatusBar,
              left: -0.25.sw,
              right: -0.25.sw,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 1.5.sw,
                  height: 1.0.sw,
                  decoration: BoxDecoration(
                      color: Color(0xFFADEBAD),
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(1.5.sw, 1.0.sw)
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 5,
                            spreadRadius: 0
                        )
                      ]
                  ),
                ),
              ),
            ),

            Column(

              mainAxisSize: MainAxisSize.max,

              children: [

                SizedBox(
                  height: StatusBar,
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox.expand()
                  ),
                ),

                Hero(
                  tag: 'Cz',
                  child: Container(
                    width: 0.25.sw,
                    height: 0.25.sw,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFADEBAD),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                              spreadRadius: 0,
                              blurStyle: BlurStyle.outer
                          )
                        ]
                    ),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: DefaultTextStyle(
                        child: Text('Cz'),
                        style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 100.sp,
                              color: Colors.black,
                              shadows: [
                                Shadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(10, 10)
                                )
                              ]
                          )
                      ),
                    ),

                  ),
                ),

                SizedBox(height: 7.h),

                Expanded(
                  child: Stack(
                    children: [

                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: FutureBuilder(
                              future: _getData(),
                              builder: (context,snapshot){
                                if(snapshot.hasData){
                                  return ListView.builder(
                                    padding: EdgeInsets.only(
                                        bottom: 50.h
                                    ),
                                    physics: BouncingScrollPhysics(),
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context,index){
                                      return AnimationConfiguration.staggeredList(
                                        position: index,
                                        duration: 300.ms,
                                        delay: 150.ms,
                                        child: ScaleAnimation(
                                          scale: 0.5,
                                          child: FadeInAnimation(
                                            child: GestureDetector(
                                              onTap: select_status ?
                                              (){

                                                FuncSelect(index);

                                              } :
                                              () async {

                                                openForEdit(snapshot.data!.elementAt(index),index);

                                              },

                                              onLongPress: () {

                                                 FuncSelect(index);

                                              },

                                              child: CartTableCz(data: snapshot.data!.elementAt(index),Selected: SelectedItems.contains(index))
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                                else if(snapshot.hasError){
                                  Text(snapshot.error.toString());
                                }
                                return SizedBox(
                                  width: 50,height: 50,
                                    child: CircularProgressIndicator(color: Colors.indigo,strokeWidth: 5));
                              }
                          ),
                        ),
                      ),

                      Positioned.fill(
                        bottom: 5.h,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: select_status ?
                            FractionallySizedBox(
                              widthFactor: 0.9,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {

                                     String? res = await showMessageBox(context, MessageError(Message: 'از حذف ردیفهای انتخابی مطمعن هستید ؟'));

                                     if(res==null || res=='cancel')
                                       return;

                                      TableUser OldUser = await GetUserByUser(widget.data);

                                      int indexUser = await GetIndexUser(widget.data);

                                      print('Befor SelectedItems  =========>>>>>>>>>> ${SelectedItems.toString()}');

                                      SelectedItems.sort((a,b) => -(a.compareTo(b)));

                                      print('After SelectedItems  =========>>>>>>>>>> ${SelectedItems.toString()}');

                                      for(int index in SelectedItems){
                                        OldUser.ListTableCz.removeAt(index);
                                      }

                                      SelectedItems.clear();
                                      select_status = false;

                                      await UpdateUser(indexUser, OldUser);

                                      setState(() {});

                                    },
                                    child: Icon(Icons.delete_sweep,color: Colors.black),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                      fixedSize: MaterialStateProperty.all(Size.fromWidth(0.4.sw)),
                                      surfaceTintColor: MaterialStateColor.resolveWith((states) => Colors.white),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {

                                      TableUser user = await GetUserByUser(widget.data);

                                       showMessageBox(context, PageTableCalculate(
                                         ListPannelCalculate: SelectedItems.map((e) => PannelCzCalculate(data: user.ListTableCz.elementAt(e))).toList()
                                       ));

                                    },
                                    child: Text('محاسبه',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.lightBlue),
                                      fixedSize: MaterialStateProperty.all(Size.fromWidth(0.4.sw)),
                                      surfaceTintColor: MaterialStateColor.resolveWith((states) => Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ) :
                            ElevatedButton(
                              onPressed: () async {

                                TableCz? tableCz = await showMessageBoxByShrink(context, PannelTableCzSave());

                                if(tableCz!=null){

                                  TableUser OldUser = await GetUserByUser(widget.data);

                                  OldUser.ListTableCz.add(tableCz);

                                  int index1 = await GetIndexUser(widget.data);

                                  await UpdateUser(index1, OldUser);

                                  setState(() {});

                                }

                              },
                              child: Icon(Icons.add,color: Colors.black),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green),
                                fixedSize: MaterialStateProperty.all(Size.fromWidth(0.8.sw)),
                                surfaceTintColor: MaterialStateColor.resolveWith((states) => Colors.white),
                              ),
                            ),
                          )
                      )

                    ],
                  ),
                ),

              ],

            )

          ],
        ),
      ),
    );
  }

}
