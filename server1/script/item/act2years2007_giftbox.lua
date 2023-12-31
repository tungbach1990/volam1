--越南两周年活动，礼品盒
--fmz
--
--
ACT2YEAR_TWhiteBoxRan = {
    tRan = {1000},
    tItemID = { {6,1,1442}},
    tItemName = {"B竛h b玭g lan"}
}
--
ACT2YEAR_TBlueBoxRan = {
    tRan = {10,15,25,125,175,195,295,1000},
    tItemID = {
        {6,1,23},
        {6,1,12},
        {4,353,1},
        {6,1,147,1},
        {6,1,147,2},
        {6,1,147,3},
        {6,1,125},
        {6,1,1443},
    },
    tItemName = {"Thi誸 La H竛","B祅 Nhc T﹎ Kinh","Tinh H錸g B秓 Th筩h","Huy襫 Tinh Kho竛g Th筩h c蕄 1","Huy襫 Tinh Kho竛g Th筩h c蕄 2","Huy襫 Tinh Kho竛g Th筩h c蕄 3",
    "Qu� Hoa T鰑","B竛h kem",}
}
--
ACT2YEAR_TYellowBoxRan = {
    tRan = {30,124,174,194,344,944,946,948,950,952,954,956,958,960,962,964,966,968,970,972,974,976,978,980,982,984,986,988,990,992,994,996,998,1000,},
    tItemID = {
        {6,1,23},
        {6,1,147,2},
        {6,1,147,3},
        {6,1,147,4},
        {4,239,1},
        {6,1,1444},
        {6,1,27},
        {6,1,28},
        {6,1,33},
        {6,1,34},
        --{6,1,35},
        {6,1,36},
        {6,1,37},
        {6,1,38},
        {6,1,39},
        {6,1,40},
        {6,1,41},
        {6,1,42},
        {6,1,43},
        {6,1,45},
        {6,1,46},
        {6,1,47},
        {6,1,48},
        {6,1,49},
        {6,1,50},
        {6,1,51},
        {6,1,52},
        {6,1,53},
        {6,1,54},
        {6,1,55},
        {6,1,56},
        {6,1,57},
        {6,1,58},
        {6,1,59},
    },
    tItemName = {"Thi誸 La H竛","Huy襫 Tinh Kho竛g Th筩h c蕄 2","Huy襫 Tinh Kho竛g Th筩h c蕄 3","Huy襫 Tinh Kho竛g Th筩h c蕄 4","T� Th駓 Tinh","B竛h kem c bi謙","T� Ti詎 thu藅. B筼 V� L� Hoa",
    "H穖 T躰h thu藅.Lo筺 Ho祅 K輈h","Th竔 C鵦 Quy襫 Ph�. Quy觧 3","Th竔 C鵦 Ki誱 Ph�. Quy觧 2","L璾 Tinh. o ph竝","Thi猲 Vng Ch飝 Ph竝. Quy觧 1",
    "Thi猲 Vng Thng ph竝. Quy觧 2","Thi猲 Vng o ph竝.Quy觧 3","Th髖 Y猲 o ph竝","Th髖 Y猲 Song 產o","Di謙 Ki誱 M藅 T辌h","Nga Mi  Ph藅 Quang Chng M藅 T辌h","Phi o thu藅. Nhi誴 H錸 Nguy謙 秐h",
    "Phi Ti猽 thu藅. C鰑 Cung Phi Tinh","Ng� чc Chng Ph竝. Quy觧 1","Ng� чc o ph竝. Quy觧 2","Ng� чc Nhi誴 T﹎ thu藅. Quy觧 3","Ng� Phong thu藅","Ng� L玦 thu藅","Ng� T﹎ thu藅",
    "Nhi誴 H錸. Ch� thu藅","C竔 Bang Chng Ph竝","C竔 Bang C玭 ph竝","Thi誹 L﹎ Quy襫 Ph竝. Quy觧 1","Thi誹 L﹎ C玭 ph竝. Quy觧 2","Thi誹 L﹎ o ph竝. Quy觧 3","Ph� ч M藅 T辌h" }
}
--
function main(nItemIndex)
    local nDate = tonumber(GetLocalDate("%y%m%d"))
    if nDate > 70712 then
        Say("V藅 ph萴  qu� h筺 s� d鬾g.",0)
        return 0
    end
    local szItemName = GetItemName(nItemIndex)
    local tRan = {}
    local g, d , p = GetItemProp( nItemIndex )
    if p ==  1439 then
        tRan = ACT2YEAR_TWhiteBoxRan
    elseif p == 1441 then
        tRan = ACT2YEAR_TBlueBoxRan
    elseif p == 1440 then
        tRan = ACT2YEAR_TYellowBoxRan
    end
    local nMedalItemGID, nMedalItemDID,nMedalItemPID,nItemLev,szMedalItemName = act2years2007_getgift(tRan)
    if nMedalItemGID == nil or nMedalItemDID == nil or nMedalItemPID  == nil  or szMedalItemName == nil then
        Msg2Player("S� d鬾g th蕋 b筰, h穣 th� l筰 l莕 n鱝.")
        return 1
    end
    --如果不是玄晶
    if nMedalItemPID ~= 147 then
        nItemLev = 1
    end
    AddItem(nMedalItemGID,nMedalItemDID,nMedalItemPID,nItemLev,0,0)
    Msg2Player(format("Ch骳 m鮪g b筺 nh薾 頲 1 %s.",szMedalItemName))
    return 0
end
--
function act2years2007_getgift(tRan)
    
    local nCurRan,nMaxNumber
    local nMaxRan = 1000
    nCurRan = random(nMaxRan)
    nMaxNumber = getn(tRan.tRan)
    for i = 1, nMaxNumber do
        if nCurRan <= tRan.tRan[i] then
            return tRan.tItemID[i][1],tRan.tItemID[i][2],tRan.tItemID[i][3],tRan.tItemID[i][4], tRan.tItemName[i]
        end
    end
end
