Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/Animation'
require 'src/constants'
require 'src/GameLevel'
require 'src/Map'
require 'src/Player'
require 'src/StateMachine'
require 'src/Tile'
require 'src/Util'

require 'src/states/BaseState'
require 'src/states/game/PlayState'
require 'src/states/player/PlayerIdleState'
require 'src/states/player/PLayerWalkingState'

gSounds = {

}

gTextures = {
	['background'] = love.graphics.newImage('graphics/background_grassland.png'),
	['tileset'] = love.graphics.newImage('graphics/tileset_grassland.png'),
	['player'] = love.graphics.newImage('graphics/player.png')
}

gFrames = {
	['background'] = GenerateQuads(gTextures['background'], 288, 208),
	['tileset'] = GenerateQuads(gTextures['tileset'], 16, 16),
	['player'] = GenerateQuads(gTextures['player'], 50, 37)
}

gFonts = {

}