longNoteHealthDrain = .005
noteHealthDrain = .01

function opponentNoteHit(id, direction, noteType, isSustainNote)
	
	if difficulty ==0 then
	
		longNoteHealthDrain = .001
		noteHealthDrain = .002
	end
	if difficulty ==1 then
		longNoteHealthDrain = .003
		noteHealthDrain = .0065

	end
	if difficulty ==2 then
		longNoteHealthDrain = .005
		noteHealthDrain = .01
	end


	 health = getProperty('health')
	 if isSustainNote == true then
		setProperty('health', health- longNoteHealthDrain)
		else
		setProperty('health', health- noteHealthDrain)
	 end
end
