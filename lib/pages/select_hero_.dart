// ignore_for_file: prefer_final_fields

import 'package:bonfire/bonfire.dart';
import 'package:eduninjav2/interface/interface_overlay.dart';
import 'package:eduninjav2/pages/loading.dart';
import 'package:flutter/material.dart';

import '../game/player/sprite_sheet_hero.dart';

String _lastNick = '';

class SelectHero extends StatefulWidget {
  @override
  _SelectHeroState createState() => _SelectHeroState();
}

class _SelectHeroState extends State<SelectHero> {
  int count = 0;
  List<SpriteSheet> sprites = [];
  bool loading = false;
  String statusServer = "CONNECTING";
  PageController _pageController = PageController();
  TextEditingController _textEditingController = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey();
  // late SocketManager _socketManager;

  @override
  void initState() {
    // _socketManager = BonfireInjector.instance.get();
    _textEditingController.text = _lastNick;
    sprites.add(SpriteSheetHero.hero1);
    sprites.add(SpriteSheetHero.hero2);
    sprites.add(SpriteSheetHero.hero3);
    sprites.add(SpriteSheetHero.hero4);
    sprites.add(SpriteSheetHero.hero5);
    sprites.add(SpriteSheetHero.hero6);
    sprites.add(SpriteSheetHero.hero7);

    // _socketManager.listenConnection((_) {
    //   setState(() {
    //     statusServer = 'CONNECTED';
    //   });
    // });
    // _socketManager.listenError((_) {
    //   setState(() {
    //     statusServer = 'ERROR: $_';
    //   });
    // });

    // _socketManager.listen('message', _listen);

    // _socketManager.connect();

    super.initState();
  }

  @override
  void dispose() {
    // _socketManager.removeListen('message', _listen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.cyan[800],
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(height: 10),
                const Text("Select your character",
                    style: TextStyle(color: Colors.white, fontSize: 30)),
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
                          width: 200,
                          child: TextFormField(
                            controller: _textEditingController,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'What your username?',
                            ),
                            validator: (text) {
                              if (text?.isNotEmpty != true) {
                                return 'Nick required';
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
                                child: const Text(
                                  'ENTER',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                          (Set<MaterialState> states) {
                                    return states
                                            .contains(MaterialState.disabled)
                                        ? null
                                        : Colors.orange;
                                  }),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                onPressed: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoadingPage(),
                                    ),
                                    // MaterialPageRoute(
                                    //   builder: (context) => const HomePage(),
                                    // ),
                                  );
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
                      children: <Widget>[
                        const CircularProgressIndicator(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Loading")
                      ],
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
                          child: const Center(
                              child: Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          )),
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
                          onPressed: _next,
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

  void _goGame() {
    print('Server não conectado.');

    // if (_form.currentState?.validate() == true) {
    //   if (_socketManager.connected) {
    //     setState(() {
    //       loading = true;
    //     });
    //     _joinGame();
    //   } else {
    //     //server ne podklyuchon
    //     print('Server não conectado.');
    //   }
    // }
  }

  // void _joinGame() {
  //   _lastNick = _textEditingController.text;
  //   _socketManager.send('message', {
  //     'action': 'CREATE',
  //     'data': {'nick': _lastNick, 'skin': count}
  //   });
  // }

  // void _listen(data) {
  //   if (data is Map && data['action'] == 'PLAYER_JOIN') {
  //     setState(() {
  //       loading = false;
  //     });
  //     if (data['data']['nick'] == _textEditingController.text) {
  //       _socketManager.cleanListeners();
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => Game(
  //             playersOn: data['data']['playersON'],
  //             nick: _textEditingController.text,
  //             playerId: data['data']['id'],
  //             idCharacter: count,
  //             position: Vector2(
  //               double.parse(data['data']['position']['x'].toString()),
  //               double.parse(data['data']['position']['y'].toString()),
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  //   }
  // }
}
