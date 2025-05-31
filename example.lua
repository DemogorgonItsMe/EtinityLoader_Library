local Loader = loadstring(game:HttpGet("https://raw.githubusercontent.com/DemogorgonItsMe/EtinityLoader_Library/refs/heads/main/source.lua"))()

local settings = {
    Title = "Etinity", -- main title
    TitleColor = Color3.fromRGB(0, 255, 200), -- text color
    BackgroundColor = Color3.fromRGB(10, 15, 20), -- background color
    LoadingColor = Color3.fromRGB(0, 255, 200), -- process bar color
    LoadingTime = 5, -- loading time
    LoadingTips = { -- 
        "Loading...",
        "https://discord.gg/X2dVte9r2d",
        "Almost ready...",
        "Library by Demogorgon!"
    },
    TipsColor = Color3.fromRGB(160, 160, 160), -- tips text color
    CircleRadius = 20, -- circle radius (size)
    CircleColor = Color3.fromRGB(0, 255, 200), -- circle color
    CircleSpeed = 1, -- Circle spin speed
    BlurBackground = true, -- Blur (true/false)
    BlurIntensity = 28, -- blur
    Author = "Demogorgon", -- credits label (you can change it)
    AuthorColor = Color3.fromRGB(150, 150, 150), -- credits label text color
    Version = "V1", -- 
    VersionColor = Color3.fromRGB(100, 100, 100),
    ShowWatermark = true, -- It's like second credits
    WatermarkText = "", -- text here
    WatermarkColor = Color3.fromRGB(70, 70, 70), -- text color
    WatermarkTransparency = 0.8, -- uh i'm too lazy to explain everything else, I think you can understand it that way
    BorderEnabled = true,
    BorderColor = Color3.fromRGB(0, 200, 150),
    BorderThickness = 1,
    GlowIntensity = 0.9,
    ParticleCount = 10,
    EnablePulseEffect = true,
    SoundEnabled = true, -- true/false
    SoundId = "rbxassetid://125090389445721", -- sound while loading
    OnComplete = function()
        -- PUT YOUR SCRIPT HERE (starts after the loader)
        -- EXAMPLE:
        print("Etinity Loader successfully loaded!")
    end
}

Loader(settings)
