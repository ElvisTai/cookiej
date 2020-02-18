import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

///封装好，全屏查看一批图片的组件
class ShowImagesView extends StatefulWidget {
  final List<PhotoViewGalleryPageOptions> imageList;
  final int currentIndex;
  final PageController pageController;
  ShowImagesView(
    this.imageList,
    {
      this.currentIndex=0
    }
  ):pageController=PageController(initialPage: currentIndex);
  @override
  _ShowImagesViewState createState() => _ShowImagesViewState();
}

class _ShowImagesViewState extends State<ShowImagesView> {
  int currentIndex;
  @override
  void initState(){
    currentIndex=widget.currentIndex;
    super.initState();
  }
  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PhotoViewGallery(
              pageOptions: widget.imageList,
              loadingChild: Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
                decoration: BoxDecoration(color: Colors.black87),
              ),
              backgroundDecoration: BoxDecoration(color: Colors.black87),
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
            ),
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "${currentIndex + 1}/${widget.imageList.length}",
                style: const TextStyle(
                    color: Colors.white70, fontSize: 20, decoration: null),
              ),
            )
          ],
        ),
      ),
    );
  }
}