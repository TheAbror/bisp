// ignore_for_file: avoid_print, avoid_renaming_method_parameters, unused_local_variable

import 'package:bonfire/bonfire.dart';
import 'package:eduninjav2/presention/player_movement/sprite_sheet_hero.dart';
import 'package:eduninjav2/main.dart';
import 'package:flutter/material.dart';

class LocalPlayer extends SimplePlayer with ObjectCollision {
  final int id;
  final String nick;
  // Map<int, String> visiblePlayers = <int, String>{};
  List<Enemy> visiblePlayers = [];

  LocalPlayer(this.id, this.nick, Vector2 position, SpriteSheet spriteSheet)
      : super(
          animation: SpriteSheetHero.animationBySpriteSheet(spriteSheet),
          size: Vector2.all(tileSize * 4.5),
          position: position,
          life: 100,
          speed: tileSize * 4,
        ) {
    print('Player pos: ${position.x}; ${position.y}');
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2((tileSize * 1), (tileSize * 0.5)),
            align: Vector2((tileSize * 1.8), tileSize * 3.7),
          ),
        ],
      ),
    );
  }

  void showEmote(SpriteAnimation emoteAnimation) {
    gameRef.add(
      AnimatedFollowerObject(
        animation: Future.value(emoteAnimation),
        target: this,
        size: Vector2.all(width / 2),
        positionFromTarget: Vector2(
          25,
          -10,
        ),
      ),
    );
  }

  @override
  void joystickAction(JoystickActionEvent action) {
    // if (hasController) {
    //   controller.joystickAction(action);
    // }

    super.joystickAction(action);
  }

  void execAttack() {
    final anim = SpriteSheetHero.attackAxe;
    simpleAttackRange(
      id: id,
      animationRight: anim,
      animationLeft: anim,
      animationUp: anim,
      animationDown: anim,
      animationDestroy: SpriteSheetHero.smokeExplosion,
      size: Vector2.all(tileSize * 0.9),
      speed: speed * 3,
      damage: 15,
      enableDiagonal: false,
      collision: CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize * 0.9, tileSize * 0.9),
          )
        ],
      ),
    );
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, dynamic from) {
    showDamage(
      damage,
      config: const TextStyle(
        color: Colors.red,
        fontSize: 14,
      ),
    );
    super.receiveDamage(attacker, damage, from);
    // if (hasController) {
    //   controller.receiveDamage(damage, from);
    // }
  }

  @override
  void die() {
    updateLife(0);
    gameRef.add(
      AnimatedObjectOnce(
        animation: SpriteSheetHero.smokeExplosion,
        position: position,
        size: size,
      ),
    );
    gameRef.add(
      GameDecoration.withSprite(
        sprite: Sprite.load('crypt.png'),
        position: Vector2(
          position.x,
          position.y,
        ),
        size: size,
      ),
    );
    removeFromParent();
    super.die();
  }

  @override
  void update(double dt) {
    seeEnemy(
      observed: (List<Enemy> enemies) {
        if (enemies.isNotEmpty) {
          var firstEnemy = enemies.first;
          // if (firstEnemy is RemotePlayer) {
          //   // print('Show enemny: ${firstEnemy.nick}');
          //   context.read<GameBloc>().setVisiblePlayer(firstEnemy.nick);
          // }
        }
      },
      notObserved: () {
        // context.read<GameBloc>().setVisiblePlayer(null);
      },
      radiusVision: (4 * tileSize),
    );
    super.update(dt);
  }
}
