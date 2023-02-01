// ignore_for_file: library_private_types_in_public_api

import 'package:bonfire/bonfire.dart';
import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/game/player/sprite_sheet_hero.dart';
import 'package:eduninjav2/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _lastNick = '';

class SelectHero extends StatefulWidget {
  const SelectHero({super.key});

  @override
  _SelectHeroState createState() => _SelectHeroState();
}

class _SelectHeroState extends State<SelectHero> {
  int count = 0;
  List<SpriteSheet> sprites = [];
  bool loading = false;
  String statusServer = "CONNECTING";
  final PageController _pageController = PageController();
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey();
  late SharedPreferences prefs;
  String temp = '';

  @override
  void initState() {
    _textEditingController.text = _lastNick;
    sprites.add(SpriteSheetHero.hero1);
    sprites.add(SpriteSheetHero.hero2);
    sprites.add(SpriteSheetHero.hero3);
    sprites.add(SpriteSheetHero.hero4);
    sprites.add(SpriteSheetHero.hero5);
    sprites.add(SpriteSheetHero.hero6);
    sprites.add(SpriteSheetHero.hero7);

    super.initState();
    _loadCounter();
  }

  int _counter = 0;

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  // Incrementing counter after click
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(height: 10),
                const Text("Select your character", style: TextStyle(color: Colors.white, fontSize: 30)),
                Expanded(
                  flex: 2,
                  child: _buildPersons(),
                ),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: _form,
                        child: SizedBox(
                          width: 100.w,
                          child: TextFormField(
                            controller: _textEditingController,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'What your username?',
                              errorStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (text) {
                              if (text?.isNotEmpty != true) {
                                return 'Nick is required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Stack(
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                              width: 150,
                              child: ElevatedButton(
                                // ignore: sort_child_properties_last
                                child: const Text(
                                  'ENTER',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                                    return states.contains(MaterialState.disabled) ? null : Colors.orange;
                                  }),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                onPressed: (() {
                                  if (_form.currentState!.validate()) {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) => const HomePage(),
                                        ),
                                        (Route<dynamic> route) => false);
                                  }
                                }),
                              ),
                            ),
                            ElevatedButton(
                              child: const Text('Display Value'),
                              onPressed: () => _incrementCounter(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            if (loading)
              InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.white.withOpacity(0.9),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[CircularProgressIndicator(), SizedBox(height: 10), Text("Loading")],
                    ),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  statusServer,
                  style: const TextStyle(fontSize: 11, color: Colors.white),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Flutter 3.3.3',
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPersons() {
    return Center(
      child: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            Expanded(
              child: count == 0
                  ? const SizedBox.shrink()
                  : Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.blue,
                            ),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.zero,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          // ignore: sort_child_properties_last
                          child: const Center(
                              child: Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          )),
                          onPressed: _previous,
                        ),
                      ),
                    ),
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: sprites.length,
                  onPageChanged: (index) {
                    setState(() {
                      count = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return SpriteAnimationWidget(
                      animation: sprites[index].createAnimation(
                        row: 5,
                        stepTime: 0.1,
                      ),
                      anchor: Anchor.center,
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: count == sprites.length - 1
                  ? const SizedBox.shrink()
                  : Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                          onPressed: _next,
                          child: const Center(
                            child: Icon(
                              Icons.chevron_right,
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
    );
  }

  void _next() {
    if (count < sprites.length - 1) {
      _pageController.animateToPage(
        count + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    }
  }

  void _previous() {
    if (count > 0) {
      _pageController.animateToPage(
        count - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    }
  }
}
