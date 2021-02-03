import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  PageController pageController;
  bool isFinalPage = true;
  int pageCount = 1;

  void pageNumberChange(int page) {
    setState(() {
      pageCount = page + 1;
    });
  }

  @override
  void initState() {
    pageController = new PageController();
    super.initState();
  }

  @override
  void didUpdateWidget(RootPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final pageList = <Widget>[
      Column(
        children: <Widget>[
          const SizedBox(
            height: 150,
            child: Center(
              child: Text(
                'アプリの説明1アプリの説明1',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 200,
                  child: FlatButton(
                    color: Colors.black54,
                    onPressed: () {
                      Navigator.pushNamed(context, '/test');
                    },
                    child: const Text('1枚目'),
                  ),
                ),
                const Text(
                  'アプリの説明1アプリの説明1アプリの説明1アプリの説明1',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      Column(
        children: <Widget>[
          SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'アプリの説明2アプリの説明2',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 200,
                  child: FlatButton(
                    color: Colors.black54,
                    onPressed: () {
                      Navigator.pushNamed(context, '/test');
                    },
                    child: const Text('2枚目'),
                  ),
                ),
                const Text(
                  'アプリの説明2アプリの説明2アプリの説明2アプリの説明2',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      Column(
        children: <Widget>[
          SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'アプリの説明3アプリの説明3',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 200,
                  child: FlatButton(
                    color: Colors.black54,
                    onPressed: () {
                      Navigator.pushNamed(context, '/test');
                    },
                    child: const Text('3枚目'),
                  ),
                ),
                const Text(
                  'アプリの説明3アプリの説明3アプリの説明3アプリの説明3',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      Column(
        children: <Widget>[
          SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'アプリの説明4アプリの説明4',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 200,
                  child: FlatButton(
                    color: Colors.black54,
                    onPressed: () {
                      Navigator.pushNamed(context, '/test');
                    },
                    child: const Text('4枚目'),
                  ),
                ),
                const Text(
                  'アプリの説明4アプリの説明4アプリの説明4アプリの説明4',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('アプリ説明'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                PageView(
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  children: pageList,
                  onPageChanged: (pageCount) {
                    pageNumberChange(pageCount);
                    if (pageCount + 1 == pageList.length) {
                      isFinalPage = false;
                    } else {
                      isFinalPage = true;
                    }
                  },
                ),
                Align(
                  alignment: const Alignment(0, 0.25),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AnimatedOpacity(
                      opacity: isFinalPage ? 1.0 : 0.0,
                      duration: const Duration(microseconds: 500),
                      child: PageIndicator(
                        layout: PageIndicatorLayout.NONE,
                        size: 20,
                        activeSize: 30,
                        controller: pageController,
                        space: 20,
                        count: 4,
                        color: Colors.black,
                        activeColor: Colors.red,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.25),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AnimatedOpacity(
                      opacity: isFinalPage ? 0.0 : 1.0,
                      duration: const Duration(microseconds: 500),
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.pushNamed(context, '/hello');
                          },
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: const Text(
                            'はじめる',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
