import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"
import "enemySpawner"
import "scoreDisplay"
import "screenShake"

local pd <const> = playdate
local gfx <const> = pd.graphics

local screenShakeSprite = ScreenShake()

function resetGame()
    resetScore()
    clearEnemies()
    stopSpawner()
    startSpawner()
    setShakeAmount(10)
end

function setShakeAmount(amount)
    screenShakeSprite:setShakeAmount(amount)
end

createScoreDisplay()
Player(30, 120)
startSpawner()

-- local function initialize()
--     local playerInstance = Giant(200, 200, knightImage)
--     playerInstance:add()
-- end
-- 
-- initialize()

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
    pd.drawFPS(10,10)
end

-- Next learn how to... 
-- Make collision of player & enemy spawns reset game
-- Add lose screen 
-- High score tracker (on lose screen and start screen?)
-- Change spawn time or enemy movement speed as the score increases
-- Add cooldown to player shooting
-- Add sound effects 
-- Add start screen