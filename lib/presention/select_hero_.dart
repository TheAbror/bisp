// ignore_for_file: library_private_types_in_public_api

import 'package:bonfire/bonfire.dart';
import 'package:eduninjav2/core/api/api_provider.dart';
import 'package:eduninjav2/core/constants/values/app_colors.dart';
import 'package:eduninjav2/core/shared_preferences/preferences_services.dart';
import 'package:eduninjav2/presention/home_page.dart';
import 'package:eduninjav2/presention/player/sprite_sheet_hero.dart';
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
  bool isSelected = true;
  int buttonIndex = 3;
  //
  String statusServer = "CONNECTING";
  final PageController _pageController = PageController();
  final PageController _pageController2 = PageController();
  final GlobalKey<FormState> _form = GlobalKey();
  //
  final _preferencesService = PreferencesServices();
  final _usernameController = TextEditingController();

  @override
  void initState() {
    sprites.add(SpriteSheetHero.hero1);
    sprites.add(SpriteSheetHero.hero2);
    sprites.add(SpriteSheetHero.hero3);
    sprites.add(SpriteSheetHero.hero4);
    sprites.add(SpriteSheetHero.hero5);
    sprites.add(SpriteSheetHero.hero6);
    sprites.add(SpriteSheetHero.hero7);
    _populateFields();
    super.initState();
  }

  void _populateFields() async {
    final userDetails = await _preferencesService.getUserData();
    setState(() {
      _usernameController.text = userDetails.username;
    });
  }

  void _saveData() {
    final userData = UserDetails(
      username: _usernameController.text,
    );

    _preferencesService.saveUserData(userData);
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
                            controller: _usernameController,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Create nickname?',
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
                                onPressed: (() async {
                                  _saveData();
                                  // final name = await PreferencesServices.saveUserData(username);
                                  if (_form.currentState!.validate()) {
                                    ApiProvider.create();

                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) => const HomePage(),
                                        ),
                                        (Route<dynamic> route) => false);
                                  }
                                }),
                              ),
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
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ToggleButtons(
                  selectedColor: Colors.orange,
                  textStyle: TextStyle(color: Colors.white),
                  isSelected: [isSelected, !isSelected],
                  onPressed: (int index) {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  children: const <Widget>[
                    Text(
                      'EN',
                    ),
                    Text(
                      'RU',
                    ),
                  ],
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
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
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
                            ),
                          ),
                          onPressed: _previous,
                        ),
                      ),
                    ),
            ),
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
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
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: PageView.builder(
                        controller: _pageController2,
                        itemCount: sprites.length,
                        onPageChanged: (myindex) {
                          setState(() {
                            count = myindex;
                          });
                        },
                        itemBuilder: (context, myindex) {
                          if (myindex == 0) {
                            return const SizedBox();
                          } else {
                            return const Icon(
                              Icons.lock,
                              color: Colors.white,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
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
      _pageController2.animateToPage(
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
      _pageController2.animateToPage(
        count - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    }
  }
}
