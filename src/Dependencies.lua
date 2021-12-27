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
	['background'] = love.graphics.newImage('graphics/background_grassland.png'),
	['tileset'] = love.graphics.newImage('graphics/tileset_grassland.png'),
	['player'] = love.graphics.newImage('graphics/player.png'),
	['enemy-idle'] = love.graphics.newImage('graphics/enemy_idle.png'),
	['enemy-hit'] = love.graphics.newImage('graphics/enemy_hit.png'),
	['enemy-dead'] = love.graphics.newImage('graphics/enemy_dead.png'),
	['enemy-attack'] = love.graphics.newImage('graphics/enemy_attack.png'),
	['enemy-walk'] = love.graphics.newImage('graphics/enemy_walk.png')
}

gFrames = {
	['background'] = GenerateQuads(gTextures['background'], 288, 208),
	['tileset'] = GenerateQuads(gTextures['tileset'], 16, 16),
	['player'] = GenerateQuads(gTextures['player'], 50, 37),
	['enemy-idle'] = GenerateQuads(gTextures['enemy-idle'], 24, 32),
	['enemy-hit'] = GenerateQuads(gTextures['enemy-hit'], 30, 32),
	['enemy-dead'] = GenerateQuads(gTextures['enemy-dead'], 33, 32),
	['enemy-attack'] = GenerateQuads(gTextures['enemy-attack'], 43, 37),
	['enemy-walk'] = GenerateQuads(gTextures['enemy-walk'], 22, 33)
}

gFonts = {

}