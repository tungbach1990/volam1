--Խ������������Ʒ��
--fmz
--
--
ACT2YEAR_TWhiteBoxRan = {
    tRan = {1000},
    tItemID = { {6,1,1442}},
    tItemName = {"B�nh b�ng lan"}
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
    tItemName = {"Thi�t La H�n","B�n Nh��c T�m Kinh","Tinh H�ng B�o Th�ch","Huy�n Tinh Kho�ng Th�ch c�p 1","Huy�n Tinh Kho�ng Th�ch c�p 2","Huy�n Tinh Kho�ng Th�ch c�p 3",
    "Qu� Hoa T�u","B�nh kem",}
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
    tItemName = {"Thi�t La H�n","Huy�n Tinh Kho�ng Th�ch c�p 2","Huy�n Tinh Kho�ng Th�ch c�p 3","Huy�n Tinh Kho�ng Th�ch c�p 4","T� Th�y Tinh","B�nh kem ��c bi�t","T� Ti�n thu�t. B�o V� L� Hoa",
    "H�m T�nh thu�t.Lo�n Ho�n K�ch","Th�i C�c Quy�n Ph�. Quy�n 3","Th�i C�c Ki�m Ph�. Quy�n 2","L�u Tinh. �ao ph�p","Thi�n V��ng Ch�y Ph�p. Quy�n 1",
    "Thi�n V��ng Th��ng ph�p. Quy�n 2","Thi�n V��ng �ao ph�p.Quy�n 3","Th�y Y�n �ao ph�p","Th�y Y�n Song �ao","Di�t Ki�m M�t T�ch","Nga Mi  Ph�t Quang Ch��ng M�t T�ch","Phi �ao thu�t. Nhi�p H�n Nguy�t �nh",
    "Phi Ti�u thu�t. C�u Cung Phi Tinh","Ng� ��c Ch��ng Ph�p. Quy�n 1","Ng� ��c �ao ph�p. Quy�n 2","Ng� ��c Nhi�p T�m thu�t. Quy�n 3","Ng� Phong thu�t","Ng� L�i thu�t","Ng� T�m thu�t",
    "Nhi�p H�n. Ch� thu�t","C�i Bang Ch��ng Ph�p","C�i Bang C�n ph�p","Thi�u L�m Quy�n Ph�p. Quy�n 1","Thi�u L�m C�n ph�p. Quy�n 2","Thi�u L�m �ao ph�p. Quy�n 3","Ph� �� M�t T�ch" }
}
--
function main(nItemIndex)
    local nDate = tonumber(GetLocalDate("%y%m%d"))
    if nDate > 70712 then
        Say("V�t ph�m �� qu� h�n s� d�ng.",0)
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
        Msg2Player("S� d�ng th�t b�i, h�y th� l�i l�n n�a.")
        return 1
    end
    --�����������
    if nMedalItemPID ~= 147 then
        nItemLev = 1
    end
    AddItem(nMedalItemGID,nMedalItemDID,nMedalItemPID,nItemLev,0,0)
    Msg2Player(format("Ch�c m�ng b�n nh�n ���c 1 %s.",szMedalItemName))
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
