import "enemy"

local pd <const> = playdate
local gfx <const> = pd.graphics

local spawnTimer
local speedIncrease

function startSpawner()
	math.randomseed(pd.getSecondsSinceEpoch())
	createTimer()
	speedIncrease = 0
end

function createTimer()
	local spawnTime = math.random(500,1000)
	spawnTimer = pd.timer.performAfterDelay(spawnTime, function()
		createTimer()
		spawnEnemy()
	end)
end

function spawnEnemy()
	local spawnPosition = math.random(10, 230)
	Enemy(430, spawnPosition, 1 + speedIncrease)
end 

function incrementSpeed()
	speedIncrease += 0.01
end

function stopSpawner()
	if spawnTimer then
		spawnTimer:remove()
	end
end

function clearEnemies()
	local allSprites = gfx.sprite.getAllSprites()
	for index, sprite in ipairs(allSprites) do
		if sprite:isa(Enemy) then
			sprite:remove()
		end
	end
end