drainAmount = 0.05


function  onUpdate(elapsed)
		health = getProperty('health')
		if curStep <=0 then
			if health>1.5 then
				setProperty('health', health-elapsed*drainAmount)
			end
		else
			if health>0.1 then
				setProperty('health', health-elapsed*drainAmount)
			end
		end
end

