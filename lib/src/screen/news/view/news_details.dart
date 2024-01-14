import 'package:cached_network_image/cached_network_image.dart';
import 'package:careercraft/src/screen/news/view/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewsDetailsScreen extends StatefulWidget {
  final String newsImage,
      newsTitle,
      newsDate,
      author,
      description,
      content,
      source,
      uri;
  const NewsDetailsScreen(
      {super.key,
      required this.newsImage,
      required this.newsTitle,
      required this.newsDate,
      required this.author,
      required this.source,
      required this.description,
      required this.content,required this.uri});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

final format = DateFormat('MMMM dd yyyy');

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    DateTime dateTime = DateTime.parse(widget.newsDate);
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            height: height * .55,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: widget.newsImage,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          Container(
            height: height * .6,
            margin: EdgeInsets.only(top: height * .4),
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ListView(
              children: [
                Text(
                  widget.newsTitle,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.source,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    Text(
                      format.format(dateTime),
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .03,
                ),
                Text(
                  widget.description,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          Positioned(
           bottom: 55.h,
           left: 130.w,
            child: 
              InkWell(
                onTap: (){
                  Navigator.push(
                              (context),
                              MaterialPageRoute(
                                builder: (context) => ArticleWebView(
                                  url:widget.uri,
                                ),
                              ),
                            );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6.sp,horizontal: 10.w),
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20.r)),
                  child: Text("Read More",style: TextStyle(color: Colors.blue,fontSize: 16.h,fontWeight: FontWeight.w600,),)),
              ),
         
          )

        ],
      ),
    );
  }
}
