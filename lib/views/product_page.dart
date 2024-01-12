import 'package:decoration_plants_ui/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

class ProductPage extends StatefulWidget {
   ProductPage({super.key, required this.image, required this.name, required this.price,required this.numbersOfProduct});
   final String? image;
   final String? name;
   final int? price;
    int numbersOfProduct;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<String> sizes=[
    'M','L','XL'
  ] ;

  @override
  Widget build(BuildContext context) {
    //final cart=Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xff166A0C),
      body: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(

                  bottom: -MediaQuery.of(context).size.height *.1,
                  left: MediaQuery.of(context).size.width * .3,
                  child: ClipPath(
                    //clipBehavior: Clip.none,
                    clipper: ContainerClipperCounter(),
                    child: Container(
                      padding: EdgeInsets.only(top: 50).w,
                      height: MediaQuery.of(context).size.height *.2,
                      width: MediaQuery.of(context).size.height * .2,
                      color: Color(0xff91D489),
                      child: Center(
                        child:Text('X${widget.numbersOfProduct}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 30

                          ),),),

                    ),
                  ),
                ),
                ClipPath(
                  //clipBehavior: Clip.none,
                  clipper: ContainerClipper3(),
                  child: Container(
                    width: MediaQuery.of(context).size.width *1.1,
                    height: MediaQuery.of(context).size.height *.70,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Spacer(flex: 1,),
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: sizes.length,
                                          itemBuilder: (context,index){
                                            return Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: CircleAvatar(
                                                radius: 17,
                                                backgroundColor: Color(0xff8ED486),
                                                child: Text(sizes[index],style: TextStyle(
                                                    color: Colors.black,
                                                  fontSize: 13.sp,
                                                ),),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children:[
                                        Image.asset(widget.image.toString(),
                                          width: MediaQuery.of(context).size.width *.8,
                                          //fit: BoxFit.fill,

                                        ),
                                        CircleAvatar(
                                          backgroundColor: Color(0xff73A96D),
                                          child: IconButton(
                                            onPressed: () {  },
                                            icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),

                                          ),
                                        )
                                      ]),
                                ),
                              ),
                              Spacer(flex: 1,)
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(widget.name.toString(),style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp
                            ),),
                            Text('BIRD OF PARADISE',style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.sp
                              //fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: MediaQuery.of(context).size.height /45,),
                            Text('€${widget.price}',style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,fontSize: 25.sp
                            ),),
                            SizedBox(height: MediaQuery.of(context).size.height /30,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipPath(
                  clipper: ContainerClipper1(),
                  child: Container(
                    padding: EdgeInsets.only(right: 50).w,
                    height: MediaQuery.of(context).size.height *.15,
                    width: MediaQuery.of(context).size.width * .25,

                    color: Colors.white,
                    child: Center(child: IconButton(onPressed: () {  }, icon: Icon(Icons.person,size: 25.sp,)),),
                  ),
                ),
                ClipPath(
                  clipper: ContainerClipper2(),
                  child: Container(
                      padding: EdgeInsets.only(left: 40).w,
                      height: MediaQuery.of(context).size.height *.16,
                      width: MediaQuery.of(context).size.width * .25,
                      color: Colors.white,
                      child: Center(child: IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: Icon(Icons.home,size: 25.sp,)),)
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    widget.numbersOfProduct ++;

                  });

                }, icon: Icon(Icons.add,size: 40,)),
                IconButton(onPressed: (){


                  if (widget.numbersOfProduct >= 1) {
                    setState(() {
                      widget.numbersOfProduct --;
                    });
                  }
                }, icon: Icon(Icons.remove,size: 40,)),

              ],
            )

          ]
      ),


    );
  }
}
class ContainerClipper3 extends CustomClipper<Path> {
  //var path = Path();
  Path getClip(Size size) {

    Path path_0 = Path();
    path_0.moveTo(0,size.height*-0.0006990);
    path_0.quadraticBezierTo(size.width*0.0000125,size.height*0.5447250,size.width*0.0050000,size.height*0.6954125);
    path_0.cubicTo(size.width*0.2136000,size.height*1.0917125,size.width*0.7321250,size.height*1.1039250,size.width*0.9957250,size.height*0.6873125);
    path_0.quadraticBezierTo(size.width*0.9969625,size.height*0.4829250,size.width*1.0007250,size.height*0.0024500);
    path_0.lineTo(0,size.height*-0.0006990);
    path_0.close();
    // size.width*0.1275000


    return path_0;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
class ContainerClipperCounter extends CustomClipper<Path> {
  //var path = Path();
  Path getClip(Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.1719876,size.height*-0.0049274);
    path_0.lineTo(size.width*0.7775816,size.height*-0.0179200);
    path_0.quadraticBezierTo(size.width*1.3175700,size.height*1.2448748,size.width*0.4865207,size.height*0.9216746);
    path_0.quadraticBezierTo(size.width*-0.2740782,size.height*1.2360658,size.width*0.1719876,size.height*-0.0049274);
    path_0.close();






    return path_0;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
