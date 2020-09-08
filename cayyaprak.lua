AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Çay Falı"
ENT.Category = "CesaKehanet"
ENT.Author = ""
ENT.Model = ""
ENT.Instructions = ""

ENT.Spawnable = true
ENT.AdminOnly = false


if SERVER then

    function ENT:Initialize()

        self:SetModel("models/props_junk/garbage_coffeemug001a.mdl")
        self:SetModelScale(0.9)
        self:PhysicsInit( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        self:SetUseType( SIMPLE_USE )

    end

		    function ENT:Use(activator, caller)

		        local kehanetler = {

		            "Bıçak",
		            "Meşe Palamudu",
		            "Mektup",
		            "Kurukafa",
		            "Sopa",
		            "Haç işareti",
		            "Kara Bulut",
		            "Yelpaze",
		            "Kartal",
		            "Kalp",
		            "Eldiven",
                    "Kafes",
                    "Anahtar"

		        }

		        local kehanetler = table.Random(kehanetler)

		        activator:ChatPrint("[Kehanet Sistemi] Çay Falına göre gördüğün bir " .. kehanetler )

		    end

else

    function ENT:Draw()
        self:DrawModel()
        if not HpwRewrite.CVars.DrawBookText:GetBool() then return end
        local pos = self:LocalToWorld(self:OBBCenter()) + vector_up * (self:OBBMaxs().z + 6)
        local ang = (pos - EyePos()):Angle()
        local a = 170 - math.Clamp(self:GetPos():Distance(EyePos()) * 0.8, 0, 170)
        cam.Start3D2D(pos, Angle(0, ang.y - 90, -ang.p + 90), 0.05)
        local name = "Çay Falı"
        local color = Color(255, 255, 255, a + math.sin(CurTime() * 5) * a * 0.3)
        draw.SimpleText(name, "HPW_fontbig", 0, 0, color, TEXT_ALIGN_CENTER)

        cam.End3D2D()
    end

end