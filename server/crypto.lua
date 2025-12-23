local function getIdentifier(src)
    if Config.Framework == 'esx' then
        return Framework.GetPlayerFromId(src).identifier
    else
        return Framework.Functions.GetPlayer(src).PlayerData.citizenid
    end
end

RegisterNetEvent('lb-phone:getCrypto', function(cb)
    local id = getIdentifier(source)

    local result = MySQL.query.await(
        'SELECT balance FROM phone_crypto_wallets WHERE identifier = ?',
        { id }
    )

    if not result[1] then
        MySQL.insert(
            'INSERT INTO phone_crypto_wallets (identifier) VALUES (?)',
            { id }
        )
        cb(0)
    else
        cb(result[1].balance)
    end
end)

RegisterNetEvent('lb-phone:addCrypto', function(amount)
    local id = getIdentifier(source)
    MySQL.update(
        'UPDATE phone_crypto_wallets SET balance = balance + ? WHERE identifier = ?',
        { amount, id }
    )
end)
