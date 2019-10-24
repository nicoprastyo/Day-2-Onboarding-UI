import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen_onboarding/utilities/styles.dart';

class onBoardingScreen extends StatefulWidget {
  @override
  _onBoardingScreenState createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicatior() {
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
          color: isActive ? Colors.white : Color(0xFF7B51D3),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.1,
                0.8,
              ],
              colors: [
                Color(0xFF3f51b5),
                Color(0xFF1a237e),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => print('Skip'),
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.white, fontSize: 15.0
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 600.0,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                                Center(
                                  child: Image(
                                    image: AssetImage('assets/images/one.png'),
                                    height: 300.0,
                                    width: 300.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Text('Lorem Ipsum', style: kTitleStyle),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                    'Lorem Ipsum is simply dummy\ntext of the printing and \ntypesetting industry.',textAlign: TextAlign.center,
                                    style: kSubtitleStyle 
                                  ),
                              ],
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                                Center(
                                  child: Image(
                                    image: AssetImage('assets/images/two.png'),
                                    height: 300.0,
                                    width: 300.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Text('Lorem Ipsum', style: kTitleStyle),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                    'Lorem Ipsum is simply dummy\ntext of the printing and \ntypesetting industry.',textAlign: TextAlign.center,
                                    style: kSubtitleStyle 
                                  ),
                              ],
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                                Center(
                                  child: Image(
                                    image: AssetImage('assets/images/three.png'),
                                    height: 300.0,
                                    width: 300.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Text('Lorem Ipsum', style: kTitleStyle),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                    'Lorem Ipsum is simply dummy\ntext of the printing and \ntypesetting industry.',textAlign: TextAlign.center,
                                    style: kSubtitleStyle,     
                                  ),
                              ],
                            ),
                      ),                                            
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicatior(),
                ),
                _currentPage != _numPages - 1
                  ? Expanded(child: Align(alignment: FractionalOffset.bottomRight,
                  child: FlatButton(
                    onPressed: (){
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Next', style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0
                          ),),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 15.0,
                          ),
                        ],
                      ),
                    ),
                  ),),) : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1 ? Container(
      height: 70.0,
      width: double.infinity,
      color: Colors.white,
      child: GestureDetector(onTap: () => print('Get Started'),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Text(
            'Sign In',
            style: TextStyle(
              color: Color(0xFF1a237e),
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
