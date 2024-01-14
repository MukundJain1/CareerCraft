import 'package:cached_network_image/cached_network_image.dart';
import 'package:careercraft/src/screen/news/model/CategoriesNews.dart';
import 'package:careercraft/src/screen/news/model/NewsChannelHeadlines.dart';
import 'package:careercraft/src/screen/news/view/categories_screen.dart';
import 'package:careercraft/src/screen/news/view/news_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../newsViewRepo/NewsViewRepo.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

NewsViewRepo newsViewRepo = new NewsViewRepo();
FilterList? selectedMenu;
String name = 'bbc-news';

enum FilterList { bbcNews, aryNews, independent, reuters, cnn, alJazeera }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final format = DateFormat('MMMM dd yyyy');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategoriesScreen()));
          },
          icon: Image.asset('assets/icons/category_icon.png'),
        ),
        title: Text(
          'News',
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        actions: [
          PopupMenuButton(
              initialValue: selectedMenu,
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onSelected: (FilterList items) {
                if (FilterList.bbcNews.name == items.name) {
                  name = 'bbc-news';
                }
                if (FilterList.aryNews.name == items.name) {
                  name = 'ary-news';
                }
                if (FilterList.independent.name == items.name) {
                  name = 'independent';
                }
                if (FilterList.alJazeera.name == items.name) {
                  name = 'al-jazeera-english';
                }
                if (FilterList.reuters.name == items.name) {
                  name = 'reuters';
                }
                if (FilterList.cnn.name == items.name) {
                  name = 'cnn';
                }
                setState(() {
                  selectedMenu = items;
                });
              },
              itemBuilder: (context) => <PopupMenuEntry<FilterList>>[
                    PopupMenuItem<FilterList>(
                        value: FilterList.bbcNews, child: Text("BBC News")),
                    PopupMenuItem<FilterList>(
                        value: FilterList.aryNews, child: Text("Ary News")),
                    PopupMenuItem<FilterList>(
                        value: FilterList.cnn, child: Text("CNN News")),
                    PopupMenuItem<FilterList>(
                        value: FilterList.reuters, child: Text("Reuters News"))
                  ])
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // shrinkWrap: true,
          //       physics: NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: height * .55,
              width: width,
              child: FutureBuilder<NewsChannelHeadlines>(
                future: newsViewRepo.fetchNewsChannelHeadlines(name),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                        child: SpinKitCircle(
                      size: 50,
                      color: Colors.blue,
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.articles?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        DateTime dateTime = DateTime.parse(snapshot
                            .data!.articles![index].publishedAt
                            .toString());
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsDetailsScreen(
                                          newsImage: snapshot
                                              .data!.articles![index].urlToImage
                                              .toString(),
                                          newsTitle: snapshot
                                              .data!.articles![index].title
                                              .toString(),
                                          newsDate: snapshot
                                              .data!.articles![index].publishedAt
                                              .toString(),
                                          author: snapshot
                                              .data!.articles![index].author
                                              .toString(),
                                          source: snapshot
                                              .data!.articles![index].source!.name
                                              .toString(),
                                          description: snapshot
                                              .data!.articles![index].description
                                              .toString(),
                                          content: snapshot
                                              .data!.articles![index].content
                                              .toString(),
                                          uri: snapshot.data!.articles![index].url
                                              .toString(),
                                        )));
                          },
                          child: SizedBox(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: height * 0.6,
                                  width: width * 1,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: height * .02,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot
                                          .data!.articles![index].urlToImage
                                          .toString(),
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(
                                        child: spin,
                                      ),
                                      errorWidget: (context, url, error) => Icon(
                                        Icons.error_outline,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      alignment: Alignment.bottomCenter,
                                      height: height * .22,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: width * 0.7,
                                            child: Text(
                                              snapshot
                                                  .data!.articles![index].title
                                                  .toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: width * .7,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  snapshot.data!.articles![index]
                                                      .source!.name
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  format.format(dateTime),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            FutureBuilder<CategoriesNews>(
              future: newsViewRepo.fetchCategoriesNews('general'),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                      child: SpinKitCircle(
                    size: 50,
                    color: Colors.blue,
                  ));
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.articles?.length,
                    // shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      DateTime dateTime = DateTime.parse(
                          snapshot.data!.articles![index].publishedAt.toString());
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsDetailsScreen(
                                          newsImage: snapshot
                                              .data!.articles![index].urlToImage
                                              .toString(),
                                          newsTitle: snapshot
                                              .data!.articles![index].title
                                              .toString(),
                                          newsDate: snapshot
                                              .data!.articles![index].publishedAt
                                              .toString(),
                                          author: snapshot
                                              .data!.articles![index].author
                                              .toString(),
                                          source: snapshot
                                              .data!.articles![index].source!.name
                                              .toString(),
                                          description: snapshot
                                              .data!.articles![index].description
                                              .toString(),
                                          content: snapshot
                                              .data!.articles![index].content
                                              .toString(),
                                          uri: snapshot.data!.articles![index].url
                                              .toString(),
                                        )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  height: height * .18,
                                  width: width * .29,
                                  imageUrl: snapshot
                                      .data!.articles![index].urlToImage
                                      .toString(),
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    child: spin,
                                  ),
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                height: height * .18,
                                padding: EdgeInsets.only(left: width * .03),
                                child: Column(
                                  children: [
                                    Text(
                                      snapshot.data!.articles![index].title
                                          .toString(),
                                      maxLines: 3,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapshot
                                              .data!.articles![index].source!.name
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 11,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          format.format(dateTime),
                                          style: GoogleFonts.poppins(
                                              fontSize: 9,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

const spin = SpinKitFadingCircle(
  color: Colors.amber,
  size: 50,
);
