local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('thd_identity:server:createCharacter', function(data)
    local src = source
    
    -- QBCore create yapısı için veri hazırlığı
    local newData = {}
    newData.cid = data.cid or nil -- Eğer multichar'dan slot ID geliyorsa buraya eklenmeli
    newData.charinfo = {
        firstname = data.firstname,
        lastname = data.lastname,
        birthdate = data.birthdate,
        gender = tonumber(data.gender),
        nationality = data.nationality
    }
    
    -- Eğer newData.cid verilmezse QBCore otomatik ilk boş slotu bulur.
    -- QBCore.Player.Login(source, citizenid/false, newData)
    -- İkinci parametre 'false' olduğunda ve 'newData' verildiğinde yeni karakter oluşturur.
    
    if QBCore.Player.Login(src, false, newData) then
        print('^2[THD Identity] ^7Yeni karakter oluşturuldu: ' .. data.firstname .. ' ' .. data.lastname)
        
        -- Karakter oluşturulduktan sonra yapılacak işlemler
        -- Örn: Başlangıç parası, envanter vb. (QBCore bunları genellikle otomatik yapar)
        
        -- Spawn Seçim ekranını tetikleme (qb-spawn veya thd_spawn)
        -- QBCore default olarak 'qb-spawn:client:setupSpawns' eventini tetikler.
        
        TriggerClientEvent('QBCore:Client:OnPlayerLoaded', src)

        -- illenium-appearance karakter menüsünü aç
        TriggerClientEvent('qb-clothes:client:CreateFirstCharacter', src)

        -- Yeni karakter için spawn konumuna gönder (Multichar'daki spawn eventini kullanıyoruz)
        local pos = QBCore.Config.DefaultSpawn
        TriggerClientEvent('thd_multichar:client:spawn', src, pos)
        
        -- Bucket düzeltme (Multichar genelde farklı bucketta çalışır)
        SetPlayerRoutingBucket(src, 0)
    end
end)