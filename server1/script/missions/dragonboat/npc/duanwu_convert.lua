tab_dw_material = 
{
	head = {"Long ��u", {6,1,428},},
	tail = {"�u�i R�ng",{6,1,431}},
	body = {"Th�n R�ng",{6,1,429}},
	bone = {"X��ng R�ng",{6,1,430}},
	oar = 	{"M�i ch�o",{6,1,432}},
	helm = {"B�nh l�i", {6,1,433}},
	drum = {"Tr�ng",{6,1,434}},
	smallboat = { "Thuy�n R�ng nh� ", {6,1,422}, {{"head",1},{ "tail", 1}, {"body",1}, {"bone",1}, {"oar",4}, {"helm",1}, {"drum",1}}  , 100 , "T�o Thuy�n r�ng nh� c�n 1 ��u r�ng, 1 �u�i r�ng, 1th�n r�ng, 4 m�i ch�o, 1 b�nh l�i v� 1 tr�ng." , "dw_convert_sb" },
	boat = {"Thuy�n R�ng truy�n th�ng", {6,1,423}, { {"smallboat",1}, {"oar",4}}   ,50 ,   "T�o Thuy�n r�ng truy�n th�ng c�n 1 Thuy�n r�ng nh� v� 4 m�i ch�o", "dw_convert_nb" },
	horseboat = { "Thuy�n R�ng ��u ng�a", {6,1,424}, {{"smallboat",1}, {"boat",1}, {"head", 1}   }       , 40 ,"T�o M� ��u thuy�n r�ng c�n 1 Thuy�n r�ng nh�, 1 Thuy�n r�ng truy�n th�ng v� 1 ��u r�ng" , "dw_convert_hb"  },
	birdboat = {"Thuy�n R�ng ��u Ph�ng", {6,1,425}, {{"horseboat",1}, {"boat",1} , {"head",1} }, 30       ,  "T�o Thuy�n r�ng ��u ph�ng c�n 1 Thuy�n r�ng ��u ng�a,  1 Thuy�n r�ng truy�n th�ng v� 1 ��u r�ng"  , "dw_convert_bb"     },
	beastboat = {"Thuy�n r�ng h�nh th� ", {6,1,426}, {{"birdboat",1}, {"horseboat",1}, {"head",1} }, 20    ,"T�o Thuy�n r�ng h�nh th� c�n 1 Thuy�n r�ng ��u ph�ng, 1 Thuy�n r�ng ��u ng�a v� 1 ��u r�ng"  ,"dw_convert_stb"   },
	hugeboat = {"Thuy�n R�ng to", {6,1,427}, { {"beastboat",1}, {"birdboat",1}, {"horseboat",1}  } ,20  ,"T�o Thuy�n r�ng lo�i l�n c�n 1 Thuy�n r�ng h�nh th�, 1 Thuy�n r�ng ��u ph�ng v� 1M� ��u thuy�n r�ng"  ,"dw_convert_hgb"            },
}

function printinfo(something)
	print("ph�i ch� t�o"..tab_dw_material[something][1]..":")
	for i = 1, getn(tab_dw_material[something][3]) do 
		print(tab_dw_material[something][3][i][2].."c�i"..tab_dw_material[tab_dw_material[something][3][i][1]][1])
	end
	print("T� l� gh�p l� "..tab_dw_material[something][4])

end

function duanwu_convert()
	Say("Ch� t�o c�c lo�i thuy�n r�ng ch� c�n <color=red>10000 l��ng<color>, n�u th�t b�i to�n b� s� m�t �i! Ng��i x�c ��nh ch� t�o ch�?", 7,"Thuy�n R�ng nh� /#dw_convert_first('smallboat')","Thuy�n R�ng truy�n th�ng/#dw_convert_first('boat')","Thuy�n R�ng ��u ng�a/#dw_convert_first('horseboat')","Thuy�n R�ng ��u Ph�ng/#dw_convert_first('birdboat')", "Thuy�n R�ng ��u th� /#dw_convert_first('beastboat')","Thuy�n R�ng to/#dw_convert_first('hugeboat')","Kh�ng c�n!/OnCancel")
end

function dw_convert_first(item)
	if (GetCash() < 10000) then
		Say(" Ch� t�o c�c lo�i thuy�n r�ng ch� c�n <color=red>10000 l��ng<color>, Ti�n c�a b�n kh�ng ��.",0)
		return
	end
	GiveItemUI("Gh�p thuy�n R�ng",tab_dw_material[item][5], tab_dw_material[item][6])
end

function dw_convert(itemname , count)
	if(count == 0) then
		Talk(1,"","<#> L� quan c��i h�p m�t: 'c� g� ��a ta kh�ng? '","B�n g�i g�i ��u: 'Th�i ch�t! Ta qu�n m�t r�i! '")
		return nil
	end
	local tab = {}
	local reqcount = 0
	for i = 1, getn(tab_dw_material[itemname][3]) do 
		tab[i] = {}
		tab[i][1] = tab_dw_material[itemname][3][i][1]
		tab[i][2] = tab_dw_material[itemname][3][i][2]
		reqcount = reqcount + tab[i][2]
	end
	
	if (reqcount ~= count) then
		Say(" S� l��ng v�t li�u c�n thi�t cho m�n �� b�n c�n gh�p kh�ng ph� h�p v�i s� l��ng th�c t�, c� ph�i b�n l�m sai kh�ng?", 2, "�! �� ta gh�p l�i/duanwu_convert", "Xin l�i! Ta l�m sai r�i! Ta xem l�i ch�t nh�!/OnCancel")
		return
	end
	
	for i = 1, count do 
		local itemIdx = GetGiveItemUnit( i )
		local g,d,p = GetItemProp(itemIdx)
		
		local bValid = 0
		for j = 1, getn(tab) do 
			if (tab_dw_material[tab[j][1]][2][1] == g and tab_dw_material[tab[j][1]][2][2] == d and tab_dw_material[tab[j][1]][2][3] == p) then
				bValid = 1
				tab[j][2] = tab[j][2] - 1
				if (tab[j][2] < 0) then
					Say(" V�t li�u b�n d�t v�o kh�ng ��ng, h�y ki�m tra l�i!",0)
					return
				end
				break
			end
		end
		if (bValid == 0) then
			Say(" V�t li�u b�n d�t v�o kh�ng ��ng, h�y ki�m tra l�i!", 0)
			return
		end
	end
	
	if (Pay(10000) == 0) then
		Say(" Ch� t�o c�c lo�i thuy�n r�ng ch� c�n <color=red>10000 l��ng<color>, Ti�n c�a b�n kh�ng ��.",0)
		return
	end
	for i=1,count do
		RemoveItemByIndex(GetGiveItemUnit(i))
	end
	
	ran = random(1,100)
	if (ran <= tab_dw_material[itemname][4]) then
		AddItem(tab_dw_material[itemname][2][1], tab_dw_material[itemname][2][2], tab_dw_material[itemname][2][3],1,1,1 )
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: t�o th�nh 1"..tab_dw_material[itemname][1]);
		Say(" Ch�c m�ng b�n, "..tab_dw_material[itemname][1].." �� ch� t�o th�nh c�ng!",0)
	else
		Say(" R�t xin l�i! L�o phu c�n ch�a thu�n th�c c�ng ngh� ch� t�o, t�o th�t b�i r�i!",0)
	end
end

--------------------------------------------------------------------------------------------------
function dw_convert_sb(count)
	dw_convert("smallboat", count)
end

function dw_convert_nb(count)
	dw_convert("boat", count)
end

function dw_convert_hb(count)
	dw_convert("horseboat", count)
end

function dw_convert_bb(count)
	dw_convert("birdboat", count)
end

function dw_convert_stb(count)
	dw_convert("beastboat", count)
end

function dw_convert_hgb(count)
	dw_convert("hugeboat", count)
end