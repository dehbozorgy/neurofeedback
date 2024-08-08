import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:neurofeedback/ModelDataBase/TableF3.dart';
import 'package:neurofeedback/PageTableF3/Component/CartTableF3.dart';
import 'package:neurofeedback/PageTableF3/Component/PannelTableF3Save.dart';
import '../Component/MessageError.dart';
import '../Component/PageTableCalculate.dart';
import '../DataBase.dart';
import '../Funcs.dart';
import '../ModelDataBase/TableUser.dart';
import '/Constant.dart';
import 'PannelF3Calculate/PannelF3Calculate.dart';

class PageTableF3 extends StatefulWidget {

  final TableUser data;

  final List<int> SelectedItems;

  const PageTableF3({super.key,required this.data,required this.SelectedItems});

  @override
  State<PageTableF3> createState() => _PageTableF3State();
}

class _PageTableF3State extends State<PageTableF3> {

  Future<List<TableF3>> _getData() async {
    print(' ===========>>>>>>>>>>>>>>>>> getData TableO1');
    return (await GetUserByUser(widget.data)).ListTableF3;
  }

  late bool select_status;

  initState(){

    select_status = !(widget.SelectedItems.isEmpty);

    super.initState();
  }

  FuncSelect(int index){

    if(widget.SelectedItems.contains(index)){
      widget.SelectedItems.remove(index);
      if(widget.SelectedItems.isEmpty)
        select_status = false;
    }
    else{
      widget.SelectedItems.add(index);
      if(!select_status)
        select_status = true;
    }

    setState(() {});

  }

  openForEdit(TableF3 OldTableF3,int index) async {

    TableF3? NewtableF3 = await showMessageBoxByShrink(context, PannelTableF3Save(data: OldTableF3));

    if(NewtableF3!=null && NewtableF3!=OldTableF3){

      int IndexUser = await GetIndexUser(widget.data);

      TableUser OldTableUser = await GetUserByUser(widget.data);

      OldTableUser.ListTableF3.removeAt(index);

      OldTableUser.ListTableF3.insert(index, NewtableF3);

      await UpdateUser(IndexUser, OldTableUser);

      setState(() {});

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: Color(0XFFFF66B3),
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
                tag: 'F3',
                child: Container(
                  width: 0.25.sw,
                  height: 0.25.sw,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFFFF66B3),
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
                        child: Text('F3'),
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

                                              child: CartTableF3(data: snapshot.data!.elementAt(index),Selected: widget.SelectedItems.contains(index))
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

                                    print('Befor SelectedItems  =========>>>>>>>>>> ${widget.SelectedItems.toString()}');

                                    widget.SelectedItems.sort((a,b) => -(a.compareTo(b)));

                                    print('After SelectedItems  =========>>>>>>>>>> ${widget.SelectedItems.toString()}');

                                    for(int index in widget.SelectedItems){
                                      OldUser.ListTableF3.removeAt(index);
                                    }

                                    widget.SelectedItems.clear();
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
                                        ListPannelCalculate: widget.SelectedItems.map((e) => PannelF3Calculate(data: user.ListTableF3.elementAt(e))).toList()
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

                              TableF3? tableF3 = await showMessageBoxByShrink(context, PannelTableF3Save());

                              if(tableF3!=null){

                                TableUser OldUser = await GetUserByUser(widget.data);

                                OldUser.ListTableF3.add(tableF3);

                                int index1 = await GetIndexUser(widget.data);

                                await UpdateUser(index1, OldUser);

                                setState(() {});

                              }

                            },
                            child: Icon(Icons.add,color: Colors.black),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.pink),
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
    );
  }

}
