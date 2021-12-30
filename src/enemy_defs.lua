ENEMY_DEFS = {
	['skeleton'] = {
		width = 24,
		height = 32,
		hurtboxOffsetX = 8,
		hurtboxOffsetY = 0,
		hurtboxOffsetWidth = -12,
		hurtboxOffsetHeight = 0,
		hitboxOffsetXLeft = -14,
		hitboxOffsetXRight = 20,
		hitboxOffsetY = 0,
		hitboxOffsetWidth = -2,
		hitboxOffsetHeight = 0,
		walkSpeed = 20,
		strikeFrame = 8,
		health = 60,
		damage = 10,
		renderOffsets = {
			['attack'] = {
				x = 2,
				y = -5
			},
			['hit'] = {
				x = 5,
				y = 0
			},
			['dead'] = {
				x = 0,
				y = 0
			},
			['idle'] = {
				x = 0,
				y = 0
			},
			['walk'] = {
				x = 0,
				y = 0
			}
		},
		animations = {
			['idle'] = {
				frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
				interval = 0.1,
				isLoop = true
			},
			['hit'] = {
				frames = {1, 2, 3, 4, 5, 6, 7, 8},
				interval = 0.1,
				isLoop = false
			},
			['dead'] = {
				frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
				interval = 0.1,
				isLoop = false
			},
			['attack'] = {
				frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18},
				interval = 0.05,
				isLoop = false
			},
			['walk'] = {
				frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
				interval = 0.1,
				isLoop = true
			}
		}
	},
	['knight'] = {
		width = 120,
		height = 80,
		hurtboxOffsetX = 50,
		hurtboxOffsetY = 40,
		hurtboxOffsetWidth = -100,
		hurtboxOffsetHeight = -40,
		hitboxOffsetXLeft = 10,
		hitboxOffsetXRight = 70,
		hitboxOffsetY = 40,
		hitboxOffsetWidth = -80,
		hitboxOffsetHeight = -40,
		walkSpeed = 15,
		strikeFrame = 2,
		health = 80,
		damage = 12,
		renderOffsets = {
			['attack'] = {
				x = 0,
				y = 0
			},
			['hit'] = {
				x = 0,
				y = 0
			},
			['dead'] = {
				x = 0,
				y = 0
			},
			['idle'] = {
				x = 0,
				y = 0
			},
			['walk'] = {
				x = 0,
				y = 0
			}
		},
		animations = {
			['idle'] = {
				frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
				interval = 0.1,
				isLoop = true
			},
			['hit'] = {
				frames = {1},
				interval = 1,
				isLoop = false
			},
			['dead'] = {
				frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
				interval = 0.1,
				isLoop = false
			},
			['attack'] = {
				frames = {1, 2, 3, 4},
				interval = 0.05,
				isLoop = false
			},
			['walk'] = {
				frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
				interval = 0.1,
				isLoop = true
			}
		}
	}
}