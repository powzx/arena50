# Arena 50

## Introduction

Arena 50 is a 2D single-player fighting game developed on LÖVE for the CS50's Introduction to Game Development Final Project. In this game, the player is spawned into an arena with a random number of monsters (skeletons, knights). The player needs to slay all the enemies in order to proceed to the next level. When the player is slain by an enemy, the game is over and the score (number of enemies slain) is shown, and the player can restart the level again. The end goal of this game is to slay as many enemies as possible.

## Controls

|    Key    |  Function  |
|-----------|------------|
|     A     | Walk Left  |
|     D     | Walk Right |
|   Space   |   Jump     |
|   Enter   |   Attack   |
|Right Arrow|Proceed to next stage|
|    Esc    |   Quit     |

## Developer Documentation

### Game States

The game has a total of 3 game states:
- `StartState`
- `PlayState`
- `GameOverState`

The `StartState` is the starting state of the game where a randomly chosen background is drawn. Players can press the Right Arrow key to transit to the `PlayState`

In the `PlayState`, a random set of background and tiles is passed into the `Map` class to be drawn as the map of the arena. The main character and a random number of enemies are also spawned into the map. When the level is completed, a text is printed at the center of the screen and players can press the Right Arrow key to enter a new `PlayState`, which is essentially a new level. If the main character is slain, it will transit to the `GameOverState`.

The `GameOverState` is the ending state of the game where the number of the enemies slain will be printed onto the screen. Players can press the Right Arrow key to transit back to the `StartState`.

### Map Class

The map generation is the same for all levels, except they are built from different backgrounds and tilesets. The `Map` class also spawns the main character using the `Player` class and a random number of enemies in the `Map:spawnEnemies()` method using the `Enemy` class. This class also updates and renders the player and all the enemies in the `Map:update()` and `Map:render()` methods.

### Player Class and States

The `Player` class consists of all the relevant information related to the main character. The main character also has several states (with their own animation frames and logic):

- `PlayerIdleState`
- `PlayerWalkingState`
- `PlayerJumpState`
- `PlayerFallingState`
- `PlayerAttackState`

The main character is first dropped into the map at the left end of the map. Upon landing, the main character enters the idle state. When the player presses either the 'A' or 'D' keys, the main character enters the walking state with a constant walking speed. When the player presses the 'Space' key, the main character enters the jump state with a constant initial upward velocity, which decreases over time due to a constant gravity. When the velocity reaches 0, the main character enters the falling state with downward velocity that increases over time by gravity, until it reaches the tiles. 

When the player presses 'Enter' during idle or walking state, the player enters the attack state. If the hitbox of the player collides with the hurtbox of an enemy, a hit is registered on the enemy and the enemy's health will decrease by the damage value of the main character's weapon. To ensure this hit is only registered once per attack, the checking of collision is only done once in the `PlayerAttackState:init()` method.

### Enemy Class and States

The `Enemy` class consists of all the relevant information related to an enemy character. The enemy also has several states (with their own animation frames and logic):

- `EnemyIdleState`
- `EnemyWalkingState`
- `EnemyHitState`
- `EnemyDeadState`
- `EnemyAttackState`

An enemy character is spawned at a random location (random x-value) on the map in the idle state. In the idle state, there is a probability of 0.01 at every frame that the character will transit to the walking state in a random direction for a random duration (up to 10 seconds), as seen in the `EnemyIdleState:update()` method. In both the idle and walking states, more specifically in their `update()` methods, if the main character gets too close to the enemy character (approximately 50 pixels distance), the enemy will transit to the attack state. If the hitbox of the enemy collides with the hurtbox of the main character, a hit is registered on the player and the player's health will reduce by the damage value of the enemy.

Each type of enemy will have a `strikeFrame` which is the frame of the 'attack' animation at which a hit can be registered on the player. Therefore, on other frames of the 'attack' animation, a hit will not be registered even if the hitbox of the enemy collides with the hurtbox of the main character. This is because the 'attack' animation frames for the enemies are found to have only one specific frame that is the 'strike' of the attack, where other frames are just moving the weapon to position. Hence, this design is considered to make it fairer to the player.

When the hitbox of the main character collides with the hurtbox of the enemy, the enemy transits to the hit state, and if the enemy's health falls to 0 at this hit, the enemy transits to the dead state where a flag `Enemy.isDead` is set so that subsequent collisions will not continue to register as a hit.

### Hitbox and Hurtbox

A hitbox is associated with every instance of the main character and the enemy to represent the range of the attack of the entity, whereas a hurtbox is associated with every instance of the main character and the enemy to represent the 'hitable' region of the entity. A successful attack constitutes an axis-aligned bounding boxes (AABB) collision detected between the hitbox of the attacker and the hurtbox of the attacked entity.

A hurtbox is instantiated with the offsets along the X and Y axes from the origin (top-left corner) of the character sprite, and the offsets to the width and height of the character sprite. A hitbox is also instantiated with the relevant offsets, however two different offset values (`offsetXLeft` and `offsetXRight`) along the X axis are needed for the attacks in the left and right directions.

### Data-driven Programming

Arena 50 also makes use of data-driven programming with the following data files:

- `player_defs.lua`
- `weapon_defs.lua`
- `enemy_defs.lua`

The `player_defs.lua` contains information about the main character being spawned into the game, which consists of only the maximum health of the main character for now. The `weapon_defs.lua` contains information about the weapon used by the main character, which consists of the damage dealt to the enemy per attack. The `enemy_defs.lua` contains information about the different types of enemies spawned (`skeleton` and `knight` for now), which consists of the sprite width, height, relevant offset values for hitbox and hurtbox, walking speed, strike frame (as described above), maximum health, damage dealt to the main character per attack, animation details, and render offsets. Due to the inconsistent positioning of the skeleton drawing within the sprite, render offsets are needed in the data file to prevent the skeleton from 'jumping' around between different states.

The use of data-driven programming in Arena 50 improves the code abstraction so that the same code can be written for all types of enemies. It also allows this game to scale easily because new types of enemies can just be added to the data file without modifying the logic of the game. In the case of future possible developments, new main characters with different maximum healths and new weapons with different damages may also be easily added to the data file.