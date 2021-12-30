Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/Animation'
require 'src/constants'
require 'src/Enemy'
require 'src/enemy_defs'
require 'src/Hitbox'
require 'src/Hurtbox'
require 'src/Map'
require 'src/Player'
require 'src/player_defs'
require 'src/StateMachine'
require 'src/Tile'
require 'src/Util'
require 'src/weapon_defs'

require 'src/states/BaseState'
require 'src/states/game/StartState'
require 'src/states/game/PlayState'
require 'src/states/game/GameOverState'
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
	['skeleton-idle'] = love.graphics.newImage('graphics/skeleton_idle.png'),
	['skeleton-hit'] = love.graphics.newImage('graphics/skeleton_hit.png'),
	['skeleton-dead'] = love.graphics.newImage('graphics/skeleton_dead.png'),
	['skeleton-attack'] = love.graphics.newImage('graphics/skeleton_attack.png'),
	['skeleton-walk'] = love.graphics.newImage('graphics/skeleton_walk.png'),
	['hearts'] = love.graphics.newImage('graphics/hearts.png'),
	['knight-idle'] = love.graphics.newImage('graphics/knight_idle.png'),
	['knight-hit'] = love.graphics.newImage('graphics/knight_hit.png'),
	['knight-dead'] = love.graphics.newImage('graphics/knight_dead.png'),
	['knight-attack'] = love.graphics.newImage('graphics/knight_attack.png'),
	['knight-walk'] = love.graphics.newImage('graphics/knight_walk.png')
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
	['skeleton-idle'] = GenerateQuads(gTextures['skeleton-idle'], 24, 32),
	['skeleton-hit'] = GenerateQuads(gTextures['skeleton-hit'], 30, 32),
	['skeleton-dead'] = GenerateQuads(gTextures['skeleton-dead'], 33, 32),
	['skeleton-attack'] = GenerateQuads(gTextures['skeleton-attack'], 43, 37),
	['skeleton-walk'] = GenerateQuads(gTextures['skeleton-walk'], 22, 33),
	['hearts'] = GenerateQuads(gTextures['hearts'], 16, 16),
	['knight-idle'] = GenerateQuads(gTextures['knight-idle'], 120, 80),
	['knight-hit'] = GenerateQuads(gTextures['knight-hit'], 120, 80),
	['knight-dead'] = GenerateQuads(gTextures['knight-dead'], 120, 80),
	['knight-attack'] = GenerateQuads(gTextures['knight-attack'], 120, 80),
	['knight-walk'] = GenerateQuads(gTextures['knight-walk'], 120, 80)
}

gFonts = {
	['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
    ['title'] = love.graphics.newFont('fonts/ArcadeAlternate.ttf', 32)
}