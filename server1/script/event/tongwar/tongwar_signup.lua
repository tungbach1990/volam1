
function tongwar_want2signup()
	local tongname, mytongid = GetTongName();
	if (FALSE(tongname)) then
		CreateTaskSay({"<dec><npc>Ch�a gia nh�p bang, kh�ng th� �i v�o Khu v�c chu�n b�!", "K�t th�c ��i tho�i/OnCancel"});
		return
	end
	local n_lid = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname)
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>Bang <color=red>"..tongname.."<color> kh�ng c� li�n minh v�i c�c bang h�i chi�m th�nh, kh�ng th� �i v�o ��u tr��ng chu�n b�.", "K�t th�c ��i tho�i/OnCancel"})
		return
	end
	--VLDNB 13- �i�u ki�n tham gia: �� v�o bang tr��c 0h ng�y 6/4 - Modified By DinhHQ - 20130401
	local nTongJoinTime = GetJoinTongTime()*60
	local nCurSvTime = GetCurServerTime()
	local nMinTime = Tm2Time(2013, 4, 6, 0, 0)
	if (nCurSvTime - nTongJoinTime) > nMinTime then
		Say("Th�i gian gia nh�p bang y�u c�u <color=red>tr��c 0h ng�y 6/4/2013<color>m�i ���c ph�p v�o ��u tr��ng.", 0)
		return
	end
	--VLDNB 10 ki�m tra c�c lo�i m�t n� t�ng �i�m TK - Modified By DinhHQ - 20111013	
	local tbEquip = GetAllEquipment()
	for i=1, getn(tbEquip) do
		local nG, nD, nP = GetItemProp(tbEquip[i])
		if nP == 447 or nP == 450 or nP == 482 then
			CreateTaskSay({format("<dec><npc>Kh�ng ���c ph�p mang v�t ph�m <color=red>[%s]<color> v�o ��u tr��ng!", GetItemName(tbEquip[i])), "K�t th�c ��i tho�i/OnCancel"});
			return
		end
	end
	
	local cityname = LG_GetLeagueInfo(n_lid)
	local matchmap = LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_MAP)
	local matchcamp = LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_CAMP)
	
	if (LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_TONGID) == 0) then
		LG_ApplySetLeagueTask(TONGWAR_LGTYPE, cityname, TONGWAR_LGTASK_TONGID, mytongid);
	end;
	
	if (FALSE(matchmap) or GetGlbValue(850) ~= 1) then
		CreateTaskSay({"<dec><npc>"..cityname.."Ch�a ��n th�i �i�m v�o ��u tr��ng, h�y ��i trong gi�y l�t.", "K�t th�c ��i tho�i/OnCancel"});
		return
	end
	if (FALSE(matchcamp)) then
		print("error the city"..cityname.." no camp!!!!!")
		return
	end
	local signmap, posx, posy = tongwar_getsignpos(matchmap, matchcamp)
	if (FALSE(signmap)) then
		print("error the city "..cityname.." matchmap"..matchcamp.." have no signmap")
		return
	end
	Msg2Player("B�n �� v�o"..cityname.." khu v�c chu�n b�")
	NewWorld(signmap, posx, posy)
end

tbTONGWAR_SIGNMAP_POS = {
					{ 1582,3174 },
					{ 1588,3160 },
					{ 1604,3147 },
				}
	
tbTONGWARMAP = {
									{605, 608, 609},
									{606, 610, 611},
									{607, 612, 613},
							}
							
function tongwar_getsignpos(matchmap, camp)
	for i = 1, getn(tbTONGWARMAP) do
		if (matchmap == tbTONGWARMAP[i][1]) then
			signmap = tbTONGWARMAP[i][camp + 1]
			break
		end
	end
	local ranm = random(getn(tbTONGWAR_SIGNMAP_POS))
	return signmap, tbTONGWAR_SIGNMAP_POS[ranm][1], tbTONGWAR_SIGNMAP_POS[ranm][2]
end