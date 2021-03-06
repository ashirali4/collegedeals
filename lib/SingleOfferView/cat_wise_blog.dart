

import 'package:carousel_pro/carousel_pro.dart';
import 'package:collegedeals/APIModels/Fetch_Blog_Post.dart';
import 'package:collegedeals/APIcalls.dart';
import 'package:collegedeals/SVGicons/SVGiconclass.dart';
import 'package:collegedeals/components/Loader.dart';
import 'package:flutter/material.dart';
import 'package:collegedeals/APIModels/Blog_Sender.dart';
import 'package:collegedeals/APIModels/Fetch_Blog_Categoires.dart';

class Cate_Wise_Blog extends StatefulWidget {
  String id;
  @override
  _Favourite_ScreenState createState() => _Favourite_ScreenState();
  Cate_Wise_Blog(this.id);
}

class _Favourite_ScreenState extends State<Cate_Wise_Blog> {
  Future<FetchBlogPost> fetchblogpost;
  Future<BlogMainCategoires> fetchcat;

  MyApi myapi=new MyApi();
  @override
  Widget build(BuildContext context) {
    fetchblogpost=myapi.catewisefetch(widget.id);
    fetchcat=myapi.fetblogcate();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Center(
                  child: Container(

                    width: 170,
                    height: 50,
                    child: Image.asset("assets/collegedealslogo.png"
                    ),
                  ),
                ),
                SizedBox(height: 10,),


                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Blog',
                      style: TextStyle(
                        color: Color(0xff1D262C),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.start,),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                      height: 1000,
                      child: FutureBuilder<FetchBlogPost>(
                        future: fetchblogpost, // a Future<String> or null
                        builder: (BuildContext context, AsyncSnapshot<FetchBlogPost> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none: return new Text('Press button to start');
                            case ConnectionState.waiting: return Loader();
                            default:
                              if (snapshot.hasError)
                                return new Text('Error: ${snapshot.error}');
                              else
                                return ListView.builder(
                                  itemCount: snapshot.data.response.length,
                                  itemBuilder: (BuildContext ctxt, int index) {

                                    return InkWell(
                                        onTap: (){
                                          Blog_Sender sender=new Blog_Sender(
                                              snapshot.data.response[index].title,
                                              snapshot.data.response[index].content,
                                              snapshot.data.response[index].postedBy,
                                              snapshot.data.response[index].featuredImage
                                          );
                                          Navigator.pushNamed(context, "viewblog",arguments: sender);
                                        },
                                        child: list(snapshot.data,index));
                                  },

                                );
                          }
                        },
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget list(FetchBlogPost obj,int index){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 05,right: 05,top: 05),
          child: Container(
            width: MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),

              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color(0XffEAECF3),
                    blurRadius: 4.0,
                    offset: Offset(0.0, 0.75)
                )
              ],

              color: Colors.white,),

            child: Card(
              elevation:0.0,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),

              child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child:Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                image:  NetworkImage('https://collegedeals.in/site_assets/blog_post_imgs/'+obj.response[index].featuredImage),
                                fit: BoxFit.cover,
                              )

                          ),

                        ),
                      ),
                      Expanded(
                          flex: 20,
                          child:Padding(
                            padding: const EdgeInsets.only(left:15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(obj.response[index].title,
                                  style: TextStyle(
                                    color: Color(0xff1D262C),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 3,),
                                SizedBox(height: 05,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Container(
                                        height: 25.0,

                                        color: Color(0xff36845B).withOpacity(.6),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 3,right: 3),
                                          child: Center(
                                            child: Center(
                                              child: Text(obj.response[index].postedBy,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,

                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),

                              ],
                            ),
                          )
                      ),

                    ],
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget categorieslist(BlogMainCategoires data,int index){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            child: MaterialButton(
              onPressed: () {},
              textColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network('https://collegedeals.in/site_assets/blog_main_cat_imgs/'+data.response[index].image),
              ),
              padding: EdgeInsets.all(10),
              shape: CircleBorder(),
            ),
          ),
          SizedBox(height: 04,),
          Text(data.response[index].name,
            style: TextStyle(
              color: Color(0xff1D262C),
              fontSize: 12,

              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
