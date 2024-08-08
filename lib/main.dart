import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive_flutter/adapters.dart';
import 'CartPatient.dart';
import 'ModelDataBase/TableCz.dart';
import 'ModelDataBase/TableF3.dart';
import 'ModelDataBase/TableF4.dart';
import 'ModelDataBase/TableFz.dart';
import 'ModelDataBase/TableO1.dart';
import 'ModelDataBase/TableUser.dart';
import 'Funcs.dart';
import 'DataBase.dart';
import 'PagePaient/Component/PannelUserSave.dart';

void main() async {

  await ScreenUtil.ensureScreenSize();

  await Hive
    ..initFlutter()
    ..registerAdapter(TableCzAdapter())
    ..registerAdapter(TableO1Adapter())
    ..registerAdapter(TableF3Adapter())
    ..registerAdapter(TableF4Adapter())
    ..registerAdapter(TableFzAdapter())
    ..registerAdapter(TableUserAdapter())
  ;

  runApp(const MyApp());
}

class MyCustomScollBehavior extends MaterialScrollBehavior{

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scrollBehavior: MyCustomScollBehavior(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
        fontFamily: 'Sans'
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Size get _size => MediaQuery.of(context).size;

  // OutlinedButton(
  //     onPressed: (){},
  //     child: Icon(Icons.remove,color: Colors.red),
  //     style: ButtonStyle(
  //       fixedSize: MaterialStateProperty.all(Size.fromWidth(0.8.sw)),
  //       side: MaterialStateProperty.all(BorderSide(color: Colors.red)),
  //       overlayColor: MaterialStatePropertyAll(Colors.red.withOpacity(0.1)),
  //     )
  // )

  @override
  void initState() {



    // TODO: implement initState
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Builder(builder: (context) {
            ScreenUtil.init(context, designSize: const Size(360, 690));
            return Stack(
              fit: StackFit.expand,
              children: [

                Center(
                  child: FutureBuilder(
                      future: GetAllUser,
                      builder: (context,snapshot){
                        if(snapshot.hasData){
                          return ListView(
                            padding: EdgeInsets.only(
                              top: 10.h,
                              bottom: 50.h
                            ),
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),

                            // children: [
                            //
                            //   for(TableUser data in snapshot.data!.reversed)
                            //     GestureDetector(
                            //       onTap: () async {
                            //
                            //         TableUser OldData = data;
                            //
                            //         TableUser? NewData = await showMessageBox(context, PannelUserSave(data: OldData));
                            //
                            //         if(NewData!=null && NewData != OldData){
                            //           int index = await GetIndexUser(OldData);
                            //           await UpdateUser(index, NewData);
                            //           setState(() {});
                            //         }
                            //
                            //       },
                            //         child: CartPatient(data: data)
                            //     )
                            //
                            //  ],

                            children: AnimationConfiguration.toStaggeredList(
                                duration: 300.ms,
                                delay: 150.ms,
                                childAnimationBuilder: (widget) => SlideAnimation(
                                  verticalOffset: -50.h,
                                  child: FadeInAnimation(child: widget),
                                ),
                                children: [

                                  for(TableUser data in snapshot.data!)
                                    GestureDetector(
                                        onTap: () async {

                                          TableUser OldData = data;

                                          TableUser? NewData = await showMessageBoxByShrink(context, PannelUserSave(data: OldData));

                                          if(NewData!=null && NewData != OldData){
                                            int index = await GetIndexUser(OldData);
                                            await UpdateUser(index, NewData);
                                            setState(() {});
                                          }

                                        },
                                        child: CartPatient(data: data)
                                    )

                                ]
                            ),

                            );
                        }
                        else if(snapshot.hasError){
                          return Text(snapshot.error.toString());
                        }
                        return SizedBox(
                          width: 50.w,
                            height: 50.w,
                            child: CircularProgressIndicator(color: Colors.indigo,strokeWidth: 5));
                      }
                  ),
                ),

                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.h
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () async {

                          TableUser? data = await showMessageBoxByShrink(context, PannelUserSave(data: null));

                          if(data != null){

                            await SaveUser(data);

                            setState(() {});

                          }

                        },
                        child: Icon(Icons.add,color: Colors.white),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green),
                          fixedSize: MaterialStateProperty.all(Size.fromWidth(0.8.sw)),
                          surfaceTintColor: MaterialStateColor.resolveWith((states) => Colors.white),
                          // overlayColor: MaterialStateColor.resolveWith((states) => Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            );
          }),
        ),
      ),
    );
  }
}
