drainAmount = 0.05


function  onUpdate(elapsed)
		health = getProperty('health')
		if health>0.1 then
		setProperty('health', health-elapsed*drainAmount)
		end
end

