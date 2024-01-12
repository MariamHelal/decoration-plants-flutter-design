//import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/card_model.dart';
import 'product_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff166A0C),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Decorative flowers',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu_outlined,
                color: Colors.white,
              )),
        ],
      ),
      body: LayoutBuilder(
        builder: (context , constraints ) {
          if(constraints.maxWidth <600){
            return Column(children: [
              Expanded(
                flex: 8,
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ProductPage(
                              image: products[index].image.toString(),
                              name: products[index].productName.toString(),
                              price: products[index].price,
                              numbersOfProduct: products[index].numberOfProduct,
                            );
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10).w,
                          padding: EdgeInsets.only(top: 8, bottom: 16, left: 8).w,
                          height: MediaQuery.of(context).size.height * .13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30).w,
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                products[index].image.toString(),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 15.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 15.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 15.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 15.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                          size: 15.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      products[index].productName.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '€${products[index].price}',
                                      style: TextStyle(
                                          color: Color(0xff166A0C),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (products[index].numberOfProduct >= 1) {
                                              setState(() {
                                                products[index].numberOfProduct--;
                                              });
                                            }
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: Color(0xff8ED486),
                                            child: Icon(
                                              Icons.remove,
                                              size: 15.sp,
                                              color: Colors.black,
                                            ),
                                            radius: 10,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(horizontal: 5.0)
                                              .w,
                                          child: Text(
                                            'x${products[index].numberOfProduct}',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              products[index].numberOfProduct++;
                                            });
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: Color(0xff8ED486),
                                            child: Icon(
                                              Icons.add,
                                              size: 15.sp,
                                              color: Colors.black,
                                            ),
                                            radius: 10.r,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 16, right: 40, top: 4, bottom: 4)
                                    .w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30).r,
                                      bottomLeft: Radius.circular(30).r),
                                  color: Color(0xff91D489),
                                ),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                  size: 18.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                flex:3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipPath(
                      clipper: ContainerClipper1(),
                      child: Container(
                        padding: EdgeInsets.only(right: 50).w,
                        height: MediaQuery.of(context).size.height *.16,
                        width: MediaQuery.of(context).size.width * .25,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.only(
                        //     topRight: Radius.circular(100),
                        //     bottomRight: Radius.circular(100),
                        //
                        //   ),
                        color: Colors.white,
                        child: Center(child: IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_back_ios_rounded,size: 25.sp,)),),
                      ),
                    ),
                    ClipPath(
                      clipper: ContainerClipper2(),
                      child: Container(
                          padding: EdgeInsets.only(left: 40).w,
                          height: MediaQuery.of(context).size.height *.16,
                          width: MediaQuery.of(context).size.width * .25,
                          color: Colors.white,
                          child: Center(child: IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_forward_ios_rounded,size: 25.sp,)),)

                      ),
                    ),

                  ],
                ),
              )
            ]);
          }else{
            return Column(children: [
              Expanded(
                flex: 8,
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10).h,
                        padding: EdgeInsets.only(top: 8, bottom: 16, left: 8).h,
                        height: MediaQuery.of(context).size.width * .13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              products[index].image.toString(),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 15.sp,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 15.sp,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 15.sp,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 15.sp,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                        size: 15.sp,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    products[index].productName.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold, ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '€${products[index].price}',
                                    style: TextStyle(
                                        color: Color(0xff166A0C),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),

                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (products[index].numberOfProduct >= 1) {
                                      setState(() {
                                        products[index].numberOfProduct--;
                                      });
                                    }
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xff8ED486),
                                    child: Icon(
                                      Icons.remove,
                                      size: 15.sp,
                                      color: Colors.black,
                                    ),
                                    radius: 15.h,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0)
                                      .w,
                                  child: Text(
                                    'x${products[index].numberOfProduct}',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      products[index].numberOfProduct++;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xff8ED486),
                                    child: Icon(
                                      Icons.add,
                                      size: 15.sp,
                                      color: Colors.black,
                                    ),
                                    radius: 15.r,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 16, right: 40, top: 4, bottom: 4)
                                  .h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30).r,
                                    bottomLeft: Radius.circular(30).r),
                                color: Color(0xff91D489),
                              ),
                              child: Icon(
                                Icons.lock,
                                color: Colors.black,
                                size: 18.sp,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Expanded(
                flex:3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipPath(
                      clipper: ContainerClipper1(),
                      child: Container(
                        padding: EdgeInsets.only(right: 40).h,
                        height: MediaQuery.of(context).size.width *.16,
                        width: MediaQuery.of(context).size.height * .25,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.only(
                        //     topRight: Radius.circular(100),
                        //     bottomRight: Radius.circular(100),
                        //
                        //   ),
                        color: Colors.white,
                        child: Center(child: IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_back_ios_rounded,size: 25.sp,)),),
                      ),
                    ),
                    ClipPath(
                      clipper: ContainerClipper2(),
                      child: Container(
                          padding: EdgeInsets.only(left: 40).h,
                          height: MediaQuery.of(context).size.width *.16,
                          width: MediaQuery.of(context).size.height * .25,
                          color: Colors.white,
                          child: Center(child: IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_forward_ios_rounded,size: 25.sp,)),)

                      ),
                    ),

                  ],
                ),
              )
            ]);
          }

        },

      ),
    );
  }
}

class ContainerClipper1 extends CustomClipper<Path> {
  //var path = Path();
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width*-0.0005375,size.height*-0.0059584);
    path_0.cubicTo(size.width*0.0036500,size.height*0.4712869,size.width*0.0025375,size.height*0.5151194,size.width*-0.0029375,size.height*1.0083338);
    path_0.cubicTo(size.width*0.1583375,size.height*0.6138636,size.width*0.4658625,size.height*0.7704711,size.width*0.4663625,size.height*0.4930710);
    path_0.cubicTo(size.width*0.4659375,size.height*0.2166181,size.width*0.1577750,size.height*0.2898117,size.width*-0.0005375,size.height*-0.0059584);
    path_0.close();

    // path.lineTo(0, size.height);
    // path.quadraticBezierTo(size.width, size.height, size.width+5, size.height+5);
    // // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);

    return path_0;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
class ContainerClipper2 extends CustomClipper<Path> {
  var path = Path();
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width*1.0010625,size.height*1.0053200);
    path_0.cubicTo(size.width*0.9990125,size.height*0.5280400,size.width*1.0020500,size.height*0.4868800,size.width*0.9985238,size.height*-0.0089200);
    path_0.cubicTo(size.width*0.8329625,size.height*0.3623200,size.width*0.5205000,size.height*0.2340000,size.width*0.5053229,size.height*0.5007400);
    path_0.cubicTo(size.width*0.5044210,size.height*0.7772000,size.width*0.8627375,size.height*0.6571200,size.width*1.0010625,size.height*1.0053200);
    path_0.close();

    // path.lineTo(0, size.height);
    // path.quadraticBezierTo(size.width, size.height, size.width+5, size.height+5);
    // // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);

    return path_0;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
