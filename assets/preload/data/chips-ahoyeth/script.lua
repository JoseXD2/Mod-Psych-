function onCreate()
    precacheImage('bitch');
    precacheImage('queen');
    precacheImage('queen2');
end

function onBeatHit()

    if curBeat == 70 then
        makeAnimatedLuaSprite('queen2','queen2', 300, 0);
        addAnimationByPrefix('queen2','lmao','queen2', 24, false);--true or false to loop
        objectPlayAnimation('queen2','lmao', true);
        addLuaSprite('queen2', false);
    end

    if curBeat == 186 then
        makeAnimatedLuaSprite('queen','queen', 270, 0);
        addAnimationByPrefix('queen','oh','queen', 24, false);--true or false to loop
        objectPlayAnimation('queen','oh', true);
        addLuaSprite('queen', false);
    end

    if curBeat == 30 then
        makeAnimatedLuaSprite('bitch','bitch', 500, -500);
        addAnimationByPrefix('bitch','pop','bitch', 20, false);--true or false to loop
        objectPlayAnimation('bitch','pop', true);
        addLuaSprite('bitch', true);
        setObjectCamera('bitch', 'camOther');
        setProperty('bitch.angle', 180);
    end

    if curBeat == 245 then
        makeAnimatedLuaSprite('bitch','bitch', 500, -500);
        addAnimationByPrefix('bitch','pop','bitch', 19, false);--true or false to loop
        objectPlayAnimation('bitch','pop', true);
        addLuaSprite('bitch', true);
        setObjectCamera('bitch', 'camOther');
        setProperty('bitch.angle', 180);
    end
end






function onUpdate()
    if ratingName == '?' then
        setRatingName('...') --When there are no notes
    end
    if ratingName == 'You Suck!' then
        setRatingName('Thoust sucketh') --From 0% to 19% of accuracy
    end
    if ratingName == 'Shit' then
        setRatingName('Shiteth') --From 20% to 39% of accuracy
    end
    if ratingName == 'Bad' then
        setRatingName('Crappeth') --From 40% to 49% of accuracy
    end
    if ratingName == 'Bruh' then
        setRatingName('Bruh-eth') --From 50% to 59% of accuracy
    end
    if ratingName == 'Meh' then
        setRatingName('Mediumst') --From 60% to 68% of accuracy
    end
    if ratingName == 'Nice' then
        setRatingName('SEXETH??? HUH?') --69% of accuracy :bruh:
    end
    if ratingName == 'Good' then
        setRatingName('SHAKETH IN THINE BOOTSETH') --From 70% to 79% of accuracy
    end
    if ratingName == 'Great' then
        setRatingName('Nevereth doubtsted thou') --From 80% to 89% of accuracy
    end
    if ratingName == 'Sick!' then
        setRatingName('EXCEPTIONALETH') --From 90% to 99% of accuracy
    end
    if ratingName == 'Perfect!!' then
        setRatingName('GOD. DAMN IT.') --100% of accuracy
    end
    if ratingName == '?' and botPlay == true then
        setRatingName('CHEATERETH! HOW DARETH THOU') --When the botplay is activated
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
		startDialogue('dialogue', 'ruruskaado');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)

end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end





function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.title",'Freaketh on thine friday evening: Psyche Engineth')
end

function onUpdate()
    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'DARKNESS')
    end
end





function onCreate()
    if isStoryMode then
        makeLuaSprite('dark', 'dark', -300, -100);
        scaleObject('dark', 5, 5);
        addLuaSprite('dark', true);
    end
end

local boobs = true;

function onSongStart()
    if boobs == true then
        doTweenAlpha('dark', 'dark', 0, 0.5);
    end
end




function onBeatHit()
    if curBeat > 3 and curBeat < 60 then
        triggerEvent('Add Camera Zoom', 0.03,0.04)
    end

    if curBeat > 75 and curBeat < 108 then
        triggerEvent('Add Camera Zoom', 0.03,0.04)
    end

    if curBeat > 115 and curBeat < 171 then
        triggerEvent('Add Camera Zoom', 0.03,0.04)
    end

    if curBeat > 187 and curBeat < 250 then
        triggerEvent('Add Camera Zoom', 0.03,0.04)
    end

end



