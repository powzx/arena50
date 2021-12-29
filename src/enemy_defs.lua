ENEMY_DEFS = {
	['skeleton'] = {
		width = 24,
		height = 32,
		hurtboxOffsetX = 8,
		hurtboxOffsetWidth = -12,
		hitboxOffsetXLeft = -14,
		hitboxOffsetXRight = 20,
		hitboxOffsetWidth = -2,
		walkSpeed = 20,
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
	}
}