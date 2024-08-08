import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../PageTableF3/PageTableF3.dart';
import '../PageTableF4/PageTableF4.dart';
import '../PageTableFz/PageTableFz.dart';
import '../PageTableO1/PageTableO1.dart';
import '/ModelDataBase/TableUser.dart';
import '/PageTableCz/PageTableCz.dart';
import 'Component//MenuButton.dart';

import 'Component/LabelDate.dart';

class PagePaient extends StatefulWidget {

  final TableUser data;

  const PagePaient({super.key,required this.data});

  @override
  State<PagePaient> createState() => _PagePaientState();
}

class _PagePaientState extends State<PagePaient> {

  double get _heightStatusBar => MediaQuery.of(context).viewPadding.top;

  List<int> SelectedItemsF3 = [];

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
            top: -0.5.sw,
            left: -0.25.sw,
            right: -0.25.sw,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 1.5.sw,
                height: 1.0.sw,
                decoration: BoxDecoration(
                    color: Color(0xff43c79f),
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
            children: [

              SizedBox(
                height: 0.5.sw - (0.3.sw/2),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10,vertical: 5
                    ),
                    margin: EdgeInsets.only(
                        top: _heightStatusBar,
                        left: 10.w,
                        right: 10.w
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2)
                    ),
                    child: Text('${widget.data.name} ${widget.data.family}',
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                width: 0.3.sw,
                height: 0.3.sw,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.8),
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
                    child: Hero(
                      tag: widget.data,
                      child: Image.asset( widget.data.gender ? 'assets/png/man.png' : 'assets/png/woman.png')),
                ),

              ),

              SizedBox(height: 7),

              LabelDate(data: widget.data),

              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>PageTableCz(data: widget.data)));
                              },
                              child: MenuButton(Title: 'Cz',BgColor: Color(0xFFADEBAD))
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>PageTableO1(data: widget.data)));
                              },
                              child: MenuButton(Title: 'O1',BgColor: Color(0XFFFFFF99))
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>PageTableF3(data: widget.data,SelectedItems: SelectedItemsF3)));
                              },
                              child: MenuButton(Title: 'F3',BgColor: Color(0XFFFF66B3))
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>PageTableF4(data: widget.data,SelectedItemsF3: SelectedItemsF3)));
                              },
                              child: MenuButton(Title: 'F4',BgColor: Color(0XFF99C2FF))
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>PageTableFz(data: widget.data)));
                              },
                              child: MenuButton(Title: 'Fz',BgColor: Color(0XFFE699FF))
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }

}


//child: Wrap(
//   spacing: 15.w,
//   runSpacing: 50.h,
//   alignment: WrapAlignment.spaceAround,
//   runAlignment: WrapAlignment.spaceEvenly,
//   children: [
//     GestureDetector(
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>TableCz()));
//       },
//         child: MenuButton(Title: 'Cz',BgColor: Color(0xFFADEBAD))
//     ),
//     GestureDetector(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>TableO1()));
//         },
//         child: MenuButton(Title: 'O1',BgColor: Color(0XFFFFFF99))
//     ),
//     GestureDetector(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>TableF3()));
//         },
//         child: MenuButton(Title: 'F3',BgColor: Color(0XFFFF66B3))
//     ),
//     GestureDetector(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>TableF4()));
//         },
//         child: MenuButton(Title: 'F4',BgColor: Color(0XFF99C2FF))
//     ),
//     GestureDetector(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>TableFz()));
//         },
//         child: MenuButton(Title: 'Fz',BgColor: Color(0XFFE699FF))
//     ),
//   ],
// ),


// child: GridView.count(
//   crossAxisCount: 3,
//   mainAxisSpacing: 50.h,
//   crossAxisSpacing: 15.w,
//   childAspectRatio: 1.0,
//   padding: EdgeInsets.zero,
//
//   physics: NeverScrollableScrollPhysics(),
//   shrinkWrap: true,
//   children: [
//
//     MenuButton(Title: 'Cz',BgColor: Color(0xFFADEBAD)),
//     MenuButton(Title: 'O1',BgColor: Color(0XFFFFFF99)),
//     MenuButton(Title: 'F3',BgColor: Color(0XFFFF66B3)),
//     MenuButton(Title: 'F4',BgColor: Color(0XFF99C2FF)),
//     MenuButton(Title: 'Fz',BgColor: Color(0XFFE699FF)),
//
//   ],
// ),


//////////////////////////////////////////////////////////////////////////////////


// child: Column(
//   mainAxisSize: MainAxisSize.min,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Row(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         MenuButton(Title: 'Cz',BgColor: Color(0xFFADEBAD)),
//         MenuButton(Title: 'O1',BgColor: Color(0XFFFFFF99)),
//         MenuButton(Title: 'F3',BgColor: Color(0XFFFF66B3)),
//       ],
//     ),
//     SizedBox(height: 50.h),
//     Row(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         MenuButton(Title: 'F4',BgColor: Color(0XFF99C2FF)),
//         MenuButton(Title: 'Fz',BgColor: Color(0XFFE699FF)),
//       ],
//     ),
//   ],
// )

