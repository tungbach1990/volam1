if (not __JOURNEYER_OFFICER_FESTIVAL2006_H__) then
    __JOURNEYER_OFFICER_FESTIVAL2006_H__ = 1;
    Include([[\script\missions\springfestival\festival_head.lua]]);
    
    function festival2006()
        Say(FESTIVAL06_NPCNAME.."G�n ��y Qu�i th� xu�t hi�n kh�p n�i, lo�i Qu�i th� n�y th��ng hay nh�p l�n m�t ng��i kh�c, bi�n h� th�nh qu�i v�t �i h�i ng��i. Ph�i c� <color=yellow>ph�o<color> m�i c� th� �u�i ch�ng �i. Ng��i c�a Quan ph� �ang r�o ri�t truy t�m Qu�i th�, ta th�y ng��i l� ng��i h�c v�, c� th� gi�p �� kh�ng?", 5, "Kh�ng th�nh v�n ��!/festival06_wantjoin", "Ta �� �u�i ���c Qu�i th� ch�y r�i!/festival06_award", "Li�n quan ��n ho�t ��ng ��nh Qu�i th� /festival06_knowabout", "H�i th�m tin t�c./main_former", "D�o n�y ta b�n qu�, t�m ng��i kh�c �i!/festival06_Cancal");
    end;
    
    function festival06_wantjoin()
        Say(FESTIVAL06_NPCNAME.."Ng��i �� ��ng � th� hay qu�, nh�ng c�n ch� � khi Qu�i th� xu�t hi�n ��ng �� ch�ng b�t l� tr� �i!", 2, "Hi�u r�i! Mau d�n ta ��n ch� Qu�i th�!/festival_joingame", "��i m�t l�t! Ta ph�i chu�n b�./festival06_Cancal");
    end;
    
    function festival06_award()
        local nGetCount = GetTask(TK_FE_COUNT_ONETIME);
        local nRank = GetTask(TK_FE_RANK);
        if (nGetCount <= 0 or nRank <= 0) then
            Say(FESTIVAL06_NPCNAME.."H�nh nh� ng��i ch�a ��nh Qu�i th� th� ph�i, th�m t� c�a ta �ang theo d�i ��! Mu�n l�nh th��ng th� mau �i ��nh Qu�i th� �i!", 1, "K�t th�c ��i tho�i./festival06_Cancal");
            return
        end;
        festival06_addaward();
        if (GetTask(TK_FE_GROUPID) > FE_SMALLMAPCOUNT) then
            Say(FESTIVAL06_NPCNAME.."Nguy hi�m qu�! Ng��i m�i b� Qu�i th� nh�p v�o, may m� m�i ng��i h�p s�c l�i �u�i Qu�i th� �i r�i! �� ��p t� l�ng d�ng c�m c�a ng��i, ta c� ch�t l�ng th�nh xin nh�n cho!", 1, "Nh�n l�y l� v�t./festival06_Cancal");
        else
            Say(FESTIVAL06_NPCNAME.."Ta �� nghe th�m t� h�i b�o, ng��i l�m t�t l�m �� s� d�ng ph�o �u�i ch�ng �i "..nGetCount.."l�n, ��nh tr�ng Qu�i th� "..nRank..", ��y l� th� lao! Xin nh�n l�y!", 1, "Nh�n l�y l� v�t./festival06_Cancal");
        end;
    end;
    
    function festival06_knowabout()
        Say(FESTIVAL06_NPCNAME.."Ho�t ��ng ��nh Qu�i th� m�i tr�n l� <color=yellow>15<color>ph�t. Trong �� <color=yellow>5<color> ph�t chu�n b�, sau khi b�o danh b�n ���c ��a ��n n�i chu�n b�. Khi ho�t ��ng b�t ��u b�n ���c chuy�n ��n ch� Qu�i th� xu�t hi�n, sau <color=yellow>15<color> gi�y s� c� t� 1~ 2 ng��i ch�i b� Qu�i th� nh�p h�n. L�c n�y ng��i b� nh�p h�n ph�i l�p t�c �i b�t <color=yellow>nh�ng ��a b� �i l�c<color>", 2, "Trang k� /festival06_next", "K�t th�c ��i tho�i./festival06_Cancal");
    end;
    
    function festival06_next()
        Say(FESTIVAL06_NPCNAME.."Nh�ng ng��i kh�c ph�i s� d�ng '<color=yellow>ph�o<color>' �� �u�i ��m Qu�i th� �i, ��ng th�i ph�i ng�n ch�n ��m Qu�i th� b�t l� tr�, sau khi k�t th�c ho�t ��ng '<color=yellow>Sai d�ch Nha m�n<color>' s� d�a theo <color=yellow>s� l�n s� d�ng ph�o<color> c�a ng��i ch�i �� t�nh th� lao", 1, "Ta �� bi�t r�i. /festival06_Cancal");
    end;
    
tabExp = {
5000000,
4000000,
3000000,
2000000,
1500000,
1000000,
500000,
500000,
};
tabRate = {
	{0, 0, 0, 0.12, 0.15, 0.2, 0.24, 0.15, 0.1, 0.04},
	{0, 0, 0, 0.15, 0.15, 0.2, 0.24, 0.15, 0.08, 0.03},
	{0, 0, 0, 0.16, 0.15, 0.25, 0.25, 0.12, 0.05, 0.02},
	{0.05, 0.05, 0.12, 0.08, 0.12, 0.15, 0.2, 0.15, 0.08, 0},
	{0.05, 0.06, 0.12, 0.08, 0.12, 0.15, 0.18, 0.18, 0.06, 0},
	{0.05, 0.06, 0.12, 0.08, 0.12, 0.15, 0.15, 0.24, 0.03, 0},
	{0.08, 0.08, 0.16, 0.08, 0.12, 0.15, 0.12, 0.2, 0.01, 0},
	{0.1, 0.1, 0.15, 0.1, 0.12, 0.18, 0.15, 0.1, 0, 0}
};

tabGoods = {
    
};
    function festival06_addaward()
        local nGetCount = GetTask(TK_FE_COUNT_ONETIME);
        local nRank = GetTask(TK_FE_RANK);
        if (nRank > getn(tabExp)) then
            nRank = getn(tabExp);
        end;
        SetTask(TK_FE_COUNT_ONETIME, 0);
        SetTask(TK_FE_RANK, 0);
        
        nRank = festival_award_rank(nRank);
        festival_expaward(nRank);
        festival_goodsaward(nRank);
        if (nRank <= 2) then
            local nSeed = random(1, 100);
            if (nSeed <= 2) then
                AddItem(0, 11, 263, 1, 0, 0, 0);
                Msg2Player("B�n nh�n ���c 1 <color=yellow>M�t n� Qu�i th�<color>")
            end;
        end;
    end;
    
    function festival_goodsaward(nRank)
        local nGroup = GetTask(TK_FE_GROUPID);
    	local nGoodsType = festival_getgoodtype(nRank, nGroup);
    	local strsay = "";
    	if (nGoodsType == 1) then
    		AddItem(6, 1, 122, 1, 0, 0, 0);
    		strsay = "B�n nh�n ���c 1 Ph�c Duy�n (ti�u) "
    	elseif (nGoodsType == 2) then
    		AddItem(6, 1, 71, 1, 0, 0, 0);
    		strsay = "B�n nh�n ���c 1 Ti�n Th�o L� "
    	elseif (nGoodsType == 3) then
    		local szItemName = festival_addpkwan();
    		strsay = "B�n nh�n ���c m�t"..szItemName;
    	elseif (nGoodsType == 4) then
    		AddItem(6, 1, 123, 1, 0, 0, 0);
    		strsay = "B�n nh�n ���c 1 Ph�c Duy�n (trung) "
    	elseif (nGoodsType == 5) then
    		AddItem(6, 1, 147, 4, 0, 0, 0);
    		strsay = "B�n nh�n ���c 1 Huy�n Tinh c�p 4"
    	elseif (nGoodsType == 6) then
    		AddItem(6, 1, 124, 1, 0, 0, 0);
    		strsay = "B�n nh�n ���c 1 Ph�c Duy�n (��i) "
    	elseif (nGoodsType == 7) then
    		AddItem(6, 1, 147, 5, 0, 0, 0);
    		strsay = "B�n nh�n ���c 1 Huy�n Tinh c�p 5"
    	elseif (nGoodsType == 8) then
    		AddItem(6, 1, 147, 6, 0, 0, 0);
    		strsay = "B�n nh�n ���c 1 Huy�n Tinh c�p 6"
    	elseif (nGoodsType == 9) then
    		AddItem(6, 1, 147, 7, 0, 0, 0);
    		strsay = "B�n nh�n ���c 1 Huy�n Tinh c�p 7"
    	elseif (nGoodsType == 10) then
    		AddItem(6, 1, 147, 8, 0, 0, 0);
    		strsay = "B�n nh�n ���c 1 Huy�n Tinh c�p 8"
    	end;
  		Msg2Player(strsay);
    end;
    
    function festival_getgoodtype(nRank, nGroup)
        
    	local nSeed = random(100);
    	local nRate = {}
    	local i;
    	for i = 1, 10 do
    		nRate[i] = tabRate[nRank][i] * 100;
    	end;
    	local nBase = 0;
    	for i = 1, 10 do
    		nBase = nBase + nRate[i];
    		if (nBase >= nSeed) then
    			return i;
    		end;
    	end;
    end;
    
    function festival_expaward(nRank)
        if (nRank < 1) then
            nRank = 1;
        end;
        if (nRank > 8) then
            nRank = 8;
        end;
        local nCount = tabExp[nRank];
    	AddOwnExp(nCount);
    	Msg2Player("B�n nh�n ���c<color=yellow>"..nCount.."<color>�i�m kinh nghi�m")
    end;
    
    function festival_addpkwan()
        local itemidx = random(1, 10);
        AddItem(6, 0, itemidx, 1, 0, 0, 0);
        tab_pkwan_name = {"Tr��ng M�nh ho�n", "Gia B�o ho�n", "��i L�c ho�n", "Cao Thi�m ho�n", "Cao Trung ho�n", "Phi T�c ho�n", "B�ng Ph�ng ho�n", "L�i Ph�ng ho�n", "H�a Ph�ng ho�n", "��c Ph�ng ho�n"};
        return tab_pkwan_name[itemidx];
    end;
    
    function festival_award_rank(nRank)
        local nGroup = GetTask(TK_FE_GROUPID);
        if (nGroup > FE_SMALLMAPCOUNT) then
            if (nRank == 1) then
                nRank = 3;
            else
                nRank = 8;
            end;
        end;
        return nRank;
    end;
    
    function festival06_Cancal()
        
    end;
end;