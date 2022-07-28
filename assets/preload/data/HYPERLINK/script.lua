-- script by ItsCapp don't steal, it's dumb

-- simply, offsets. they're the numbers in the top left of the character editor
idleoffsets = {'146', '122'} -- I recommend you have your idle offset at 0
leftoffsets = {'150', '122'}
downoffsets = {'145', '115'}
upoffsets = {'147', '122'}
rightoffsets = {'147', '123'}

-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'susie_neo idle'
left_xml_name = 'susie_neo left'
down_xml_name = 'susie_neo down'
up_xml_name = 'susie_neo up'
right_xml_name = 'susie_neo right'

-- basically horizontal and vertical positions
x_position = 950
y_position = 255

-- scales your character (set to 1 by default)
xScale = 0.7
yScale = 0.7

-- invisible character (so basically if you wanna use the change character event, you need to make the second character invisible first)
invisible = false

-- pretty self-explanitory
name_of_character_xml = 'susie_neo'
name_of_character = 'susie_neo'
name_of_notetype = 'Susie Sing neo'
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





function onUpdatePost()
    if hits < 1 then
        setProperty('scoreTxt.text', 'KROMER: 0 | [Combo Breaks]: 0 | Rating: ?')
    elseif misses < 1 then
        setProperty('scoreTxt.text', 'KROMER: ' .. score .. ' | [Combo Breaks]: ' .. misses .. ' | Rating: [' .. ratingName .. '] - ' ..  round(rating * 100, 2) .. '% [' .. ratingFC .. ']')
    else
        setProperty('scoreTxt.text', 'KROMER: ' .. score .. ' | [Combo Breaks]: ' .. misses .. ' | Rating: [' ..ratingName.. '] - ' ..  round(rating * 100, 2) .. '% [Clear]')
    end
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end






local Healed = false; --means the player did not heal yet

function onUpdate()
    if (getPropertyFromClass("up")) and Healed == false then --If you press F1 and haven't healed yet, then
        setProperty('health', 2); --heals you
        playSound('heal', 0.8); --plays heal sound
        playSound('bigshot', 1.5); --plays bigshot sound
        setRatingName('Big Shot'); --Funky rating name for funsies

        Healed = true; --lets game know you healed once

        makeAnimatedLuaSprite('heal','heal', 800, 350); --spamton pop up animation
        addAnimationByPrefix('heal','heal','heal', 15, false);
        objectPlayAnimation('heal','heal', true);
        scaleObject('heal', 0.3, 0.3);
        addLuaSprite('heal', true);
    end
end





function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.6 and curBeat > 31 and difficulty == 1 then
        setProperty('health', health- 0.022);
    end
end





local atkcounter = 0;
function goodNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote and difficulty == 1 then
		if atkcounter ~= 100 then
         atkcounter = atkcounter + 2
	    end
	setProperty('boobs.scale.y',atkcounter * 2)
	setProperty('boobs.origin.y', 1)
	end
	
	--makeLuaText('atkText', 'atk: ' .. atkcounter .. '%' , 300,1050,500)
end
function onCreatePost()

	if difficulty == 1 then

		makeLuaSprite('tits', '', 1156, 296)
		makeGraphic('tits', 83, 250, '380915')
		addLuaSprite('tits',false)
		setObjectCamera('tits','hud')

		makeLuaSprite('ass', '', 1160, 300)
		makeGraphic('ass', 75, 200, '120307')
		addLuaSprite('ass',false)
		setObjectCamera('ass','hud')

		makeLuaText('atkText', 'atk: ' .. atkcounter .. '%' , 300,1050,500)
		addLuaText('atkText')
		setTextSize('atkText', 35);
		setObjectCamera('atkText', 'hud')
		makeLuaSprite('boobs', '', 1160, 500)
		makeGraphic('boobs', 75, 1, 'FFA500')
		addLuaSprite('boobs',false)
		setObjectCamera('boobs','hud')
		setObjectCamera('atkText','hud')
		setProperty('boobs.alpha', 0.9)
		if atkcounter == 100 then 
			setProperty('boobs.alpha',1)
		end
	end
end

function onUpdate(elapsed)
	-- start of "update", some variables weren't updated yet
    setTextString('atkText',atkcounter .. '%' )
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and difficulty == 1 then
		if atkcounter == 100 then
			atkcounter = atkcounter - atkcounter 
			setProperty('boobs.scale.y',1)
			characterPlayAnim('girlfriend', 'heal', true)
			setProperty('girlfriend.specialAnim',true)
			setProperty('health',getProperty('health') + 1)
			playSound('heal', 0.8)
		end
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
    setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: THE SWEET TASTE OF [[NEO]]')
end

function onUpdate()
    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'DARKNESS')
    end
end




function onCreatePost()
	CamOffsetBF_X = 230
	CamOffsetDad_X = 470
	
	CamOffsetBF_Y = 300
	CamOffsetDad_Y = 250
	
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





function onBeatHit()

    if curBeat > 31 and curBeat < 104 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 115 and curBeat < 128 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 131 and curBeat < 160 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 163 and curBeat < 224 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 227 and curBeat < 252 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 259 and curBeat < 290 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 291 and curBeat < 323 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 331 and curBeat < 339 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 355 and curBeat < 448 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

end

function onStepHit()
	if curBeat > 388 and curBeat < 448 then
		if curStep % 4 == 0 then
			doTweenY('rrr', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('rtr', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
	end

    if curBeat > 0 then -- THIISSSSSSSSSSS SJAJFGSDGHFKSJHADFHJLSADHFAKJDSBJHFJDBJHFHJSDFBSDJKFBNSDJ CIT6Y CITYY CITY CITY
		doTweenX('CITY GO BRRR', 'neo_city', -1100+3800, 160, linear);
        doTweenX('CITY GO BRRR2', 'neo_city2', 200, 160, linear);
        doTweenX('CITY GO BRRR3', 'neo_amongus', -220+2891, 160, linear);
        doTweenX('CITY GO BRRR4', 'neo_amongus2', 200, 160, linear);
	end

	if curBeat > 388 and curBeat < 448 then
		if curStep % 4 == 0 then
			doTweenY('rrr', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('rtr', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
	end

end




