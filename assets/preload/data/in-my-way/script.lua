function onStepHit()
    if difficulty == 2 then
        health = getProperty('health')

        if curStep == 560 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 688 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 704 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 728 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 732 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 768 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 784 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 800 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 848 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 864 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 880 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 896 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 912 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 960 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 968 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 972 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 974 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 976 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 992 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 1023 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 1056 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 1080 then
            if getProperty('health') > 1 then
                setProperty('health', health- 0.6);
            end
        end

        if curStep == 1084 then
            setProperty('health', 0.3);
        end
    end
end





function onUpdate()
    if ratingName == '?' then
        setRatingName('...') --When there are no notes
    end
    if ratingName == 'You Suck!' then
        setRatingName('Fucking hell youre terrible.') --From 0% to 19% of accuracy
    end
    if ratingName == 'Shit' then
        setRatingName('You suck ass.') --From 20% to 39% of accuracy
    end
    if ratingName == 'Bad' then
        setRatingName('You suck.') --From 40% to 49% of accuracy
    end
    if ratingName == 'Bruh' then
        setRatingName('Gonna cry?') --From 50% to 59% of accuracy
    end
    if ratingName == 'Meh' then
        setRatingName('Get crushed, dumbass.') --From 60% to 68% of accuracy
    end
    if ratingName == 'Nice' then
        setRatingName('Sex') --69% of accuracy :bruh:
    end
    if ratingName == 'Good' then
        setRatingName('Stay still.') --From 70% to 79% of accuracy
    end
    if ratingName == 'Great' then
        setRatingName('Stop resisting!') --From 80% to 89% of accuracy
    end
    if ratingName == 'Sick!' then
        setRatingName('Not bad.') --From 90% to 99% of accuracy
    end
    if ratingName == 'Perfect!!' then
        setRatingName('How the hell--') --100% of accuracy
    end
    if ratingName == '?' and botPlay == true then
        setRatingName('Cringe.') --When the botplay is activated
    end
end





function onEndSong()

    if isStoryMode then
        makeLuaSprite('dark2', 'dark', -300, -100);
        scaleObject('dark2', 5, 5);
        addLuaSprite('dark2', true);
    end

    if not allowEnd then
        setProperty('inCutscene', true);
        startDialogue('post-dialogue', '');
        allowEnd = true;
        return Function_Stop;
    end

    return Function_Continue;

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

end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end





function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin: !@!$ Engine')
end

function onUpdate()
    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'DARKNESS')
    end
end





function onCreate()
    makeLuaSprite('dark', 'dark', -220, -100);
    scaleObject('dark', 3, 3);
    addLuaSprite('dark', true);
end

local boobs = true;

function onSongStart()
    if boobs == true then
        doTweenAlpha('dark', 'dark', 0, 0.5);
    end
end



