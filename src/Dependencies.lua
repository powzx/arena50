Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/Animation'
require 'src/constants'
require 'src/Enemy'
require 'src/GameLevel'
require 'src/Hitbox'
require 'src/Hurtbox'
require 'src/Map'
require 'src/Player'
require 'src/StateMachine'
require 'src/Tile'
require 'src/Util'

require 'src/states/BaseState'
require 'src/states/game/StartState'
require 'src/states/game/PlayState'
require 'src/states/player/PlayerAttackState'
require 'src/states/player/PlayerFallingState'
require 'src/states/player/PlayerIdleState'
require 'src/states/player/PlayerJumpState'
require 'src/states/player/PLayerWalkingState'
require 'src/states/enemy/EnemyAttackState'
require 'src/states/enemy/EnemyIdleState'
require 'src/states/enemy/EnemyHitState'
require 'src/states/enemy/EnemyDeadState'
require 'src/states/enemy/EnemyWalkingState'

gSounds = {

}

gTextures = {
	['background-grassland'] = love.graphics.newImage('graphics/background_grassland.png'),
	['tileset-grassland'] = love.graphics.newImage('graphics/tileset_grassland.png'),
	['background-autumn'] = love.graphics.newImage('graphics/background_autumn.png'),
	['tileset-autumn'] = love.graphics.newImage('graphics/tileset_autumn.png'),
	['background-tropics'] = love.graphics.newImage('graphics/background_tropics.png'),
	['tileset-tropics'] = love.graphics.newImage('graphics/tileset_tropics.png'),
	['background-winter'] = love.graphics.newImage('graphics/background_winter.png'),
	['tileset-winter'] = love.graphics.newImage('graphics/tileset_winter.png'),
	['player'] = love.graphics.newImage('graphics/player.png'),
	['enemy-idle'] = love.graphics.newImage('graphics/enemy_idle.png'),
	['enemy-hit'] = love.graphics.newImage('graphics/enemy_hit.png'),
	['enemy-dead'] = love.graphics.newImage('graphics/enemy_dead.png'),
	['enemy-attack'] = love.graphics.newImage('graphics/enemy_attack.png'),
	['enemy-walk'] = love.graphics.newImage('graphics/enemy_walk.png'),
	['hearts'] = love.graphics.newImage('graphics/hearts.png')
}

gFrames = {
	['background-grassland'] = GenerateQuads(gTextures['background-grassland'], 288, 208),
	['tileset-grassland'] = GenerateQuads(gTextures['tileset-grassland'], 16, 16),
	['background-autumn'] = GenerateQuads(gTextures['background-autumn'], 288, 208),
	['tileset-autumn'] = GenerateQuads(gTextures['tileset-autumn'], 16, 16),
	['background-tropics'] = GenerateQuads(gTextures['background-tropics'], 288, 208),
	['tileset-tropics'] = GenerateQuads(gTextures['tileset-tropics'], 16, 16),
	['background-winter'] = GenerateQuads(gTextures['background-winter'], 288, 208),
	['tileset-winter'] = GenerateQuads(gTextures['tileset-winter'], 16, 16),
	['player'] = GenerateQuads(gTextures['player'], 50, 37),
	['enemy-idle'] = GenerateQuads(gTextures['enemy-idle'], 24, 32),
	['enemy-hit'] = GenerateQuads(gTextures['enemy-hit'], 30, 32),
	['enemy-dead'] = GenerateQuads(gTextures['enemy-dead'], 33, 32),
	['enemy-attack'] = GenerateQuads(gTextures['enemy-attack'], 43, 37),
	['enemy-walk'] = GenerateQuads(gTextures['enemy-walk'], 22, 33),
	['hearts'] = GenerateQuads(gTextures['hearts'], 16, 16)
}

gFonts = {

}