Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/constants'
require 'src/StateMachine'
require 'src/Util'
require 'src/LevelGenerator'
require 'src/Tile'
require 'src/TileMap'
require 'src/GameLevel'

require 'src/states/BaseState'
require 'src/states/game/PlayState'

gSounds = {

}

gTextures = {
	['background'] = love.graphics.newImage('graphics/background_grassland.png'),
	['tileset'] = love.graphics.newImage('graphics/tileset_grassland.png')
}

gFrames = {
	['background'] = GenerateQuads(gTextures['background'], 288, 208),
	['tileset'] = GenerateQuads(gTextures['tileset'], 16, 16)
}

gFonts = {

}