local angleshit = 0.6;
local anglevar = 0.6;

function onBeatHit()
	if curBeat > 327 and curBeat < 392 then
		triggerEvent('Add Camera Zoom', 0.04,0.04)

		if curBeat % 2 == 0 then
			angleshit = anglevar;
		else
			angleshit = -anglevar;
		end
		setProperty('camHUD.angle',angleshit*3)
		setProperty('camGame.angle',angleshit*3)
		doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
		doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
		doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
		doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
	else
		setProperty('camHUD.angle',0)
		setProperty('camHUD.x',0)
		setProperty('camHUD.x',0)
	end
		
end

function onStepHit()
	if curBeat > 71 and curBeat < 168 then
		if curStep % 4 == 0 then
			doTweenY('rrr', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('rtr', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
	end

	if curBeat > 263 and curBeat < 392 then
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







function onUpdate(elapsed)
	if dadName == 'jevil' then --replace the name for your character name
	  if curStep >= 0 then
  
		songPos = getSongPosition()
  
		local currentBeat = (songPos/1000)*(bpm/110)
  
		doTweenY(dadTweenY, 'dad', 90-50*math.sin((currentBeat*0.25)*math.pi),0.001)

	  end
	end
end





function opponentNoteHit()

triggerEvent('Screen Shake','1,0.003')

end





-- 	Just so I don't get lost
-- Beat 8 (Song start)
-- Beat 24 (Seam sings)
-- Beat 40 (Beat starts)
-- Beat 72 (Chaos begins)
-- Beat 104 (Faster chaos)
-- Beat 136 (So no sapatinho agora o)
-- Beat 168 (Half time drop)
-- Beat 200 (Speeds up again (build-up)
-- Beat 232 (fake-out deltarune motif)
-- Beat 264 (KEY CHAAANGE BABEEYYYY)
-- bEAT 324 (bYE BYE)
-- Beat 328 (What the devilsknife does to a mf)
-- Beat 384 (Drums stop)
-- Beat 392 (Outro)

function onBeatHit()

	if difficulty == 2 then --hard
		if curBeat == 24 then
			noteTweenAngle( 'A0', 0 , 360 ,0.9 , CircInOut);
			noteTweenAngle( 'A1', 1 , 360 ,0.8 , CircInOut);
			noteTweenAngle( 'A2', 2 , 360 ,0.7 , CircInOut);
			noteTweenAngle( 'A3', 3 , 360 ,0.6 , CircInOut);
			noteTweenAngle( 'A4', 4 , 360 ,0.9 , CircInOut);
			noteTweenAngle( 'A5', 5 , 360 ,0.8 , CircInOut);
			noteTweenAngle( 'A6', 6 , 360 ,0.7 , CircInOut);
			noteTweenAngle( 'A7', 7 , 360 ,0.6 , CircInOut);
		end

		if curBeat == 56 then
			noteTweenAngle( 'A0', 0 , 0 ,0.9 , CircInOut);
			noteTweenAngle( 'A1', 1 , 0 ,0.8 , CircInOut);
			noteTweenAngle( 'A2', 2 , 0 ,0.7 , CircInOut);
			noteTweenAngle( 'A3', 3 , 0 ,0.6 , CircInOut);
			noteTweenAngle( 'A4', 4 , 0 ,0.9 , CircInOut);
			noteTweenAngle( 'A5', 5 , 0 ,0.8 , CircInOut);
			noteTweenAngle( 'A6', 6 , 0 ,0.7 , CircInOut);
			noteTweenAngle( 'A7', 7 , 0 ,0.6 , CircInOut);
		end

		if curBeat == 72 then
			noteTweenAngle( 'A0', 0 , 3600 ,30 , CircInOut);
			noteTweenAngle( 'A1', 1 , 3600 ,31 , CircInOut);
			noteTweenAngle( 'A2', 2 , 3600 ,32 , CircInOut);
			noteTweenAngle( 'A3', 3 , 3600 ,33 , CircInOut);
			noteTweenAngle( 'A4', 4 , 360 ,0.6 , CircInOut);
			noteTweenAngle( 'A5', 5 , 360 ,0.5 , CircInOut);
			noteTweenAngle( 'A6', 6 , 360 ,0.4 , CircInOut);
			noteTweenAngle( 'A7', 7 , 360 ,0.3 , CircInOut);
		end

		if curBeat == 200 then
			noteTweenAngle( 'A0', 0 , 0 ,8.9 , CircInOut);
			noteTweenAngle( 'A1', 1 , 0 ,8.85 , CircInOut);
			noteTweenAngle( 'A2', 2 , 0 ,8.8 , CircInOut);
			noteTweenAngle( 'A3', 3 , 0 ,8.75 , CircInOut);
			noteTweenAngle( 'A4', 4 , 0 ,2 , CircInOut);
			noteTweenAngle( 'A5', 5 , 0 ,2.2 , CircInOut);
			noteTweenAngle( 'A6', 6 , 0 ,2.8 , CircInOut);
			noteTweenAngle( 'A7', 7 , 0 ,3 , CircInOut);
		end

		if curBeat == 263 then
			noteTweenAngle( 'A0', 0 , 360 ,0.45 , CircInOut);
			noteTweenAngle( 'A1', 1 , 360 ,0.45 , CircInOut);
			noteTweenAngle( 'A2', 2 , 360 ,0.45 , CircInOut);
			noteTweenAngle( 'A3', 3 , 360 ,0.45 , CircInOut);
			noteTweenAngle( 'A4', 4 , 360 ,0.45 , CircInOut);
			noteTweenAngle( 'A5', 5 , 360 ,0.45 , CircInOut);
			noteTweenAngle( 'A6', 6 , 360 ,0.45 , CircInOut);
			noteTweenAngle( 'A7', 7 , 360 ,0.45 , CircInOut);
		end

		if curBeat == 264 then
			noteTweenAngle( 'A0', 0 , 3600 ,20.45 , CircInOut);
			noteTweenAngle( 'A1', 1 , 3600 ,20.45 , CircInOut);
			noteTweenAngle( 'A2', 2 , 3600 ,20.45 , CircInOut);
			noteTweenAngle( 'A3', 3 , 3600 ,20.45 , CircInOut);
		end

		if curBeat == 328 then
			noteTweenAngle( 'A0', 0 , 0 ,20.45 , CircInOut);
			noteTweenAngle( 'A1', 1 , 0 ,20.45 , CircInOut);
			noteTweenAngle( 'A2', 2 , 0 ,20.45 , CircInOut);
			noteTweenAngle( 'A3', 3 , 0 ,20.45 , CircInOut);
		end

		if curBeat == 392 then
			noteTweenAngle( 'A0', 0 , 360 ,1.45 , CircInOut);
			noteTweenAngle( 'A1', 1 , 360 ,2 , CircInOut);
			noteTweenAngle( 'A2', 2 , 360 ,2.45 , CircInOut);
			noteTweenAngle( 'A3', 3 , 360 ,3 , CircInOut);
			noteTweenAngle( 'A4', 4 , 360 ,1.45 , CircInOut);
			noteTweenAngle( 'A5', 5 , 360 ,2 , CircInOut);
			noteTweenAngle( 'A6', 6 , 360 ,2.45 , CircInOut);
			noteTweenAngle( 'A7', 7 , 360 ,3 , CircInOut);
		end
	end



	if difficulty == 3 then --CHAOS

		if curBeat == 8 then
			noteTweenAngle( 'A0', 0 , 180 ,0.45 , CircInOut);
			noteTweenAngle( 'A1', 1 , 180 ,0.45 , CircInOut);
			noteTweenAngle( 'A2', 2 , 180 ,0.45 , CircInOut);
			noteTweenAngle( 'A3', 3 , 180 ,0.45 , CircInOut);
		end

		if curBeat == 24 then
			noteTweenAngle( 'A4', 4 , 180 ,0.45 , CircInOut);
			noteTweenAngle( 'A5', 5 , 180 ,0.45 , CircInOut);
			noteTweenAngle( 'A6', 6 , 180 ,0.45 , CircInOut);
			noteTweenAngle( 'A7', 7 , 180 ,0.45 , CircInOut);
		end

		if curBeat == 40 then
			noteTweenAngle( 'A0', 0 , -180 ,0.85 , CircInOut);
			noteTweenAngle( 'A1', 1 , -180 ,0.85 , CircInOut);
			noteTweenAngle( 'A2', 2 , -180 ,0.85 , CircInOut);
			noteTweenAngle( 'A3', 3 , -180 ,0.85 , CircInOut);
		end

		if curBeat == 56 then
			noteTweenAngle( 'A4', 4 , -180 ,0.85 , CircInOut);
			noteTweenAngle( 'A5', 5 , -180 ,0.85 , CircInOut);
			noteTweenAngle( 'A6', 6 , -180 ,0.85 , CircInOut);
			noteTweenAngle( 'A7', 7 , -180 ,0.85 , CircInOut);
		end

		if curBeat == 71 then
			noteTweenAngle( 'A0', 0 , -100 ,0.9 , CircOut);
			noteTweenAngle( 'A1', 1 , 100 ,0.85 , CircOut);
			noteTweenAngle( 'A2', 2 , -100 ,0.8 , CircOut);
			noteTweenAngle( 'A3', 3 , 100 ,0.75 , CircOut);
			noteTweenAngle( 'A4', 4 , -100 ,0.9 , CircOut);
			noteTweenAngle( 'A5', 5 , 100 ,0.85 , CircOut);
			noteTweenAngle( 'A6', 6 , -100 ,0.8 , CircOut);
			noteTweenAngle( 'A7', 7 , 100 ,0.75 , CircOut);
		end

		if curBeat == 72 then
			noteTweenAngle( 'A0', 0 , 88000 ,800.9 , CircInOut);
			noteTweenAngle( 'A1', 1 , -88000 ,800.85 , CircInOut);
			noteTweenAngle( 'A2', 2 , 88000 ,800.8 , CircInOut);
			noteTweenAngle( 'A3', 3 , -88000 ,800.75 , CircInOut);
			noteTweenAngle( 'A4', 4 , 88000 ,800.9 , CircInOut);
			noteTweenAngle( 'A5', 5 , -88000 ,800.85 , CircInOut);
			noteTweenAngle( 'A6', 6 , 88000 ,800.8 , CircInOut);
			noteTweenAngle( 'A7', 7 , -88000 ,800.75 , CircInOut);
		end

		function opponentNoteHit()
			health = getProperty('health')
			if getProperty('health') > 0.35 then
				setProperty('health', health- 0.02);
			end
		end

	end



end







function onUpdate()
    if ratingName == '?' then
        setRatingName('...') --When there are no notes
    end
    if ratingName == 'You Suck!' then
        setRatingName('You suck, suck.') --From 0% to 19% of accuracy
    end
    if ratingName == 'Shit' then
        setRatingName('Hopeless, hopeless!') --From 20% to 39% of accuracy
    end
    if ratingName == 'Bad' then
        setRatingName('Truly sad, sad.') --From 40% to 49% of accuracy
    end
    if ratingName == 'Bruh' then
        setRatingName('Locked away!') --From 50% to 59% of accuracy
    end
    if ratingName == 'Meh' then
        setRatingName('A mischief, mischief.') --From 60% to 68% of accuracy
    end
    if ratingName == 'Nice' then
        setRatingName('Funny, funny!') --69% of accuracy :bruh:
    end
    if ratingName == 'Good' then
        setRatingName('Chaos!') --From 70% to 79% of accuracy
    end
    if ratingName == 'Great' then
        setRatingName('CHAOS, CHAOS!') --From 80% to 89% of accuracy
    end
    if ratingName == 'Sick!' then
        setRatingName('You can do anything!') --From 90% to 99% of accuracy
    end
    if ratingName == 'Perfect!!' then
        setRatingName('The true and neo chaos!') --100% of accuracy
    end
    if ratingName == '?' and botPlay == true then
        setRatingName('Cheater, cheater!') --When the botplay is activated
    end
end






function onEndSong()

    if isStoryMode then
        makeLuaSprite('dark', 'dark', -300, -100);
        scaleObject('dark', 5, 5);
        addLuaSprite('dark', true);
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
		startDialogue('dialogue', 'prejoker');
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
    setPropertyFromClass("openfl.Lib", "application.window.title",'CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS ')
end

function onUpdate()
    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'DARKNESS')
    end
end






function onCreate()
    precacheImage('carousel');
    precacheImage('carousel_everyman');
end

local carspeed = 2;
local carspeedHard = 2.5;

function onBeatHit()

    if difficulty == 3 then




        if curBeat == 72 then -- bottom cars    FIRST ROW
            makeLuaSprite('carousel','carousel', -2200, 450);
            setObjectCamera('carousel', 'camOther');
            addLuaSprite('carousel', true);
            scaleObject('carousel', 1.2, 1.2);
        end

        if curBeat > 0 then --bottom tween
            doTweenX('carouselx', 'carousel', 1500, carspeed, linear);
            doTweenY('carousely', 'carousel', getRandomInt(400, 480), 1, sineIn);
        end

        if curBeat == 72 then --top cars
            makeLuaSprite('carousel2','carousel', 1500, -100);
            setProperty('carousel2.angle', 180);
            setObjectCamera('carousel2', 'camOther');
            addLuaSprite('carousel2', true);
            scaleObject('carousel2', 1.2, 1.2);
        end

        if curBeat > 0 then --top tween
            doTweenX('carouselx2', 'carousel2', -2200, carspeed, linear);
            doTweenY('carousely2', 'carousel2', getRandomInt(-20, -100), 1, sineIn);
        end

        if curBeat == 104 then --cleanup
            removeLuaSprite('carousel');
            removeLuaSprite('carousel2');
        end









        if curBeat == 180 then -- bottom cars    SECOND ROW
            makeLuaSprite('carousel','carousel', -2200, 450);
            setObjectCamera('carousel', 'camOther');
            addLuaSprite('carousel', true);
            scaleObject('carousel', 1.2, 1.2);
        end

        if curBeat > 0 then --bottom tween
            doTweenX('carouselx', 'carousel', 1500, carspeed, linear);
            doTweenY('carousely', 'carousel', getRandomInt(400, 480), 1, sineIn);
        end

        if curBeat == 180 then --top cars
            makeLuaSprite('carousel2','carousel', 1500, -100);
            setProperty('carousel2.angle', 180);
            setObjectCamera('carousel2', 'camOther');
            addLuaSprite('carousel2', true);
            scaleObject('carousel2', 1.2, 1.2);
        end

        if curBeat > 0 then --top tween
            doTweenX('carouselx2', 'carousel2', -2200, carspeed, linear);
            doTweenY('carousely2', 'carousel2', getRandomInt(-20, -100), 1, sineIn);
        end

        if curBeat == 200 then --cleanup
            removeLuaSprite('carousel');
            removeLuaSprite('carousel2');
        end








        if curBeat == 264 then -- bottom cars    THIRD ROW
            makeLuaSprite('carousel','carousel', -2200, 450);
            setObjectCamera('carousel', 'camOther');
            addLuaSprite('carousel', true);
            scaleObject('carousel', 1.2, 1.2);
        end

        if curBeat > 0 then --bottom tween
            doTweenX('carouselx', 'carousel', 1500, carspeedHard, linear);
            doTweenY('carousely', 'carousel', getRandomInt(400, 480), 1, sineIn);
        end

        if curBeat == 264 then --top cars
            makeLuaSprite('carousel2','carousel', 1500, -100);
            setProperty('carousel2.angle', 180);
            setObjectCamera('carousel2', 'camOther');
            addLuaSprite('carousel2', true);
            scaleObject('carousel2', 1.2, 1.2);
        end

        if curBeat > 0 then --top tween
            doTweenX('carouselx2', 'carousel2', -2200, carspeedHard, linear);
            doTweenY('carousely2', 'carousel2', getRandomInt(-20, -100), 1, sineIn);
        end

        if curBeat == 300 then --cleanup
            removeLuaSprite('carousel');
            removeLuaSprite('carousel2');
        end




        if curBeat == 332 then -- bottom cars    FINAL ROW

            sex = getRandomInt(1, 2);

            if sex == 2 then
                makeLuaSprite('carousel','carousel', -2200, 450);
                setObjectCamera('carousel', 'camOther');
                addLuaSprite('carousel', true);
                scaleObject('carousel', 1.2, 1.2);
            else
                makeLuaSprite('carousel','carousel_everyman', -2200, 450);
                setObjectCamera('carousel', 'camOther');
                addLuaSprite('carousel', true);
                scaleObject('carousel', 1.2, 1.2);
            end
        end

        if curBeat > 0 then --bottom tween
            doTweenX('carouselx', 'carousel', 1500, carspeed, linear);
            doTweenY('carousely', 'carousel', getRandomInt(400, 480), 1, sineIn);
        end

        if curBeat == 330 then --top cars
            makeLuaSprite('carousel2','carousel', 1500, -100);
            setProperty('carousel2.angle', 180);
            setObjectCamera('carousel2', 'camOther');
            addLuaSprite('carousel2', true);
            scaleObject('carousel2', 1.2, 1.2);
        end

        if curBeat > 0 then --top tween
            doTweenX('carouselx2', 'carousel2', -2200, carspeed, linear);
            doTweenY('carousely2', 'carousel2', getRandomInt(-20, -100), 1, sineIn);
        end

        if curBeat == 360 then --cleanup
            removeLuaSprite('carousel');
            removeLuaSprite('carousel2');
        end



    end
end





function onBeatHit()
    if curBeat == 428 then
        makeLuaSprite('dark', 'dark', -220, -100);
        scaleObject('dark', 3, 3);
        addLuaSprite('dark', true);
    end
end



