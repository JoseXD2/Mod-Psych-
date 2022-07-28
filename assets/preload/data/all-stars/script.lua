function onCreate()
    precacheImage('bitch');
end

function onBeatHit()
    if curBeat == 48 then

        if not middlescroll then
            makeAnimatedLuaSprite('bitch','bitch', 500, -550);
            addAnimationByPrefix('bitch','pop','bitch', 20, false);--true or false to loop
            objectPlayAnimation('bitch','pop', true);
            addLuaSprite('bitch', true);
            setObjectCamera('bitch', 'camOther');
            setProperty('bitch.angle', 180);

            makeAnimatedLuaSprite('bitch2','bitch', 500, 330);
            addAnimationByPrefix('bitch2','pop','bitch', 20, false);--true or false to loop
            objectPlayAnimation('bitch2','pop', true);
            addLuaSprite('bitch2', true);
            setObjectCamera('bitch2', 'camOther');
        else
            makeAnimatedLuaSprite('bitch','bitch', 150, -570);
            addAnimationByPrefix('bitch','pop','bitch', 20, false);--true or false to loop
            objectPlayAnimation('bitch','pop', true);
            addLuaSprite('bitch', true);
            setObjectCamera('bitch', 'camOther');
            setProperty('bitch.angle', 180);

            makeAnimatedLuaSprite('bitch2','bitch', 150, 330);
            addAnimationByPrefix('bitch2','pop','bitch', 20, false);--true or false to loop
            objectPlayAnimation('bitch2','pop', true);
            addLuaSprite('bitch2', true);
            setObjectCamera('bitch2', 'camOther');
        end
    end
end






function onCreatePost()

	if not middlescroll then
		makeLuaSprite('thebettersee01', '', 730, 0)
		makeGraphic('thebettersee01', 470, 720, '000000')
		addLuaSprite('thebettersee01',false)
		setObjectCamera('thebettersee01','hud')
		setProperty('thebettersee01.alpha', 0.65)
	else
		makeLuaSprite('thebettersee01', '', 400, 0)
		makeGraphic('thebettersee01', 470, 720, '000000')
		addLuaSprite('thebettersee01',false)
		setObjectCamera('thebettersee01','hud')
		setProperty('thebettersee01.alpha', 0.65)
	end

end

function onUpdate()
	if curBeat == 304 then
		noteTweenAngle( 'A0', 0 , 360 ,0.6 , CircInOut);
		noteTweenAngle( 'A1', 1 , 360 ,0.5 , CircInOut);
		noteTweenAngle( 'A2', 2 , 360 ,0.8 , CircInOut);
		noteTweenAngle( 'A3', 3 , 360 ,0.2 , CircInOut);
		noteTweenAngle( 'A4', 4 , 360 ,0.3 , CircInOut);
		noteTweenAngle( 'A5', 5 , 360 ,0.2 , CircInOut);
		noteTweenAngle( 'A6', 6 , 360 ,0.4 , CircInOut);
		noteTweenAngle( 'A7', 7 , 360 ,0.3 , CircInOut);
	end
end





local Healed = false; --means the player did not heal yet

function onUpdate()
    if (getPropertyFromClass("up")) and Healed == false and curBeat > 655 then --If you press F1 and haven't healed yet, then
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




function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - Intro')
end

function onUpdate()
    if curBeat == 32 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - Chips Ahoyeth (reprise)')
    end

    if curBeat == 144 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - In My Way (reprise)')
    end

    if curBeat == 272 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - Ragdoll Chaos (reprise)')
    end

    if curBeat == 400 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - Showstopping (reprise)')
    end

    if curBeat == 528 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - Smile Award (reprise)')
    end

    if curBeat == 656 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - HYPERLINK (reprise)')
    end

    if curBeat == 768 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - [[OST: Ugh]]')
    end

    if curBeat == 800 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - Don`t Forget')
    end



    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'DARKNESS')
    end
end