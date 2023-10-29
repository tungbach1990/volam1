Include("\\script\\missions\\dragonboat\\include.lua")
Include("\\script\\missions\\dragonboat\\npc\\duanwu_convert.lua")
IncludeLib("RELAYLADDER")

DWGOLDENLASTDATE = tonumber(date("%d")) --��һ���þ������ۻ�ȡ�ƽ�װ�������� ֻ��¼��
DWGOLDENMAXCOUNT = 2	--�����þ������ۻ���������������飬ÿ��ÿ̨���������Ի�ȡ��������ÿ̨gameserver�����ޣ���16��
DWGOLDENNOWCOUNT = 0 --��ǰ�þ������ۻ�ȡ�ƽ�װ����

DWORELASTDATE = tonumber(date("%d")) --��һ�����������ۻ�ȡ���������ؿ�ʯ������ ֻ��¼��
DWOREMAXCOUNT = 12	--�������������ۻ����������ؿ�ʯ��ÿ��ÿ̨���������Ի�ȡ��������ÿ̨gameserver�����ޣ���96��
DWORENOWCOUNT = 0 --��ǰ���������ۻ�ȡ���������ؿ�ʯ��

AWARD_BIRDBOAT = {
					{"Ti�n Th�o L� ",{6,1,71,1,0,0},30},
					{"T� Th�y Tinh",{239},15},
					{"Lam Th�y Tinh",{238},15},		
					{"L�c Th�y Tinh",{240},15},
					{"Tinh H�ng B�o Th�ch",{353},15},	
					{"Thi�n s�n  B�o L� ",{6,1,72,1,0,0},10},	
					}

AWARD_BEASTBOAT = {
					{"Huy�n Tinh c�p 5",{6,1,147,5,0,0},20},
					{"Huy�n Tinh c�p 6",{6,1,147,6,0,0},43},
					{"Huy�n Tinh c�p 7",{6,1,147,7,0,0},30},		
					{"Huy�n Tinh c�p 8",{6,1,147,8,0,0},3},
					{"Th�n b� kho�ng th�ch",{6,1,398,1,0,0},4},
					}

AWARD_HUGEBOAT = {
					{"��nh Qu�c Thanh Sa Tr��ng Sam",{159},100},
					{"��nh Qu�c � Sa Ph�t Qu�n",{160},51},
					{"��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",{161},70},	
					{"��nh Qu�c T� ��ng H� uy�n",{162},70},
					{"��nh Qu�c Ng�n T�m Y�u ��i",{163},70},
					{"An Bang B�ng Tinh Th�ch H�ng Li�n",{164},51},
					{"An Bang C�c Hoa Th�ch Ch� ho�n",{165},51},
					{"An Bang �i�n Ho�ng Th�ch Ng�c B�i",{166},51},
					{"An Bang K� Huy�t Th�ch Gi�i Ch� ",{167},51},
					{"Hi�p C�t Thi�t Huy�t Sam",{186},70},
					{"Hi�p C�t �a T�nh Ho�n",{187},70},
					{"Hi�p C�t �an T�m Gi�i",{188},70},
					{"Hi�p C�t T�nh � K�t",{189},20},
					{"Nhu T�nh C�n Qu�c Ngh� Th��ng",{190},14},
					{"Nhu T�nh Th�c N� H�ng Li�n",{191},60},
					{"Nhu T�nh  Ph�ng Nghi Gi�i Ch� ",{192},80},
					{"Nhu T�nh  Tu� T�m Ng�c B�i",{193},51},
					}
																									
function dragonboat_main()
	Say(" Ho�t ��ng T�t �oan Ng� �� k�t th�c nh�ng m�i ng��i v�n c� th� d�ng nh�ng v�t li�u c�n l�i �� gh�p thuy�n r�ng v� ��i l�y ph�n th��ng. Ng��i ch�i trong 10 t�n ��ng ��u c�a b�ng x�p h�ng �ua Thuy�n r�ng cao v� s� c�p nhanh ch�n ��n ch� ta ��i Trang b� Ho�ng Kim.", 5,"T�o thuy�n r�ng/duanwu_convert","D�ng thuy�n r�ng ��i ph�n th��ng/dragon_award","10 t�n ��ng ��u b�ng x�p h�ng �ua thuy�n r�ng nh�n Trang b� Ho�ng Kim./dragon_golden","Ho�t ��ng c� li�n quan/aboutboat", "Kh�ng c�n/OnCancel");
end

function want_playboat()
	OldSubWorld = SubWorld
	OldPlayer = PlayerIndex
	local totalboat = 0
	local freeboat = 0
	local startboat = 0
	local blevel = 0
	if (IsCaptain() ~= 1) then
		Say(" Xin l�i! C�n ��i tr��ng b�o danh tham gia ho�t ��ng �ua thuy�n r�ng m�i ���c.",0)
		return
	end
	if (GetTeamSize() < 4) then
		Say(" Xin l�i! ��i thi ��u tham gia ho�t ��ng �ua thuy�n r�ng c�n �t nh�t <color=red>4<color> ng��i. Hi�n ��i c�a b�n kh�ng �� ng��i! H�y �i t�m th�m b�ng h�u nh�!",0)
		return
	end
	if (GetLevel() >= 90) then
		blevel = 1
	end
	
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local bmbrlevel = 0
		if (GetLevel() >= 90) then
			bmbrlevel = 1
		end
		
		if (blevel ~= bmbrlevel) then
			if (blevel == 0) then
				Say(" Xin l�i! Trong ��i c�a b�n c� ��i vi�n c� ��ng c�p <color=red>v��t qu� c�p 90<color>, kh�ng th� tham gia thi ��u! Ki�m tra l�i r�i ��n b�o danh tham gia! ",0)
				return
			else
				Say(" Xin l�i! Trong ��i c�a b�n c� ��i vi�n c� ��ng c�p <color=red>ch�a ��n c�p 90<color>, kh�ng th� tham gia thi ��u! Ki�m tra l�i r�i ��n b�o danh tham gia! ",0)
				return
			end
		end
	end
	
	PlayerIndex = OldPlayer
	for i = 1, getn(map_map) do 
		sub = SubWorldID2Idx(map_map[i])
		if (sub >= 0) then
			print("have "..map_map[i])
			totalboat = totalboat + 1
			SubWorld = sub
			local state = GetMissionV(VARV_STATE)
			if (state > 0) then
				startboat = 1
			end
			if ( state == 1 and GetMSPlayerCount(MISSION_MATCH, 1) == 0 and map_isadvanced[map_map[i]] == blevel) then
				freeboat = freeboat + 1
			end
		end
	end
	print("total"..totalboat.."free"..freeboat)
	local strlevel ="";
	if (blevel == 0) then
		strlevel = "�ua thuy�n r�ng s� c�p"
	else
		strlevel = "thuy�n r�ng cao c�p"
	end
	
	if (startboat == 1) then
		if (freeboat == 0) then
			Say(" Khu v�c n�y �ang trong"..strlevel.."�� b�t ��u. Kh�ng c�n ch� n�a�.",0)
			return
		else
			Say(" Khu v�c n�y �ang trong"..strlevel.."giai �o�n b�o danh �ua thuy�n r�ng, v�n c�n <color=red>"..freeboat.."<color>thuy�n r�ng c�n tr�ng. Tham gia thi ��u c�n n�p <color=red>5 v�n<color>l��ng, b�n c� mu�n tham gia?",2, "Ph�i! Ta mu�n d�n d�t ��i c�a ta tham gia./dragon_join", "Kh�ng c�n/OnCancel")
			return
		end
	else
		Say(" Xin l�i! Khu v�c n�y"..strlevel.."hi�n ch�a m� ho�t ��ng �ua thuy�n r�ng n�o �� tham gia. B�o danh <color=red>��ng m�i gi�<color> b�t ��u. Th�i gian b�o danh l� 5 ph�t. Xin ch� � th�ng b�o c�a h� th�ng!",0)
		return
	end
	
end

function dragon_join()
	local blevel = 0
	if (GetLevel() >= 90) then
		blevel = 1
	end
	if (IsCaptain() ~= 1) then
		Say(" Xin l�i! C�n ��i tr��ng b�o danh tham gia ho�t ��ng �ua thuy�n r�ng m�i ���c.",0)
		return
	end
	if (GetTeamSize() < 1) then
		Say(" Xin l�i! ��i thi ��u tham gia ho�t ��ng �ua thuy�n r�ng c�n �t nh�t <color=red>4<color> ng��i. Hi�n ��i c�a b�n kh�ng �� ng��i! H�y �i t�m th�m b�ng h�u nh�!",0)
		return
	end
	local bhaveboat = 0
	local boatstr = "Thuy�n R�ng nh� "
	if (blevel > 0) then
		boatstr = "Thuy�n R�ng truy�n th�ng"
	end
	
	if (blevel == 0) then
		bhaveboat = CalcEquiproomItemCount( 6, 1, 422, 1 )
	else
		bhaveboat = CalcEquiproomItemCount( 6, 1, 423, 1 )
	end
	
	if (GetCash() < 50000 or bhaveboat == 0 and blevel == 0) then
		Say(" Xin l�i! Tham gia thi ��u thuy�n r�ng c�n n�p<color=red> 5 v�n l��ng v� "..boatstr.."<color>m�i ���c, ti�n c�a b�n kh�ng �� ho�c kh�ng mang theo thuy�n r�ng nh�!Chu�n b� �� r�i h�y ��n!.", 0)
		return
	end
	if (GetCash() < 50000 or bhaveboat == 0 and blevel == 1) then
		Say(" Xin l�i! Tham gia thi ��u thuy�n r�ng c�n n�p<color=red> 5 v�n l��ng v� "..boatstr.."<color=red>m�i ���c, ti�n c�a b�n kh�ng �� ho�c kh�ng mang theo thuy�n r�ng truy�n th�ng! Chu�n b� �� r�i h�y ��n!", 0)
		return
	end
	
	local OldPlayer = PlayerIndex
	
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local bmbrlevel = 0
		if (GetLevel() >= 90) then
			bmbrlevel = 1
		end
		
		if (blevel ~= bmbrlevel) then
			if (blevel == 0) then
				Say(" Xin l�i! Trong ��i c�a b�n c� ��i vi�n c� ��ng c�p <color=red>v��t qu� c�p 90<color>, kh�ng th� tham gia thi ��u! Ki�m tra lai r�i ��n b�o danh tham gia! ",0)
				return
			else
				Say(" Xin l�i! Trong ��i c�a b�n c� ��i vi�n c� ��ng c�p <color=red>ch�a ��n c�p 90<color>, kh�ng th� tham gia thi ��u! Ki�m tra l�i r�i ��n b�o danh tham gia! ",0)
				return
			end
		end
	end
	
	PlayerIndex = OldPlayer
	
	OldSubWorld = SubWorld
	
	for i = 1, getn(map_map) do 
		sub = SubWorldID2Idx(map_map[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(VARV_STATE)
			if ( state == 1 and GetMSPlayerCount(MISSION_MATCH, 1) == 0 and blevel == map_isadvanced[map_map[i]] ) then
				local tabplayer = {}
				for i = 1, GetTeamSize() do 
					tabplayer[i] = GetTeamMember(i)
					print("plal"..tabplayer[i])
				end
				PlayerIndex = tabplayer[1]
				w,x,y = GetWorldPos()
				SetMissionV(VARV_SIGNUP_WORLD, w)
				SetMissionV(VARV_SIGNUP_POSX, x)
				SetMissionV(VARV_SIGNUP_POSY, y)
				SetMissionS(VARS_TEAM_NAME,GetName())
				
				-- DEBUG
				print(format("%s t� (%d, %d, %d) v� tr� v�o thuy�n r�ng", GetName(), w, x, y));

				Pay(50000)
				if (blevel == 0) then
					ConsumeEquiproomItem( 1, 6, 1, 422, 1)
				else
					ConsumeEquiproomItem( 1, 6, 1, 423, 1)
				end

				for i = 1 , getn(tabplayer) do 
					PlayerIndex = tabplayer[i]
					print("player"..PlayerIndex)
					JoinMission(MISSION_MATCH, 1)
				end
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local strlevel ="";
	if (blevel == 0) then
		strlevel = "�ua thuy�n r�ng s� c�p"
	else
		strlevel = "thuy�n r�ng cao c�p"
	end
	Say("Xin l�i! Hi�n t�i<color=red>"..strlevel.."<color> �� kh�ng c�n ch�. Xin ��i v�ng sau!",0)
end

function dragon_award()
	Say(" Cu�c �ua thuy�n r�ng �ang s�i n�i. L�o phu �ang thu nh�n thuy�n r�ng. B�n mu�n d�ng lo�i thuy�n n�o �� ��i ph�n th��ng?",7,"Thuy�n r�ng nh� ��i B�nh ch�ng nh�n ��u/dousha","Thuy�n r�ng truy�n th�ng ��i B�nh ch�ng nh�n n�m/xianggu","M� ��u thuy�n r�ng ��i B�nh ch�ng nh�n tr�ng/danhuang"," Thuy�n r�ng ��u ph�ng ng�u nhi�n ��i l�y Ti�n Th�o l�, Th�y Tinh, B�o Th�ch, Thi�n S�n B�o L� /birdboat_award","Thuy�n r�ng h�nh th� ng�u nhi�n ��i l�y Kho�ng th�ch th�n b�, 5-Huy�n Tinh kho�ng th�ch c�p 8/beastboat_award","Thuy�n r�ng lo�i l�n ng�u nhi�n ��i l�y ��nh Qu�c An Bang, 1 b� trang b� ho�ng kim Hi�p C�t Nhu T�nh/hugeboat_award","Kh�ng c�n!/OnCancel");
end

function dragon_golden()
	--Say("��٣����۴������������ݱ�Ľ����У�Ҫ�ȵ�<color=red>�����<color>��������콱Ŷ��",0);
	Say(" B�n mu�n nh�n ph�n th��ng thi ��u n�o?", 3, "�ua thuy�n r�ng s� c�p/dragon_golden_low","�ua thuy�n r�ng cao c�p/dragon_golden_high","Kh�ng c�n!/OnCancel");
end

function dragon_golden_low()
	for i = 1, 10 do
		RoleName, Data = Ladder_GetLadderInfo(10141, i);
		if( GetName() ==  RoleName) then
			if(GetTask(1507) ~= 0) then
				Say(" B�n �� l�nh ph�n th��ng 10 t�n ��ng ��u trong b�ng x�p h�ng thuy�n r�ng s� c�p!",0);
				return 0
			end			
			if(CalcFreeItemCellCount() < 6) then
				Say(" Ch� tr�ng h�nh trang c�a b�n kh�ng ��. S�p x�p l�i r�i h�y ��i nh�!",0);
				return 0
			end
			dragon_givegolden();
			SetTask(1507,1);
			return 1
		end
	end
	Say(" B�n kh�ng n�m trong 10 t�n ��ng ��u b�ng x�p h�ng �ua thuy�n r�ng s� c�p, kh�ng th� l�nh th��ng.",0);
end

function dragon_golden_high()
	for i = 1, 10 do
		RoleName, Data = Ladder_GetLadderInfo(10142, i);
		if( GetName() ==  RoleName) then
			if(GetTask(1508) ~= 0) then
				Say(" B�n �� l�nh ph�n th��ng 10 t�n ��ng ��u trong b�ng x�p h�ng thuy�n r�ng cao c�p!",0);
				return 0
			end			
			if(CalcFreeItemCellCount() < 6) then
				Say(" Ch� tr�ng h�nh trang c�a b�n kh�ng ��. S�p x�p l�i r�i h�y ��i nh�!",0);
				return 0
			end
			dragon_givegolden();
			SetTask(1508,1);
			return 1
		end
	end
	Say(" B�n kh�ng n�m trong 10 t�n ��ng ��u b�ng x�p h�ng �ua thuy�n r�ng cao c�p, kh�ng th� l�nh th��ng.",0);
end

function aboutboat()
	Say(" B�n mu�n t�m hi�u m�c n�o?", 5,"C�ng th�c gh�p thuy�n r�ng/aboutmaking","L�ch s� �ua thuy�n r�ng/abouthistory","Li�n quan b�o danh/aboutjoin","H�ng m�c ch� � /aboutnotice","Ta �� bi�t r�i!/OnCancel");
end

function aboutmaking()
	local a = "Thuy�n r�ng nh� = 1 ��u r�ng + 1 �u�i r�ng + 1 th�n r�ng + 1s��n r�ng + 4 m�i ch�o + 1 b�nh l�i + 1 tr�ng";
	local b = "<enter>Thuy�n r�ng truy�n th�ng = 1 Thuy�n r�ng nh� + 4 m�i ch�o";
	local c = "<enter>M� ��u thuy�n r�ng = 1 Thuy�n r�ng nh� + 1 Thuy�n r�ng truy�n th�ng + 1 ��u r�ng";
	local d = " Thuy�n r�ng ��u ph�ng = 1 Thuy�n r�ng ��u ng�a + 1 Thuy�n r�ng truy�n th�ng + 1 ��u r�ng";
	local e = "<enter>Thuy�n r�ng h�nh th� = 1 Thuy�n r�ng ��u ph�ng + 1 Thuy�n r�ng ��u ng�a + 1 ��u r�ng";
	local f = "<enter>Thuy�n r�ng lo�i l�n = 1 Thuy�n r�ng h�nh th� + 1 Thuy�n r�ng ��u ph�ng + 1 Thuy�n r�ng ��u ng�a";
	Talk(2,"",a..b..c,d..e..f);
end

function abouthistory()
	Talk(1,"","Truy�n thuy�t n�i r�ng sau khi Khu�t Nguy�n tr�m m�nh tr�n s�ng M�ch La. Ng��i b� con th�n thu�c � qu� nh� �ng n�m m�ng th�y Khu�t Nguy�n th�n h�nh ti�u t�y b�n d�ng l� tr�c g�i c�m th�nh nh�ng chi�c b�nh c� g�c (B�nh ch�ng) , ch�t l�n thuy�n r�ng r�i ��y ra d�ng s�ng �� c�c lo�i th�y t�c do Long Vuong cai qu�n d��i n��c nh�n th�y r�ng s� cho l� �� c�a Long V��ng ��a t�i s� kh�ng d�m �n n�n c� th� c�ng t� cho Khu�t Nguy�n d�ng. ��y ch�nh l� nguy�n do c� cu�c �ua thuy�n r�ng v� t�c �n B�nh ch�ng.");
end

function aboutjoin()
	Talk(2,"","Ng��i ch�i gi� <color=red>Thuy�n r�ng nh� v� Thuy�n r�ng truy�n th�ng<color> l�m <color=red>��i tr��ng<color>, d�n theo c�c ��i vi�n ��n <color=red>L� quan<color> b�o danh tham gia �ua thuy�n r�ng s� v� cao c�p, m�i gi� t� ch�c 1 l�n, <color=red>��ng gi� <color> ��a ra th�ng b�o b�t ��u ti�p nh�n b�o danh. Th�i gian b�o danh l� 5ph�t.","Thi ��u s� c�p cho ph�p nhi�u nh�t <color=red>8<color> ��i c�ng tham gia ��i �ng v�i 8 t�m b�n �� thuy�n r�ng;Thi ��u cao c�p cho ph�p nhi�u nh�t <color=red>16<color> ��i c�ng tham gia ��i �ng v�i 16 t�m b�n �� thuy�n r�ng. N�u s� t�n b�o danh L� quan � th�nh th� n�o �� �� ��y. M�i ng��i ch�i ��n L� quan c�c th�nh th� kh�c b�o danh.");
end

function aboutnotice()
	Talk(3,"","Sau khi b�o danh th�nh c�ng, t�t c� c�c ��i ���c chuy�n ��n b�n �� thuy�n r�ng. Trong l�c ��i th�i gian thi ��u b�t ��u, ng��i ch�i b� <color=red>r�t m�ng ho�c b� h� g�c<color> th� ���c ph�n ��nh m�t �i t� c�ch thi ��u. N�u ��i tr��ng b� r�t m�ng ho�c b� h� g�c, c�c th�nh vi�n c�n l�i v�n c� th� ti�p t�c thi ��u v� nh�n ���c ph�n th��ng c�a v�ng ��u, nh�ng th�nh t�ch kh�ng ���c ghi l�n b�ng x�p h�ng.","Sau khi <color=red>2 tu�n<color> ho�t ��ng �ua thuy�n r�ng k�t th�c, ��i tr��ng<color=red> 10 ��i ��ng ��u b�ng x�p h�ng cu�c �ua thuy�n r�ng s� v� cao c�p<color> c� th� ��n L� quan l�nh ��nh Qu�c An Bang, 1 b� trang b� ho�ng kim ng�u nhi�n Hi�p C�t Nhu T�nh.","�� bi�t th�ng tin chi ti�t xin xem trang ch�: www.volam.com.vn");
end

function dousha()
	Say(" �n B�nh ch�ng nh�n ��u ng�u nhi�n nh�n ���c <color=red>1 v�n, 2 v�n, 5 v�n �i�m kinh nghi�m<color> ho�c tham gia <color=red>�ua thuy�n r�ng s� c�p<color>, c� th�t b�n mu�n ��i kh�ng?",2,"ta mu�n ��i/dousha_yes","Kh�ng c�n!/OnCancel");
end

function dousha_yes()
	if(CalcEquiproomItemCount(6,1,422,1) <= 0) then
		Say(" B�n kh�ng c� thuy�n r�ng nh�, kh�ng th� ��i ph�n th��ng!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" Ch� tr�ng h�nh trang c�a b�n kh�ng ��. S�p x�p l�i r�i h�y ��i nh�!",0);
		return
	end
	DelCommonItem(6,1,422);
	AddItem(6,1,435,1,0,0);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]:l�nh 1 c�i B�nh ch�ng nh�n ��u");
	Say(" B�n nh�n ���c B�nh ch�ng nh�n ��u.",0);
end

function xianggu()
	Say(" �n B�nh ch�ng nh�n n�m ng�u nhi�n nh�n ���c <color=red>5 v�n, 10 v�n, 25 v�n �i�m kinh nghi�m<color>ho�c tham gia<color=red>thuy�n r�ng cao c�p<color>, c� th�t b�n mu�n ��i kh�ng?",2,"ta mu�n ��i/xianggu_yes","Kh�ng c�n!/OnCancel");
end

function xianggu_yes()
	if(CalcEquiproomItemCount(6,1,423,1) <= 0) then
		Say(" B�n kh�ng c� <color=red>Thuy�n r�ng truy�n th�ng<color>, kh�ng th� ��i ph�n th��ng!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" Ch� tr�ng h�nh trang c�a b�n kh�ng ��. S�p x�p l�i r�i h�y ��i nh�!",0);
		return
	end
	DelCommonItem(6,1,423);
	AddItem(6,1,436,1,0,0);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: l�nh 1 c�i B�nh ch�ng nh�n n�m");	
	Say(" B�n nh�n ���c 1 c�i B�nh ch�ng nh�n n�m.",0);
end

function danhuang()
	Say(" �n B�nh ch�ng nh�n tr�ng ng�u nhi�n nh�n ���c <color=red>15 v�n, 30 v�n, 75 v�n �i�m kinh nghi�m<color>, b�n th�t s� mu�n ��i?",2,"ta mu�n ��i/danhuang_yes","Kh�ng c�n!/OnCancel");
end

function danhuang_yes()
	if(CalcEquiproomItemCount(6,1,424,1) <= 0) then
		Say(" B�n kh�ng c� <color=red>M� ��u thuy�n r�ng<color>, kh�ng th� ��i ph�n th��ng!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" Ch� tr�ng h�nh trang c�a b�n kh�ng ��. S�p x�p l�i r�i h�y ��i nh�!",0);
		return
	end
	DelCommonItem(6,1,424);
	AddItem(6,1,437,1,0,0);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]:l�nh 1 c�i B�nh ch�ng nh�n tr�ng");		
	Say(" B�n nh�n ���c1 c�i B�nh ch�ng nh�n tr�ng.",0);
end

function birdboat_award()
	local awardpro = {}
	if(CalcEquiproomItemCount(6,1,425,1) <= 0) then
		Say(" B�n kh�ng c� <color=red>Thuy�n r�ng ��u ph�ng<color>, kh�ng th� ��i ph�n th��ng!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" Ch� tr�ng h�nh trang c�a b�n kh�ng ��. S�p x�p l�i r�i h�y ��i nh�!",0);
		return
	end
	for i = 1, getn(AWARD_BIRDBOAT) do
		awardpro[i] = AWARD_BIRDBOAT[i][3];
	end
	numth = randomaward(awardpro);
	if( getn(AWARD_BIRDBOAT[numth][2]) == 6 ) then
		AddItem(AWARD_BIRDBOAT[numth][2][1],AWARD_BIRDBOAT[numth][2][2],AWARD_BIRDBOAT[numth][2][3],AWARD_BIRDBOAT[numth][2][4],AWARD_BIRDBOAT[numth][2][6],AWARD_BIRDBOAT[numth][2][6]);
	else
		AddEventItem(AWARD_BIRDBOAT[numth][2][1])
	end
	DelCommonItem(6,1,425);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: l�nh 1 c�i"..AWARD_BIRDBOAT[numth][1]);		
	Say(" B�n nh�n ���c 1 c�i"..AWARD_BIRDBOAT[numth][1]..".",0);
end

function beastboat_award()
	local awardpro = {};
	if(CalcEquiproomItemCount(6,1,426,1) <= 0) then
		Say(" B�n kh�ng c� <color=red>Thuy�n r�ng h�nh th�<color>, kh�ng th� ��i ph�n th��ng!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" Ch� tr�ng h�nh trang c�a b�n kh�ng ��. S�p x�p l�i r�i h�y ��i nh�!",0);
		return
	end
	
	local nNowDate = tonumber(date("%d"));	
	if ( nNowDate == DWORELASTDATE ) then	--����ϴ����������ۻ�ȡ���������ؿ�ʯ�ǵ���Ļ�
		if ( DWORENOWCOUNT >= DWOREMAXCOUNT ) then	--�ﵽ���������ۻ�ȡ���������ؿ�ʯ����������ٻ�
			print(" H�m nay d�ng thuy�n r�ng h�nh th� ��i huy�n tinh v� kho�ng th�ch th�n b� �� v��t m�c.")
			Say(" H�m nay d�ng thuy�n r�ng h�nh th� ��i huy�n tinh v� kho�ng th�ch th�n b� qu� nhi�u.L�o phu kh�ng c�n h�ng n�a. H�y th� �i c�c th�nh th� kh�c ho�c ng�y mai h�y ��n!",0);
			return
		end
	else	--������������ۻ�ȡ���������ؿ�ʯ�������뵱ǰ����ͬһ��
		DWORELASTDATE = nNowDate;	--�������������
		DWORENOWCOUNT = 0;	--��ǰ���������ۻ�ȡ���������ؿ�ʯ����0
	end
	
	for i = 1, getn(AWARD_BEASTBOAT) do
		awardpro[i] = AWARD_BEASTBOAT[i][3];
	end
	numth = randomaward(awardpro);
	if( getn(AWARD_BEASTBOAT[numth][2]) == 6 ) then
		AddItem(AWARD_BEASTBOAT[numth][2][1],AWARD_BEASTBOAT[numth][2][2],AWARD_BEASTBOAT[numth][2][3],AWARD_BEASTBOAT[numth][2][4],AWARD_BEASTBOAT[numth][2][6],AWARD_BEASTBOAT[numth][2][6]);
	else
		AddEventItem(AWARD_BEASTBOAT[numth][2][1])
	end
	DWORENOWCOUNT = DWORENOWCOUNT + 1;
	DelCommonItem(6,1,426);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: l�nh 1 c�i"..AWARD_BEASTBOAT[numth][1]);		
	Say(" B�n nh�n ���c 1 c�i"..AWARD_BEASTBOAT[numth][1]..".",0);	
end

function hugeboat_award()
	local awardpro = {};
	if(CalcEquiproomItemCount(6,1,427,1) <= 0) then
		Say(" B�n kh�ng c� <color=red>Thuy�n r�ng lo�i l�n<color>, kh�ng th� ��i ph�n th��ng!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 6) then
		Say(" Ch� tr�ng h�nh trang c�a b�n kh�ng ��. S�p x�p l�i r�i h�y ��i nh�!",0);
		return
	end
	
	local nNowDate = tonumber(date("%d"));	
	if ( nNowDate == DWGOLDENLASTDATE ) then	--����ϴ��þ������ۻ�ȡ�ƽ�װ���ǵ���Ļ�
		if ( DWGOLDENNOWCOUNT >= DWGOLDENMAXCOUNT ) then	--�ﵽ�þ������ۻ�ȡ�ƽ�װ������������ٻ�
			print(" H�m nay d�ng thuy�n r�ng lo�i l�n ��i Trang b� ho�ng kim �� ��t m�c.")
			Say(" H�m nay d�ng thuy�n r�ng lo�i l�n ��i Trang b� ho�ng kim �� qu� nhi�u. L�o phu kh�ng c�n h�ng n�a. H�y �i th�nh th� kh�c th� xem, ho�c ng�y mai h�y ��n!",0);
			return
		end
	else	--����þ������ۻ�ȡ�ƽ�װ�������뵱ǰ����ͬһ��
		DWGOLDENLASTDATE = nNowDate;	--�������������
		DWGOLDENNOWCOUNT = 0;	--��ǰ�þ������ۻ�ȡ�ƽ�װ������0
	end
	
	for i = 1, getn(AWARD_HUGEBOAT) do
		awardpro[i] = AWARD_HUGEBOAT[i][3];
	end	
	numth = randomaward(awardpro);
	if( getn(AWARD_HUGEBOAT[numth][2]) == 6 ) then
		AddItem(AWARD_HUGEBOAT[numth][2][1],AWARD_HUGEBOAT[numth][2][2],AWARD_HUGEBOAT[numth][2][3],AWARD_HUGEBOAT[numth][2][4],AWARD_HUGEBOAT[numth][2][6],AWARD_HUGEBOAT[numth][2][6]);
	else
		AddGoldItem(0,AWARD_HUGEBOAT[numth][2][1])
	end
	DWGOLDENNOWCOUNT = DWGOLDENNOWCOUNT + 1;
	DelCommonItem(6,1,427);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: l�nh 1 c�i"..AWARD_HUGEBOAT[numth][1]);		
	Say(" B�n nh�n ���c 1 c�i"..AWARD_HUGEBOAT[numth][1]..".",0);	
end

function randomaward(aryProbability)
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	local nCompareSum = 0;
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = random(1,nSum);
	for i = 1,nArgCount do
		nCompareSum = nCompareSum + aryProbability[i]
		if( nRandNum <= nCompareSum) then
			return i;
		end
	end
end

function dragon_givegolden()
	local awardpro = {};
	for i = 1, getn(AWARD_HUGEBOAT) do
		awardpro[i] = AWARD_HUGEBOAT[i][3];
	end	
	numth = randomaward(awardpro);
	AddGoldItem(0,AWARD_HUGEBOAT[numth][2][1])
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: 10 t�n ��ng ��u trong b�ng x�p h�ng thuy�n r�ng nh�n ���c 1 c�i"..AWARD_HUGEBOAT[numth][1]);		
	Say(" B�n nh�n ���c 1 c�i"..AWARD_HUGEBOAT[numth][1]..".",0);	
end	