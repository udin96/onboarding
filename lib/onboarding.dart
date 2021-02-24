import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF065A75) : Color(0xFFD0D1D1),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 650.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/image/SC.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Flexible Schedule',
                                    style: TextStyle(
                                      color: Color(0xFF5F47B1),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'CM Sans Serif',
                                      fontSize: 26.0,
                                      height: 2.5,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 30.0),
                                child: Image(
                                  image: AssetImage('assets/text/SC.png'),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/image/VS.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Flexible Schedule',
                                    style: TextStyle(
                                      color: Color(0xFF078B9A),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'CM Sans Serif',
                                      fontSize: 26.0,
                                      height: 2.5,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 30.0),
                                child: Image(
                                  image: AssetImage('assets/text/VS.png'),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/image/TC.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Flexible Schedule',
                                    style: TextStyle(
                                      color: Color(0xFF3D82CF),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'CM Sans Serif',
                                      fontSize: 26.0,
                                      height: 2.5,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 30.0),
                                child: Image(
                                  image: AssetImage('assets/text/TC.png'),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/image/EW.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Flexible Schedule',
                                    style: TextStyle(
                                      color: Color(0xFF05274C),
                                      fontFamily: 'CM Sans Serif',
                                      fontSize: 26.0,
                                      fontWeight: FontWeight.bold,
                                      height: 2.5,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 30.0),
                                child: Image(
                                  image: AssetImage('assets/text/EW.png'),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Color(0xFF05274C),
              child: GestureDetector(
                onTap: () => print('Get started!'),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Get started!',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
