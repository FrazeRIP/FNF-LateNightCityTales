
longNoteHealthDrain = .005
noteHealthDrain = .02

function opponentNoteHit(id, direction, noteType, isSustainNote)
	 health = getProperty('health')
	 
	if difficulty ==0 then
		longNoteHealthDrain = .001
		noteHealthDrain = .008
	end
	if difficulty ==1 then
		longNoteHealthDrain = .003
		noteHealthDrain = .013

	end
	if difficulty ==2 then
		longNoteHealthDrain = .005
		noteHealthDrain = .018
	end


	 if isSustainNote == true then
		if getProperty('health')>0.02 then
		setProperty('health', health- longNoteHealthDrain)
		end
		else
		if getProperty('health')>0.025 then
		setProperty('health', health- noteHealthDrain)
		end
	 end
end

function  onUpdate(elapsed)
	if curBeat >=280 and curBeat <=336 then
	
		 health = getProperty('health')
		if health>0.1 then
		setProperty('health', health-elapsed*0.39)
		end
	end

	if curBeat >=336 and curBeat <=368 then
	
		 health = getProperty('health')
		if health>0.1 then
		setProperty('health', health-elapsed*0.19)
		end
	end



end

