local pd <const> = playdate
local gfx <const> = pd.graphics

import "bullet"

class('Player').extends(gfx.sprite)

function Player:init(x, y)
	local playerImage = gfx.image.new("images/wizard")
	self:setImage(playerImage)
	self:moveTo(x, y)
	self:add()
	self.moveSpeed = 5
end

-- function Player:shoot(x, y)
-- 	local projectileInstance = Projectile(x, y - 10, self.projectileSpeed)
-- 	projectileInstance:add()
-- end
-- 
-- function Player:ability()
-- 	local function timerCallback()
-- 		self:shoot(self.x, self.y)
-- 	end
-- 	pd.timer.performAfterDelay(50, timerCallback)
-- 	pd.timer.performAfterDelay(150, timerCallback)
-- end

function Player:update()
	-- Player.super.update(self)

-- Movement with screen bounding checks
	if pd.buttonIsPressed(pd.kButtonUp) then
		if self.y > 20 then
			self:moveBy(0, -self.moveSpeed)
		end
	end
	if pd.buttonIsPressed(pd.kButtonDown) then
		if self.y < 220 then
			self:moveBy(0, self.moveSpeed)
		end
	end
	if pd.buttonIsPressed(pd.kButtonLeft) then
		if self.x > 16 then
			self:moveBy(-self.moveSpeed, 0)
		end
	end
	if pd.buttonIsPressed(pd.kButtonRight) then
		if self.x < 380 then 
			self:moveBy(self.moveSpeed, 0)
		end
	end

-- Actions with buttons
	if pd.buttonJustPressed(pd.kButtonA) then
			Bullet(self.x + 18, self.y - 8, 5)
	end
	-- if pd.buttonJustPressed(pd.kButtonA) then
	-- 	self:shoot(self.x, self.y)
	-- end
	-- if pd.buttonJustPressed(pd.kButtonB) then
	-- 	self:ability()
	-- end
end