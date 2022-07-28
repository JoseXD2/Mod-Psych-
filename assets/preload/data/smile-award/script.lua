-- script by ItsCapp don't steal, it's dumb

-- simply, offsets. they're the numbers in the top left of the character editor
idleoffsets = {'146', '122'} -- I recommend you have your idle offset at 0
leftoffsets = {'150', '122'}
downoffsets = {'145', '115'}
upoffsets = {'147', '122'}
rightoffsets = {'147', '123'}

-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'Susie_smile idle'
left_xml_name = 'Susie_smile left'
down_xml_name = 'Susie_smile down'
up_xml_name = 'Susie_smile up0'
right_xml_name = 'Susie_smile right'

-- basically horizontal and vertical positions
x_position = 1000
y_position = 100

-- scales your character (set to 1 by default)
xScale = 1
yScale = 1

-- invisible character (so basically if you wanna use the change character event, you need to make the second character invisible first)
invisible = false

-- pretty self-explanitory
name_of_character_xml = 'Susie_smile'
name_of_character = 'Susie_smile'
name_of_notetype = 'Susie Sing'
name_of_notetype2 = 'dgasdgfdgfdg' -- you don't need this, but if you want a notetype that has multiple characters to sing you can use this.

-- if it's set to true the character appears behind the default characters, including gf, watch out for that
foreground = false
playablecharacter = false -- change to 'true' if you want to flipX

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/' .. name_of_character_xml, x_position, y_position);

	addAnimationByPrefix(name_of_character, 'idle', idle_xml_name, 9, true);
	addAnimationByPrefix(name_of_character, 'singLEFT', left_xml_name, 10, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', down_xml_name, 10, false);
	addAnimationByPrefix(name_of_character, 'singUP', up_xml_name, 10, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', right_xml_name, 10, false);

	if playablecharacter == true then
		setPropertyLuaSprite(name_of_character, 'flipX', true);
	else
		setPropertyLuaSprite(name_of_character, 'flipX', false);
	end

	scaleObject(name_of_character, xScale, yScale);


	objectPlayAnimation(name_of_character, 'idle');
	addLuaSprite(name_of_character, foreground);

	if invisible == true then
		setPropertyLuaSprite(name_of_character, 'alpha', 0)
	end
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == name_of_notetype or noteType == name_of_notetype2 then
		doIdle = false
		objectPlayAnimation(name_of_character, singAnims[direction + 1], false);

		if direction == 0 then
			setProperty(name_of_character .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character .. '.offset.y', leftoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 1 then
			setProperty(name_of_character .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character .. '.offset.y', downoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 2 then
			setProperty(name_of_character .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character .. '.offset.y', upoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 3 then
			setProperty(name_of_character .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character .. '.offset.y', rightoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		end
	end
end

-- I know this is messy, but it's the only way I know to make it work on both sides.
local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == name_of_notetype or noteType == name_of_notetype2 then
		doIdle = false
		objectPlayAnimation(name_of_character, singAnims[direction + 1], false);

		if direction == 0 then
			setProperty(name_of_character .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character .. '.offset.y', leftoffsets[2]);
		elseif direction == 1 then
			setProperty(name_of_character .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character .. '.offset.y', downoffsets[2]);
		elseif direction == 2 then
			setProperty(name_of_character .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character .. '.offset.y', upoffsets[2]);
		elseif direction == 3 then
			setProperty(name_of_character .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character .. '.offset.y', rightoffsets[2]);
		end
	end
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0  and doIdle then
		objectPlayAnimation(name_of_character, 'idle');
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	end
	doIdle = true
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
		if doIdle == true then
			objectPlayAnimation(name_of_character, 'idle');
			setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
			setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
		end
	end
end





function onUpdate()
    if ratingName == '?' then
        setRatingName('...') --When there are no notes
    end
    if ratingName == 'You Suck!' then
        setRatingName('Boo.') --From 0% to 19% of accuracy
    end
    if ratingName == 'Shit' then
        setRatingName('Youre hopeless') --From 20% to 39% of accuracy
    end
    if ratingName == 'Bad' then
        setRatingName('Truly sad.') --From 40% to 49% of accuracy
    end
    if ratingName == 'Bruh' then
        setRatingName('Hmm...') --From 50% to 59% of accuracy
    end
    if ratingName == 'Meh' then
        setRatingName('Not bad...') --From 60% to 68% of accuracy
    end
    if ratingName == 'Nice' then
        setRatingName('Not bad...') --69% of accuracy :bruh:
    end
    if ratingName == 'Good' then
        setRatingName('Good...') --From 70% to 79% of accuracy
    end
    if ratingName == 'Great' then
        setRatingName('Great...') --From 80% to 89% of accuracy
    end
    if ratingName == 'Sick!' then
        setRatingName('Excellent...') --From 90% to 99% of accuracy
    end
    if ratingName == 'Perfect!!' then
        setRatingName('Perfect...') --100% of accuracy
    end
    if ratingName == '?' and botPlay == true then
        setRatingName('Heaven is no place for cheaters.') --When the botplay is activated
    end
end





function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 and curBeat > 13 then
        setProperty('health', health- 0.022);
    end
end




startedPlaying = false
finishedGameover = false
function onUpdate(elapsed)
    if inGameOver and not startedPlaying and not finishedGameover then
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0.2);
    end
    if not finishedGameover and getProperty('boyfriend.animation.curAnim.name') == 'deathLoop' and not startedPlaying then
        math.randomseed(curBeat * 4)
        soundName = string.format('SmileDeathQuote/SmileDeathQuote-%i', math.random(1, 15))
        playSound(soundName, 1, 'voiceOnion')
        startedPlaying = true
    end
end

function onGameOverConfirm(reset)
    finishedGameover = true;
end

function onSoundFinished(tag)
    if tag == 'voiceOnion' and not finishedGameover then
        soundFadeIn(nil, 4, 0.2, 1)
    end
end





local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene and isStoryMode then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', '');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)

	if count == 1 then
		--playSound('')
	end

end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end





function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: Smile for the camera!')
end

function onUpdate()
    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'DARKNESS')
    end
end




function onCreatePost()
	CamOffsetBF_X = 140
	CamOffsetDad_X = 470
	
	CamOffsetBF_Y = 200
	CamOffsetDad_Y = 200
	
	--the camera points for each char
	CamPointBF_X = getProperty('boyfriend.x')+CamOffsetBF_X
	CamPointBF_Y = getProperty('boyfriend.y')+CamOffsetBF_Y
	
	CamPointDad_X = getProperty('dad.x')+CamOffsetDad_X
	CamPointDad_Y = getProperty('dad.y')+CamOffsetDad_Y
end

local MoveCamBF=50
PlayerNoteFuncs = { --IM DRUNK WOOOOOOOOOO
	[1] = function() --left note
		triggerEvent('Camera Follow Pos', CamPointBF_X-MoveCamBF, CamPointBF_Y)
	end,
	[2]=function() --down note
		triggerEvent('Camera Follow Pos', CamPointBF_X, CamPointBF_Y+MoveCamBF)
	end,
	[3]=function() --up note
		triggerEvent('Camera Follow Pos', CamPointBF_X, CamPointBF_Y-MoveCamBF)
	end,
	[4]=function()--right note
		triggerEvent('Camera Follow Pos', CamPointBF_X+MoveCamBF, CamPointBF_Y)
	end
}

local MoveCamDad=50
EnemyNoteFuncs = { --IM DRUNK WOOOOOOOOOO
	[1] = function() --left note
		triggerEvent('Camera Follow Pos', CamPointDad_X-MoveCamDad, CamPointDad_Y)
	end,
	[2]=function() --down note
		triggerEvent('Camera Follow Pos', CamPointDad_X, CamPointDad_Y+MoveCamDad)
	end,
	[3]=function() --up note
		triggerEvent('Camera Follow Pos', CamPointDad_X, CamPointDad_Y-MoveCamDad)
	end,
	[4]=function()--right note
		triggerEvent('Camera Follow Pos', CamPointDad_X+MoveCamDad, CamPointDad_Y)
	end
}

function goodNoteHit(id, direction, noteType, isSustainNote)
    if PlayerNoteFuncs[direction+1] and mustHitSection == true then 
        PlayerNoteFuncs[direction+1]() -- Executes function at curStep in stepHitFuncs
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if EnemyNoteFuncs[direction+1] and mustHitSection == false then 
        EnemyNoteFuncs[direction+1]() -- Executes function at curStep in stepHitFuncs
    end
end

function onBeatHit()
	if curBeat%2==0 then
		if mustHitSection == false and getProperty('dad.animation.curAnim.name') == 'idle' then
			triggerEvent('Camera Follow Pos', '', '')
		elseif mustHitSection == true and getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			triggerEvent('Camera Follow Pos', '', '')
		end
	end
end


