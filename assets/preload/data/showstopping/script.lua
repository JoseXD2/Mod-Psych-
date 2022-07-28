function onBeatHit()
    if curBeat > 31 and curBeat < 60 then
        triggerEvent('Add Camera Zoom', 0.03,0.04)
    end

    if curBeat > 63 and curBeat < 94 then
        triggerEvent('Add Camera Zoom', 0.03,0.04)
    end

    if curBeat > 111 and curBeat < 124 then
        triggerEvent('Add Camera Zoom', 0.03,0.04)
    end

    if curBeat > 127 and curBeat < 156 then
        triggerEvent('Add Camera Zoom', 0.03,0.04)
    end

    if curBeat > 159 and curBeat < 189 then
        triggerEvent('Add Camera Zoom', 0.03,0.04)
    end

    if curBeat > 0 then
		doTweenY('cock', 'mike_city', 1000, 90, 'linear')
		doTweenY('balls', 'mike_city_2', 1000, 130, 'linear')
        doTweenY('boobs big ones', 'mike_clouds', 0, 90, 'linear')
	end

    if curBeat == 188 then
		doTweenAlpha('mike_bg', 'mike_bg', 0, 2);
	end

    if curBeat == 192 then
		doTweenAlpha('mike_lights2', 'mike_lights2', 1, 0.5);
	end

    if curBeat == 256 then
        makeLuaSprite('dark', 'dark', -220, -100);
        scaleObject('dark', 3, 3);
        addLuaSprite('dark', true);
    end

end





function onStartCountdown()
    TriggerMan = getRandomInt(1, 30);

    if TriggerMan == 6  then
        loadSong('man', 1);
    else
        boobs = big
    end
end



local Healed = false; --means the player did not heal yet

function onUpdate()
    if (getPropertyFromClass("up")) and Healed == false then --If you press F1 and haven't healed yet, then
        setProperty('health', 2); --heals you
        playSound('heal', 0.8); --plays heal sound
        playSound('bigshot', 1.5); --plays bigshot sound
        setRatingName('Big Shot'); --Funky rating name for funsies

        Healed = true; --lets game know you healed once

        makeAnimatedLuaSprite('heal','heal', 290, 0); --spamton pop up animation
        addAnimationByPrefix('heal','heal','heal', 15, false);
        objectPlayAnimation('heal','heal', true);
        scaleObject('heal', 0.5, 0.5);
        addLuaSprite('heal', true);
    end
end




function onSongStart()
	keepScroll = false
	noteTweenX("NoteMove1", 0, -1000, 0.5, cubeInOut)
	noteTweenX("NoteMove2", 1, -1000, 0.5, cubeInOut)
	noteTweenX("NoteMove3", 2, -1000, 0.5, cubeInOut)
	noteTweenX("NoteMove4", 3, -1000, 0.5, cubeInOut)
end



function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 1.1 then
        setProperty('health', health- 0.01);
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
		playSound('BOOM')
	end

	if count == 2 then
		playSound('Mike_theme', 1.3, 'music')
	end

	if count == 4 then
		pauseSound('music')
	end

	if count == 6 then
		playSound('laugh', 0.45)
		resumeSound('music')
	end

	if count == 10 then
		stopSound('music')
	end

end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end





function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: Mike Engine')
end

function onUpdate()
    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'DARKNESS')
    end
end






function onCreate()

    if isStoryMode then
        makeLuaSprite('dark', 'dark', -220, -100);
        scaleObject('dark', 3, 3);
        addLuaSprite('dark', true);
    end
end




local boobs = true;

function onSongStart()
    if boobs == true then
        doTweenAlpha('dark', 'dark', 0, 0.5);
    end
end