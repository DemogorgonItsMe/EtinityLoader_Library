local Loader = {}
Loader.__index = Loader

function Loader.new(settings)
    local self = setmetatable({}, Loader)
    
    self.Settings = {
        Title = "Premium Loader",
        TitleColor = Color3.fromRGB(100, 200, 255),
        BackgroundColor = Color3.fromRGB(15, 15, 25),
        LoadingColor = Color3.fromRGB(100, 200, 255),
        LoadingTime = 5,
        LoadingTips = {"Initializing components...", "Loading modules...", "Almost done..."},
        TipsColor = Color3.fromRGB(180, 180, 180),
        CircleRadius = 60,
        CircleColor = Color3.fromRGB(100, 200, 255),
        CircleSpeed = 1.2,
        ShowProgress = true,
        ShowTips = true,
        ShowAnimation = true,
        SoundEnabled = false,
        SoundId = "rbxassetid://9047378732",
        BlurBackground = true,
        BlurIntensity = 24,
        Author = "Premium Developer",
        AuthorColor = Color3.fromRGB(160, 160, 160),
        Version = "v2.1.0",
        VersionColor = Color3.fromRGB(120, 120, 120),
        ShowWatermark = true,
        WatermarkText = "PREMIUM LOADER",
        WatermarkColor = Color3.fromRGB(80, 80, 80),
        BorderEnabled = true,
        BorderColor = Color3.fromRGB(40, 50, 60),
        BorderThickness = 1,
        OnComplete = function() end
    }

    for k, v in pairs(settings) do
        if self.Settings[k] ~= nil then
            self.Settings[k] = v
        end
    end

    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = "PremiumLoaderUI"
    self.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    self.ScreenGui.ResetOnSpawn = false
    self.ScreenGui.Parent = game:GetService("CoreGui")

    if self.Settings.BlurBackground then
        self.BlurEffect = Instance.new("BlurEffect")
        self.BlurEffect.Size = 6
        self.BlurEffect.Parent = game:GetService("Lighting")
        game:GetService("TweenService"):Create(
            self.BlurEffect,
            TweenInfo.new(0.5),
            {Size = self.Settings.BlurIntensity}
        ):Play()
    end

    self.MainFrame = Instance.new("Frame")
    self.MainFrame.Size = UDim2.new(0, 420, 0, 340)
    self.MainFrame.Position = UDim2.new(0.5, -210, 0.5, -170)
    self.MainFrame.BackgroundColor3 = self.Settings.BackgroundColor
    self.MainFrame.BackgroundTransparency = 0.1
    self.MainFrame.Parent = self.ScreenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = self.MainFrame

    if self.Settings.BorderEnabled then
        local border = Instance.new("UIStroke")
        border.Color = self.Settings.BorderColor
        border.Thickness = self.Settings.BorderThickness
        border.Transparency = 0.3
        border.Parent = self.MainFrame
    end

    local glow = Instance.new("ImageLabel")
    glow.Name = "GlowEffect"
    glow.Size = UDim2.new(1.2, 0, 1.2, 0)
    glow.Position = UDim2.new(-0.1, 0, -0.1, 0)
    glow.Image = "rbxassetid://5028857084"
    glow.ImageColor3 = self.Settings.CircleColor
    glow.ImageTransparency = 0.9
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(24, 24, 276, 276)
    glow.BackgroundTransparency = 1
    glow.ZIndex = -1
    glow.Parent = self.MainFrame

    self.TitleLabel = Instance.new("TextLabel")
    self.TitleLabel.Size = UDim2.new(1, -40, 0, 36)
    self.TitleLabel.Position = UDim2.new(0, 20, 0, 20)
    self.TitleLabel.BackgroundTransparency = 1
    self.TitleLabel.Text = self.Settings.Title
    self.TitleLabel.TextColor3 = self.Settings.TitleColor
    self.TitleLabel.TextSize = 26
    self.TitleLabel.Font = Enum.Font.GothamSemibold
    self.TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    self.TitleLabel.Parent = self.MainFrame

    local titleLine = Instance.new("Frame")
    titleLine.Size = UDim2.new(1, -40, 0, 1)
    titleLine.Position = UDim2.new(0, 20, 0, 65)
    titleLine.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    titleLine.BorderSizePixel = 0
    titleLine.Parent = self.MainFrame

    self.AuthorLabel = Instance.new("TextLabel")
    self.AuthorLabel.Size = UDim2.new(1, -40, 0, 20)
    self.AuthorLabel.Position = UDim2.new(0, 20, 0, 75)
    self.AuthorLabel.BackgroundTransparency = 1
    self.AuthorLabel.Text = "by "..self.Settings.Author
    self.AuthorLabel.TextColor3 = self.Settings.AuthorColor
    self.AuthorLabel.TextSize = 16
    self.AuthorLabel.Font = Enum.Font.Gotham
    self.AuthorLabel.TextXAlignment = Enum.TextXAlignment.Left
    self.AuthorLabel.Parent = self.MainFrame

    self.VersionLabel = Instance.new("TextLabel")
    self.VersionLabel.Size = UDim2.new(1, -40, 0, 18)
    self.VersionLabel.Position = UDim2.new(0, 20, 0, 100)
    self.VersionLabel.BackgroundTransparency = 1
    self.VersionLabel.Text = self.Settings.Version
    self.VersionLabel.TextColor3 = self.Settings.VersionColor
    self.VersionLabel.TextSize = 14
    self.VersionLabel.Font = Enum.Font.Gotham
    self.VersionLabel.TextXAlignment = Enum.TextXAlignment.Left
    self.VersionLabel.Parent = self.MainFrame

    self.AnimationContainer = Instance.new("Frame")
    self.AnimationContainer.Size = UDim2.new(1, -40, 0, 100)
    self.AnimationContainer.Position = UDim2.new(0, 20, 0, 130)
    self.AnimationContainer.BackgroundTransparency = 1
    self.AnimationContainer.Parent = self.MainFrame

    self.ProgressBar = Instance.new("Frame")
    self.ProgressBar.Size = UDim2.new(1, -40, 0, 6)
    self.ProgressBar.Position = UDim2.new(0, 20, 0, 250)
    self.ProgressBar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    self.ProgressBar.BorderSizePixel = 0
    self.ProgressBar.Parent = self.MainFrame

    local progressCorner = Instance.new("UICorner")
    progressCorner.CornerRadius = UDim.new(1, 0)
    progressCorner.Parent = self.ProgressBar

    self.ProgressFill = Instance.new("Frame")
    self.ProgressFill.Size = UDim2.new(0, 0, 1, 0)
    self.ProgressFill.BackgroundColor3 = self.Settings.LoadingColor
    self.ProgressFill.BorderSizePixel = 0
    self.ProgressFill.Parent = self.ProgressBar

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = self.ProgressFill

    self.TipsLabel = Instance.new("TextLabel")
    self.TipsLabel.Size = UDim2.new(1, -40, 0, 24)
    self.TipsLabel.Position = UDim2.new(0, 20, 0, 265)
    self.TipsLabel.BackgroundTransparency = 1
    self.TipsLabel.Text = ""
    self.TipsLabel.TextColor3 = self.Settings.TipsColor
    self.TipsLabel.TextSize = 16
    self.TipsLabel.Font = Enum.Font.Gotham
    self.TipsLabel.TextXAlignment = Enum.TextXAlignment.Left
    self.TipsLabel.Parent = self.MainFrame

    if self.Settings.ShowWatermark then
        self.WatermarkLabel = Instance.new("TextLabel")
        self.WatermarkLabel.Size = UDim2.new(1, 0, 0, 20)
        self.WatermarkLabel.Position = UDim2.new(0, 0, 1, -25)
        self.WatermarkLabel.BackgroundTransparency = 1
        self.WatermarkLabel.Text = self.Settings.WatermarkText
        self.WatermarkLabel.TextColor3 = self.Settings.WatermarkColor
        self.WatermarkLabel.TextSize = 14
        self.WatermarkLabel.Font = Enum.Font.Gotham
        self.WatermarkLabel.Parent = self.MainFrame
    end

    if self.Settings.ShowAnimation then
        self.Circle = Instance.new("Frame")
        self.Circle.Size = UDim2.new(0, self.Settings.CircleRadius, 0, self.Settings.CircleRadius)
        self.Circle.Position = UDim2.new(0.5, -self.Settings.CircleRadius/2, 0.5, -self.Settings.CircleRadius/2)
        self.Circle.BackgroundColor3 = self.Settings.CircleColor
        self.Circle.BackgroundTransparency = 0.6
        self.Circle.BorderSizePixel = 0
        
        local circleCorner = Instance.new("UICorner")
        circleCorner.CornerRadius = UDim.new(1, 0)
        circleCorner.Parent = self.Circle
        
        local circleGlow = Instance.new("ImageLabel")
        circleGlow.Size = UDim2.new(2, 0, 2, 0)
        circleGlow.Position = UDim2.new(-0.5, 0, -0.5, 0)
        circleGlow.Image = "rbxassetid://5028857084"
        circleGlow.ImageColor3 = self.Settings.CircleColor
        circleGlow.ImageTransparency = 0.85
        circleGlow.BackgroundTransparency = 1
        circleGlow.ZIndex = -1
        circleGlow.Parent = self.Circle
        
        self.Circle.Parent = self.AnimationContainer
        
        for i = 1, 8 do
            local particle = Instance.new("Frame")
            particle.Name = "Particle_"..i
            particle.Size = UDim2.new(0, 12, 0, 12)
            particle.BackgroundColor3 = self.Settings.CircleColor
            particle.BackgroundTransparency = 0.5
            particle.BorderSizePixel = 0
            
            local pCorner = Instance.new("UICorner")
            pCorner.CornerRadius = UDim.new(1, 0)
            pCorner.Parent = particle
            
            local pGlow = Instance.new("ImageLabel")
            pGlow.Size = UDim2.new(2, 0, 2, 0)
            pGlow.Position = UDim2.new(-0.5, 0, -0.5, 0)
            pGlow.Image = "rbxassetid://5028857084"
            pGlow.ImageColor3 = self.Settings.CircleColor
            pGlow.ImageTransparency = 0.9
            pGlow.BackgroundTransparency = 1
            pGlow.ZIndex = -1
            pGlow.Parent = particle
            
            particle.Parent = self.AnimationContainer
        end
    end

    if self.Settings.SoundEnabled then
        self.Sound = Instance.new("Sound")
        self.Sound.SoundId = self.Settings.SoundId
        self.Sound.Volume = 0.3
        self.Sound.Looped = true
        self.Sound.Parent = self.ScreenGui
        self.Sound:Play()
    end

    return self
end

function Loader:AnimateLoading()
    local startTime = tick()
    local endTime = startTime + self.Settings.LoadingTime
    local lastTipChange = 0
    local currentTipIndex = 1

    local rotationConn
    if self.Settings.ShowAnimation then
        rotationConn = game:GetService("RunService").RenderStepped:Connect(function()
            local now = tick()
            local elapsed = now - startTime
            local progress = math.min(elapsed / self.Settings.LoadingTime, 1)
            
            self.Circle.Rotation = elapsed * 40 * self.Settings.CircleSpeed
            
            for i = 1, 8 do
                local particle = self.AnimationContainer:FindFirstChild("Particle_"..i)
                if particle then
                    local angle = math.rad((i * 45) + (elapsed * 200 * self.Settings.CircleSpeed))
                    local distance = self.Settings.CircleRadius + 35
                    local x = math.cos(angle) * distance
                    local y = math.sin(angle) * distance
                    
                    particle.Position = UDim2.new(0.5, x - 6, 0.5, y - 6)
                    
                    local scale = 0.7 + 0.3 * math.sin(elapsed * 5 + i)
                    particle.Size = UDim2.new(0, 12 * scale, 0, 12 * scale)
                end
            end
            
            if self.Settings.ShowProgress then
                self.ProgressFill.Size = UDim2.new(progress, 0, 1, 0)
            end
            
            if self.Settings.ShowTips and now - lastTipChange > 2.5 and #self.Settings.LoadingTips > 0 then
                lastTipChange = now
                currentTipIndex = currentTipIndex % #self.Settings.LoadingTips + 1
                self.TipsLabel.Text = self.Settings.LoadingTips[currentTipIndex]
                self.TipsLabel.TextTransparency = 1
                game:GetService("TweenService"):Create(
                    self.TipsLabel,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                    {TextTransparency = 0}
                ):Play()
            end
            
            if progress >= 1 then
                rotationConn:Disconnect()
                self:CompleteLoading()
            end
        end)
    else
        local simpleConn = game:GetService("RunService").Heartbeat:Connect(function()
            local now = tick()
            local progress = math.min((now - startTime) / self.Settings.LoadingTime, 1)
            
            if self.Settings.ShowProgress then
                self.ProgressFill.Size = UDim2.new(progress, 0, 1, 0)
            end
            
            if self.Settings.ShowTips and now - lastTipChange > 2.5 and #self.Settings.LoadingTips > 0 then
                lastTipChange = now
                currentTipIndex = currentTipIndex % #self.Settings.LoadingTips + 1
                self.TipsLabel.Text = self.Settings.LoadingTips[currentTipIndex]
                self.TipsLabel.TextTransparency = 1
                game:GetService("TweenService"):Create(
                    self.TipsLabel,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quint),
                    {TextTransparency = 0}
                ):Play()
            end
            
            if progress >= 1 then
                simpleConn:Disconnect()
                self:CompleteLoading()
            end
        end)
    end
end

function Loader:CompleteLoading()
    local fadeOut = game:GetService("TweenService"):Create(
        self.MainFrame,
        TweenInfo.new(0.6, Enum.EasingStyle.Quint),
        {BackgroundTransparency = 1}
    )
    fadeOut:Play()

    for _, child in ipairs(self.MainFrame:GetDescendants()) do
        if child:IsA("TextLabel") or child:IsA("TextButton") then
            game:GetService("TweenService"):Create(
                child,
                TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                {TextTransparency = 1}
            ):Play()
        elseif child:IsA("Frame") then
            game:GetService("TweenService"):Create(
                child,
                TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                {BackgroundTransparency = 1}
            ):Play()
        elseif child:IsA("ImageLabel") then
            game:GetService("TweenService"):Create(
                child,
                TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                {ImageTransparency = 1}
            ):Play()
        end
    end

    if self.Settings.BlurBackground and self.BlurEffect then
        game:GetService("TweenService"):Create(
            self.BlurEffect,
            TweenInfo.new(0.6, Enum.EasingStyle.Quint),
            {Size = 0}
        ):Play()
    end

    if self.Settings.SoundEnabled and self.Sound then
        self.Sound:Stop()
    end

    fadeOut.Completed:Wait()
    self.ScreenGui:Destroy()
    
    if type(self.Settings.OnComplete) == "function" then
        self.Settings.OnComplete()
    end
end

function Loader:Start()
    self:AnimateLoading()
end

return function(settings)
    local loader = Loader.new(settings)
    loader:Start()
    return loader
end
