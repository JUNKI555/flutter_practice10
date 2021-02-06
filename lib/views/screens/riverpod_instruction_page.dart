import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/instruction_widget.dart';

final isFinalPageProvider = StateProvider<bool>((ref) => false);

class RiverpodInstructionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageController = new PageController();

    final pageList = <Widget>[
      Instruction(
        context,
        'アプリの説明1アプリの説明1',
        '1枚目',
        'アプリの説明1アプリの説明1アプリの説明1アプリの説明1',
      ),
      Instruction(
        context,
        'アプリの説明2アプリの説明2',
        '2枚目',
        'アプリの説明2アプリの説明2アプリの説明2アプリの説明2',
      ),
      Instruction(
        context,
        'アプリの説明3アプリの説明3',
        '3枚目',
        'アプリの説明3アプリの説明3アプリの説明3アプリの説明3',
      ),
      Instruction(
        context,
        'アプリの説明4アプリの説明4',
        '4枚目',
        'アプリの説明4アプリの説明4アプリの説明4アプリの説明4',
      ),
    ];

    return Consumer(
      builder: (context, watch, child) {
        final isFinalPage = watch(isFinalPageProvider);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Riverpod版アプリ説明'),
          ),
          body: Column(
            /* Expanded は Column, Row, Flex のいずれかにラップされなければならない */
            children: <Widget>[
              /* PageViewの切り替え制御を全画面で行うためにExpanded */
              Expanded(
                /* 全画面のPageView, その上にPageIndicator(と最終ページのボタン)を重ねるためにStack */
                child: Stack(
                  children: <Widget>[
                    PageView(
                      scrollDirection: Axis.horizontal,
                      controller: pageController,
                      children: pageList,
                      onPageChanged: (pageCount) {
                        if (pageCount + 1 == pageList.length) {
                          isFinalPage.state = true;
                        } else {
                          isFinalPage.state = false;
                        }
                      },
                    ),
                    Align(
                      alignment: const Alignment(0, 0.25),
                      child: AnimatedOpacity(
                        opacity: isFinalPage.state ? 0.0 : 1.0,
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
                    Align(
                      alignment: const Alignment(0, 0.25),
                      child: AnimatedOpacity(
                        opacity: isFinalPage.state ? 1.0 : 0.0,
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
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
