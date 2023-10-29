IL("TITLE");
IncludeLib("ITEM");
IncludeLib("TIMER");
IncludeLib("FILESYS");
IncludeLib("SETTING");
IncludeLib("TASKSYS")
IncludeLib("PARTNER");
IncludeLib("BATTLE");
IncludeLib("RELAYLADDER")
IncludeLib("TONG")
IncludeLib("LEAGUE")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua");
Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\lib\\common.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\activitysys\\npcdailog.lua");

TITLEDIALOG = "T�n nh�n v�t: <color=green>%s<color>\n".."T�n t�i kho�n: <color=green>%s<color>\n".."T�a ��: <color=green>%d, %d/%d<color>"

function main()
	dofile("script/global/eurofun/item/lenhbaitestserver.lua")
		local strFaction = GetFaction()
		local nW,nX,nY = GetWorldPos();
		local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY)};
			tinsert(tbSay, "Nh�n Point/CacLoaiDiem");
			tinsert(tbSay, "C�ng �i�m Nhanh/add_prop");
			tinsert(tbSay, "Boss/bosshk1");
			tinsert(tbSay, "H� tr� l�m nhi�m v� Ho�ng Kim/helpgoldquest");
			tinsert(tbSay, "H� tr� l�m nhi�m v� M�n Ph�i/help_quest");
			tinsert(tbSay, "Thay ��i Tr�ng Th�i/trangthai");
			tinsert(tbSay, "S�a l�i Th�n H�nh Ph�/fixthanhanhphu");
			tinsert(tbSay, "K�t th�c ��i tho�i./no")
		CreateTaskSay(tbSay)
	return 1;
end
--------------------------------------------------------------
--			 		S�a Th�n H�nh Ph�						--
--------------------------------------------------------------
function fixthanhanhphu()
	DisabledUseTownP(0)
	Msg2Player("Tr�ng th�i s� d�ng th� ��a ph� v� th�n h�nh ph� c�a Qu� nh�n s� �� tr� v� ban ��u!<enter> Nh�ng Map ch� ��nh kh�ng s� d�ng th�n h�nh ph� kh�ng th� s� d�ng t�nh n�ng n�y")
end
--------------------------------------------------------------
--			 		Thay ��i Tr�ng Th�i						--
--------------------------------------------------------------
function trangthai()
local szTitle = "Xin ch�o <color=red>"..GetName().."<color>"
local tbOpt =
	{
		{"Luy�n C�ng",luyencong},
		{"Ch�nh Ph�i",chinhphai},
		{"Trung L�p",trunglap},
		{"T� Ph�i",taphai},
		{"S�t Th�",satthu},
		{"Tr� L�i",main},
		{"Tho�t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function luyencong()
SetCurCamp(0)
SetCamp(0)
end
function chinhphai()
SetCurCamp(1)
SetCamp(1)
end
function trunglap()
SetCurCamp(3)
SetCamp(3)
end
function taphai()
SetCurCamp(2)
SetCamp(2)
end
function satthu()
SetCurCamp(4)
SetCamp(4)
end
--------------------------------------------------------------
--			 		H� Tr� L�m nv m�n ph�i					--
--------------------------------------------------------------
tb_HelpQuest = {
	[0] = {--Thieu lam OK
		[1] = {
			[1] = {"S� ���c phong l�: H� Vi�n V� T�ng. H�c ���c v� c�ng: Thi�u L�m �ao Ph�p, C�n ph�p, Quy�n ph�p. N�i ti�p nh�n nhi�m v�: T� Nh�n Ph��ng Tr��ng.<enter><color=red>B��c 1<color>: ��n Ph��ng Tr��ng Thi�n ph�ng (230/184), g�p T� Nh�n Ph��ng Tr��ng, ti�p nh�n nhi�m v�.<enter><color=red>B��c 2<color>: V�o trong ��t Ma ���ng (210/188), ph�a sau pho t��ng trong ��t Ma ���ng c� 1 con h�m nh�, v�o trong �� ��nh b�i nh�ng t�n C� Quan Nh�n (192/197), (203/200), (216/201) ��n khi l�y ���c Kim Li�n Hoa.<enter><color=red>B��c 3<color>: Mang Kim Li�n Hoa v� giao cho T� Nh�n Ph��ng Tr��ng , ho�n th�nh nhi�m v�"},
			[2] = {"G�p T� Nh�n Ph��ng Tr��ng","��n Ph��ng Tr��ng Thi�n ph�ng (230/184), g�p T� Nh�n Ph��ng Tr��ng, ti�p nh�n nhi�m v�",0,1,109,1598,3178},
			[3] = {"��nh b�i nh�ng t�n C� Quan Nh�n","V�o trong ��t Ma ���ng, ph�a sau pho t��ng trong ��t Ma ���ng c� 1 con h�m nh�, v�o trong �� ��nh b�i nh�ng t�n C� Quan Nh�n ��n khi l�y ���c Kim Li�n Hoa.",1,1,111,1544,3162},
			[4] = {"G�p T� Nh�n Ph��ng Tr��ng","Mang Kim Li�n Hoa v� giao cho T� Nh�n Ph��ng Tr��ng , ho�n th�nh nhi�m v�",0,1,109,1598,3178},
		},
		[2] = {
			[1] = {"S� ���c phong l�: H� T� Kim Cang. H�c ���c v� c�ng: B�t ��ng Minh V��ng. N�i ti�p nh�n nhi�m v�: Huy�n Bi..<enter><color=red>B��c 1<color>: ��n ��t Ma ���ng (210/188), t�m g�p Huy�n Bi, ti�p nh�n nhi�m v�.<enter><color=red>B��c 2<color>: ��n Bi�n Kinh Ph� -> T�y Ph�c Ng�u S�n t�m n�m t�n Man Di (280/185), (269/184), (264/185), (262/183), (277/187). Sau khi ��nh �� 5 con � 5 ��a ch� tr�n s� c� d�ng ch� hi�n l�n: <color=yellow>B�n �� d�y d� ���c 5 t�n Man Di, ch�ng h�a t� nay s� kh�ng qu�y ph� n�a...<color>.<enter><color=red>B��c 3<color>: Tr� l�i ��t Ma ���ng g�p Huy�n Bi ph�c m�nh, ho�n th�nh nhi�m v�"},
			[2] = {"G�p Huy�n Bi","��n ��t Ma ���ng (210/188), t�m g�p Huy�n Bi, ti�p nh�n nhi�m v�.",0,1,105,1599,3191},
			[3] = {"��nh b�i Man Di th� nh�t � Ph�c Ng�u S�n T�y","��nh b�i Man Di th� nh�t � Ph�c Ng�u S�n T�y",1,1,41,2235,2970},
			[4] = {"��nh b�i Man Di th� hai � Ph�c Ng�u S�n T�y","��nh b�i Man Di th� hai � Ph�c Ng�u S�n T�y",1,1,41,2160,2943},
			[5] = {"��nh b�i Man Di th� ba � Ph�c Ng�u S�n T�y","��nh b�i Man Di th� ba � Ph�c Ng�u S�n T�y",1,0,41,264,185},
			[6] = {"��nh b�i Man Di th� t� � Ph�c Ng�u S�n T�y (Ngay g�n con th� 3)","��nh b�i Man Di th� t� � Ph�c Ng�u S�n T�y (Ngay g�n con th� 3)",1,1,41,2094,2926},
			[7] = {"��nh b�i Man Di th� n�m � Ph�c Ng�u S�n T�y","��nh b�i Man Di th� n�m � Ph�c Ng�u S�n T�y",1,1,41,2210,3010},
			[8] = {"Tr� v� ph�ng m�nh Huy�n Bi","Tr� l�i ��t Ma ���ng g�p Huy�n Bi ph�c m�nh, ho�n th�nh nhi�m v�",0,1,105,1599},
		},
		[3] = {
			[1] = {"S� ���c phong l�: H� Ph�p La H�n. H�c ���c v� c�ng: La H�n Tr�n. N�i ti�p nh�n nhi�m v�: Huy�n Gi�c.<enter><color=red>B��c 1<color>: ��n h� Ph�ng sinh t�m g�p Huy�n Gi�c <color=yellow>(220/193)<color>, ti�p nh�n nhi�m v�.<enter><color=red>B��c 2<color>: ��n r�ng th�p b�n ngo�i ch�a, ph�t hi�n nh�ng k� c� h�nh tung m� �m. ��nh b�i M�ch Anh <color=yellow>(238/200), (231/204)<color>, cho ��n khi n�o bi�t ���c b�n ch�ng ch�nh l� gi�n �i�p c�a Kim qu�c, ��ng ��ng c�a b�n ch�ng �� ��nh c�p th�nh c�ng <color=yellow>B�t Nh� Ba La M�t �a T�m Kinh<color> hi�n gi� �� ch�y ��n Kim Quang ��ng � Ki�m C�c T�y B�c.<enter><color=red>B��c 3<color>: ��n Ph��ng T��ng Ph� -> Ki�m C�c Th�c ��o -> Kim Quang ��ng, ��nh b�n Tr�m kinh <color=yellow>(218/182), (179/186), (198/196)<color> ��n khi l�y l�y l�i ���c <color=yellow>B�t Nh� Ba La M�t �a T�m Kinh<color>.<enter><color=red>B��c 4<color>: Tr� l�i Thi�u L�m, ��n h� Ph�ng sinh, mang kinh giao cho Huy�n Gi�c, ho�n th�nh nhi�m v�"},
			[2] = {"��n H� Ph�ng Sinh g�p Huy�n Gi�c","��n h� Ph�ng sinh t�m g�p Huy�n Gi�c <color=yellow>(220/193)<color>, ti�p nh�n nhi�m v�.",0,0,103,220,193},
			[3] = {"��nh b�i M�ch Anh","��nh b�i M�ch Anh",1,1,103,1908,3210},
			[4] = {"��nh b�i b�n tr�m kinh � Kim Quang ��ng",	"��n r�ng th�p b�n ngo�i ch�a, ph�t hi�n nh�ng k� c� h�nh tung m� �m. ��nh b�i M�ch Anh",1,0,4,218,182},
			[5] = {"Tr� l�i g�p Huy�n Gi�c","Tr� l�i Thi�u L�m, ��n h� Ph�ng sinh, mang kinh giao cho Huy�n Gi�c, ho�n th�nh nhi�m v�",0,0,103,220,193},
		},
		[4] = {
			[1] = {"S� ���c phong l�: Truy�n Kinh La H�n. H�c ���c v� c�ng: S� T� H�ng. N�i ti�p nh�n nhi�m v�: T� Nh�n Ph��ng Tr��ng.<enter><color=red>B��c 1<color>: ��n Ph��ng Tr��ng Thi�n ph�ng <color=yellow>(230/184)<color> t�m g�p <color=green>T� Nh�n Ph��ng tr��ng<color>, ti�p nh�n nhi�m v�.<enter><color=red>B��c 2<color>: ��n Thi�u L�m M�t Th�t <color=yellow>(168/166)<color> � ph�a B�c Ch�a Thi�u L�m, tr� l�i 3 c�u h�i �� v�o ���c trong M�t Th�t <color=yellow>(th� t� tr� l�i l� 1 - 2 - 1)<color>.<enter><color=red>B��c 3<color>: ��nh <color=green>Kim Cang Nh�n<color> <color=yellow>(213/205), (203/198), (204/205), (208/201)<color> �� l�y ���c kh�u quy�t.<enter><color=red>B��c 4<color>: ��n cu�i hang ��ng <color=yellow>(230/207)<color> s� nh�n th�y m�t th�ch th�t, nh�p v�o phi�n ��, ��c ��ng kh�u quy�t s� c� th� c�ng <color=green>Nh� T�ng<color> ��i tho�i, ph�i ch� � nghe th� t� n�m c�u n�i c�a <color=green>Nh� T�ng<color> (c�c b�n n�n ghi l�i).<enter><color=red>B��c 5<color>: Tr� l�i Ph��ng tr��ng Thi�n ph�ng, g�p <color=green>T� Nh�n Ph��ng Tr��ng<color>, thu�t l�i th� t� n�m c�u n�i c�a <color=green>Nh� T�ng<color>:<enter>\t\t- N�u nh� th� t� ch�nh x�c, ho�n th�nh nhi�m v�.<enter>\t\t- N�u nh� th� t� b� sai, <color=green>T� Nh�n Ph��ng tr��ng<color> : <color=yellow>Ta kh�ng hi�u ���c � ngh�a n�m c�u n�y, c� ph�i ng��i �� b� l�m l�n th� t� kh�ng?<color> B�n ph�i th�c hi�n l�i nhi�m v�"},
			[2] = {"��n g�p T� Nh�n Ph��ng Tr��ng.","��n g�p T� Nh�n Ph��ng Tr��ng.",0,1,109,1598,3178},
			[3] = {"��n Thi�u L�m m�t th�t","��n Thi�u L�m M�t Th�t � ph�a B�c Ch�a Thi�u L�m, tr� l�i 3 c�u h�i �� v�o ���c trong M�t Th�t",1,0,103,168,166},
			[4] = {"��nh b�i kim cang nh�n th� nh�t","��nh b�i kim cang nh�n th� nh�t",1,0,113,213,206},
			[5] = {"��nh b�i kim cang nh�n th� hai","��nh b�i kim cang nh�n th� hai",1,0,113,203,199},
			[6] = {"��nh b�i kim cang nh�n th� ba","��nh b�i kim cang nh�n th� ba",1,0,113,204,205},
			[7] = {"��nh b�i kim cang nh�n th� t�","��nh b�i kim cang nh�n th� t�",1,0,113,208,201},
			[8] = {"��i tho�i c�ng Nh� T�ng","��i tho�i c�ng Nh� T�ng",1,0,113,230,207},
			[9] = {"Tr� l�i g�p T� Nh�n Ph��ng Tr��ng","Tr� l�i g�p T� Nh�n Ph��ng Tr��ng",0,1,109,1598,3178},
		},
		[5] = {
			[1] = {"S� ���c phong l�: Ph�c Ma Thi�n Vu�ng. H�c ���c v� c�ng: Ho�nh T�o L�c H�p, Ma Ha V� L��ng, Long H� Tr�o. N�i ti�p nh�n nhi�m v�: Huy�n T�.<enter><color=red>B��c 1<color>: ��n T�ng Kinh C�c(218/190) , g�p Huy�n T�, ti�p nh�n nhi�m v�.<enter><color=red>B��c 2<color>: ��n s�n luy�n v� g�p Tr�ng T�m (224/178). H�n mu�n b�n ki�m cho h�n 1 con g� quay.<enter><color=red>B��c 3<color>: ��n T�u l�u � Bi�n Kinh (210/193), b� 500 l��ng mua g� quay mang v� giao cho Tr�ng T�m.<enter><color=red>B��c 4<color>: ��n r�ng th�ng, trong r�ng l� m�t m� cung c�y th�ng, trong m� cung c� r�t nhi�u ��, c�n c� theo s� s�p x�p T�, Ng�, Tam, s� t�m ���c t�ng �� c� gi�u t�ng th� (231/170), ��y n� ra s� l�y ���c <color=yellow>D�ch C�n Kinh<color>.<enter><color=red>B��c 5<color>: Tr� l�i T�ng Kinh C�c, mang D�ch C�n Kinh giao cho Huy�n T�, ho�n th�nh nhi�m v�"},
			[2] = {"��n T�ng Kinh C�c g�p Huy�n T�","��n T�ng Kinh C�c g�p Huy�n T�",0,1,104,1594,3183},
			[3] = {"G�p Tr�ng T�m t�i s�n luy�n v�","G�p Tr�ng T�m t�i s�n luy�n v�",0,0,103,224,178},
			[4] = {"Mua g� quay t�i t�u l�u Bi�n Kinh","Mua g� quay t�i t�u l�u Bi�n Kinh",0,0,37,210,193},
			[5] = {"Mang g� quay v� cho Tr�ng T�m","Mang g� quay v� cho Tr�ng T�m",0,0,103,224,178},
			[6] = {"��n r�ng th�ng t�m D�ch Ch�n Kinh","��n r�ng th�ng t�m D�ch Ch�n Kinh",1,0,103,231,170},
			[7] = {"Mang D�ch C�n Kinh cho Huy�n T�","Mang D�ch C�n Kinh cho Huy�n T�",0,1,104,1594,3183},
		},
		[6] = {
			[1] = {"S� ���c phong l�: V� L��ng Th�ch T�n. N�i nh�n nhi�m v�: Huy�n Nan.<enter><color=red>B��c 1<color>: ��n La H�n ���ng <color=yellow>(202/192)<color>, g�p Huy�n Nan, ti�p nh�n nhi�m v�.<enter><color=red>B��c 2<color>: ��n La H�n tr�n (l�i �i v�o ph�a sau t��ng Ph�t trong La H�n ���ng), ��nh b�i c�c t�n T�ng Binh ��u L�nh <color=yellow>(197/211), (211/224), (206/196), (229/208)<color>, b�n s� l�y ���c Ni�m Ch�u, Thi�n tr��ng, M�c Ng� v� B�t Vu.<enter><color=red>B��c 3<color>: Mang 4 b�o v�t tr�n v� giao cho Huy�n Nan, ho�n th�nh nhi�m v�."},
			[2] = {"��n La H�n ���ng g�p Huy�n Nan","��n La H�n ���ng g�p Huy�n Nan",0,0,103,202,192},
			[3] = {"��nh b�i t�ng ��u l�nh","��n La H�n tr�n (l�i �i v�o ph�a sau t��ng Ph�t trong La H�n ���ng), ��nh b�i c�c t�n T�ng Binh ��u L�nh",1,1,114,1580,3380},
			[4] = {"Mang 4 b�o v�t v� cho Huy�n Nan",0,0,103,202,192},
		},
		[7] = {
			[1] = {"<color=red>Y�u c�u<color>: ng��i ch�i �� xu�t s�, ��ng c�p tr�n 60, ch�a gia nh�p bang ph�i n�o, c� th� ��n g�p tr��ng m�n c�a ph�i giao 5 v�n l��ng �� tr�ng ph�n s� m�n. T� �� v� sau c� th� t�y � ra v�o s� m�n.<enter><color=red>H�c ���c v� c�ng<color>: Nh� Lai Thi�n Di�p, D�ch C�n Kinh.<enter>���c ph�ng l�m H� Ph�p Tr��ng L�o."},
		},
		[8] = {
			[1] = {"<color=red>Y�u c�u<color>: T� c�p <color=yellow>90<color> tr� l�n, danh v�ng tr�n <color=yellow>240<color> �i�m, l� <color=yellow>Thi�u L�m k� danh �� t�<color>, tr��c m�t ch�a gia nh�p m�n ph�i n�o.(Ch� ��)<enter><color=red>Ph�n th��ng<color>: h�c ���c <color=yellow>��t Ma �� Giang , Ho�nh T�o Thi�n Qu�n , V� T��ng Tr�m<color>. Danh v�ng ���c <color=yellow>30<color> �i�m. (T�t c� c�c m�n ph�i kh�c ��u c� th� l�m nhi�m v� n�y �� nh�n ph�n th��ng �i�m danh v�ng, nh�ng kh�ng h�c ���c chi�u th�c).<enter><color=red>B��c 1<color>: T� b�t k� th�nh ch�nh n�o b�n �i Xa phu -> Hoa S�n C�nh k� tr��ng g�p Th��ng B�ch L� v� L� ��ch Phong <color=yellow>(326/224)<color>, nh�n nhi�m v�.<enter><color=red>B��c 2<color>: V� Thi�u L�m ��n ��t Ma ���ng <color=yellow>(210/188)<color> t�m g�p Huy�n Bi.<enter><color=red>B��c 3<color>: Sang La H�n ���ng <color=yellow>(202/192)<color>, g�p Huy�n Nan.<enter><color=red>B��c 4<color>: Tr� l�i ��t Ma ���ng n�i chuy�n v�i Huy�n Bi nh�n l�nh b�i �� �i th�c hi�n nhi�m v�.<enter><color=red>B��c 5<color>: Quay l�i Hoa S�n C�nh k� tr��ng g�p Th��ng B�ch L� v� L� ��ch Phong �� ��a l�nh b�i.<enter><color=red>B��c 6<color>: ��nh b�i Kim Qu�c T��ng L�nh <color=yellow>(323/240)<color> r�i g�p Th��ng B�ch L� v� L� ��ch Phong b�o tin.<enter><color=red>B��c 7<color>: V� Thi�u L�m ��n ��t Ma ���ng t�m g�p Huy�n Bi b�o tin.<enter><color=red>B��c 8<color>: Sang La H�n ���ng, g�p Huy�n Nan b�o tin, ho�n th�nh nhi�m v�."},
			[2] = {"L�n Hoa S�n C�nh K� Tr��ng g�p Th��ng B�ch L� v� L� D�ch Phong","L�n Hoa S�n C�nh K� Tr��ng g�p Th��ng B�ch L� v� L� D�ch Phong",0	,0,	2,	326,	224},
			[3] = {"T�m g�p Huy�n Bi","V� Thi�u L�m ��n ��t Ma ���ng <color=yellow>(210/188)<color> t�m g�p Huy�n Bi."	,0,	1	,105,1599	,3191},
			[4] = {"��n La H�n ���ng g�p Huy�n Nan","Sang La H�n ���ng <color=yellow>(202/192)<color>, g�p Huy�n Nan."	,0,	0	,103	,202	,192},
			[5] = {"T�m g�p Huy�n Bi nh�n l�nh b�i.","Tr� l�i ��t Ma ���ng n�i chuy�n v�i Huy�n Bi nh�n l�nh b�i �� �i th�c hi�n nhi�m v�.",0,1,105,1599,3191},
			[6] = {"Tr� l�i t�m Th��ng B�ch L� v� L� D�ch Phong ��a l�nh b�i.","Quay l�i Hoa S�n C�nh k� tr��ng g�p Th��ng B�ch L� v� L� ��ch Phong �� ��a l�nh b�i.",	0,	0,	2,	326,	224},
			[7] = {"Ti�u di�t Kim Qu�c t��ng l�nh","��nh b�i Kim Qu�c T��ng L�nh <color=yellow>(323/240)",	1,	0,	2,	323,	240},
			[8] = {"Tr� l�i t�m Th��ng B�ch L� v� L� D�ch Phong b�o tin ti�u di�t Kim Qu�c t��ng l�nh.","Tr� l�i t�m Th��ng B�ch L� v� L� D�ch Phong b�o tin ti�u di�t Kim Qu�c t��ng l�nh",	0,	0,	2,	326,	224},
			[9] = {"Tr� v� t�m g�p Huy�n Bi b�o tin","Tr� v� t�m g�p Huy�n Bi b�o tin",	0,	1,	105,	1599,	3191},
			[10] = {"B�o tin cho Huy�n Nan","B�o tin cho Huy�n Nan",	0,	0,	103,	202,	192},
		},
		[9] = {
			[1] = {"M�t t�ch k� n�ng 120 c� th� ��i t�i ch��ng m�n. <enter>V�t ph�m c�n thi�t �� ��i:<enter>1 quy�n B�n Nh��c T�m Kinh, 1 b� s�ch k� n�ng 90 c�a m�n ph�i m�nh, 1 vi�n Tinh H�ng B�o Th�ch v� 1 vi�n Th�y Tinh."},
		},
		[10] = {
			[1] = {"<color=red>B��c 1<color>: ��n Bi�n Kinh ph� r�i �i theo h��ng t�y nam ��n ch�a Thi�u L�m. V�o trong ch�a g�p Tri T�ng Kh�ch (211/195) �ng ta mu�n b�n ch�ng t� 4 ph�m ch�t: X�ch ��m trung t�m, h�o nhi�n ch�nh kh�, ki�n nh�n b�t ��t v� v� t� v� ng�.<enter><color=red>B��c 2<color>: Quay l�i Bi�n Kinh ph�, ��n t�m T�n Kh�i T�t (220/187) l�y ���c Qu�ng Ho�c H��ng.<enter><color=red>B��c 3<color>: G�p Kim Qu�c V� S� (209/201) nh�n ���c Ki�n Tinh Th�ch.<enter><color=red>B��c 4<color>: ��n c�ng th�nh ph�a B�c T�n g�u v�i V� Binh Th�nh M�n (198/187), h�n s� h�i b�n v� l�ng trung th�nh, b�n h�y ch�n c�u tr� l�i th� hai ���c t�ng X�ch ��ng Kho�ng.<enter><color=red>B��c 5<color>: Mang c� 3 m�n n�y t�ng cho Ng��i �n m�y (210/186) v� ���c giao cho m�t L� th�. C�m l� th� �� v� ch�a Thi�u L�m giao l�i cho Tri T�ng Kh�ch , th� l� ���c ti�p nh�n l�m �� t� k� danh"},
			[2] = {"G�p Tri Kh�ch T�ng	","��n Bi�n Kinh ph� r�i �i theo h��ng t�y nam ��n ch�a Thi�u L�m. V�o trong ch�a g�p Tri T�ng Kh�ch",0	,0	,103,	211,	195},
			[3] = {"��n Bi�n Kinh t�m T�n Kh�i T�t l�y Qu�ng H�c H��ng","Quay l�i Bi�n Kinh ph�, ��n t�m T�n Kh�i T�t (220/187) l�y ���c Qu�ng Ho�c H��ng",	0,	0,	37,	220	,187},
			[4] = {"G�p Kim Qu�c V� S� l�y Kim Tinh Th�ch","G�p Kim Qu�c V� S� (209/201) nh�n ���c Ki�n Tinh Th�ch"	,0,	0,	37,	209	,201},
			[5] = {"N�i chuy�n v�i v� binh th�nh m�n ph�a b�c",	"��n c�ng th�nh ph�a B�c T�n g�u v�i V� Binh Th�nh M�n (198/187), h�n s� h�i b�n v� l�ng trung th�nh, b�n h�y ch�n c�u tr� l�i th� hai ���c t�ng X�ch ��ng Kho�ng",0	,0,	37,	198	,187},
			[6] = {"T�m g�p ng��i �n m�y t�ng 3 b�o v�t","Mang c� 3 m�n n�y t�ng cho Ng��i �n m�y (210/186) v� ���c giao cho m�t L� th�"	,0	,1,	37,	1685,	2998},
			[7] = {"Tr� v� giao th� cho Tri Kh�ch T�ng","C�m l� th� �� v� ch�a Thi�u L�m giao l�i cho Tri T�ng Kh�ch , th� l� ���c ti�p nh�n l�m �� t� k� danh",	0,	0,	103,	211,	195},
		},
	},
	[1] = {--Thien vuong OK
		[1] = {
			[1] = {"S� ���c phong l�: Tr��ng Th� V�. H�c ���c v� c�ng: Thi�n V��ng Th��ng Ph�p, Thi�n V��ng �ao ph�p, Thi�n V��ng Ch�y ph�p, N�i ti�p nh�n nhi�m v�: Ti�n S� V��ng T�.<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1<color>: ��n ��i �i�n (201/198) g�p Ti�n S� V��ng T� nh�n nhi�m v�. �i t�m 3 vi�n K� Huy�t Th�ch.<enter><color=red>B��c 2<color>: ��n S�n ��ng (225/185) ph�a ��ng b�c c�a ��o, t�m ��nh Kim Mi�u V��ng (225/201),(196/191), X� L� Tinh (234/196), ��i Ho�n H�ng (210/195),(209/185) cho ��n khi nh�n �� 3 vi�n K� Huy�t Th�ch<enter><color=red>B��c 3<color>: Mang K� Huy�t Th�ch v� giao cho Ti�n S� V��ng T�, ho�n th�nh nhi�m v�."},
			[2] = {"G�p V��ng T�","",0,1,60,1599,3185},
			[3] = {"��nh Kim Mi�u V��ng","",1,1,65,1810,3210},
			[4] = {"V� g�p V��ng T�","",0,1,60,1599,3185},
		},
		[2] = {
			[1] = {"S� ���c phong l�: Th� Tr�i H�n T��ng. H�c ���c v� c�ng: T�nh T�m quy�t. N�i ti�p nh�n nhi�m v�: H�u S� D��ng H�.<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1<color>: ��n ph�a Nam T�m Cung g�p H�u S� D��ng H� (218/198) nh�n nhi�m v�.<enter><color=red>B��c 2<color>: �i Ba L�ng Huy�n -> V� L�ng S�n -> B�ch Th�y ��ng. V�o ��ng ��nh t�n Th� Ph� ��u m�c (203/194), (194/196), (206/201) ��n khi nh�n ���c 1 l� c� G�m.<enter><color=red>B��c 3<color>: Mang c� v� giao cho H�u S� D��ng H� (218/198), ho�n th�nh nhi�m v�.<enter><color=red>Ch� �<color>: ��nh �i ��nh l�i c� 3 Th� Ph� ��u M�c ��n khi nh�n ���c C� G�m"},
			[2] = {"G�p D��ng H�","",0,1,59,1749,3173},
			[3] = {"Th� ph� ��u m�c 1","",1,1,71,1630,3114},
			[4] = {"Th� ph� ��u m�c 2","",1,1,71,1554,3149},
			[5] = {"Th� ph� ��u m�c 3","",1,1,71,1650,3216},
			[6] = {"G�p D��ng H�","",0,1,59,1749,3173},
		},
		[3] = {
			[1] = {"S� ���c phong l�: Ch��ng �� ��u L�nh. H�c ���c v� c�ng: B�t Phong Tr�m, D��ng Quan Tam Di�p, H�ng V�n Quy�t, N�i ti�p nh�n nhi�m v�: T� S� C� B�ch.<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1<color>: ��n ph�a T�y Qu�ng Tr��ng g�p T� S� C� B�ch (202/193). Nh�n l�i gi�p �ng ta t�m Thi�n V��ng L�nh.<enter><color=red>B��c 2<color>: �i Ba L�ng huy�n -> Mi�u L�nh -> Y�n T� ��ng, ��nh b�i B�o T� ��u (191/210) cho ��n khi nh�n ���c Thi�n V��ng L�nh m�i th�i.<enter><color=red>B��c 3<color>: Mang Tr� v� giao Thi�n V��ng L�nh cho T� S� C� B�ch (202/193), ho�n th�nh nhi�m v�."},
			[2] = {"G�p C� B�ch","",0,1,59,1619,3092},
			[3] = {"��nh B�o t� ��u l�y Thi�n V��ng l�nh","",1,1,77,1528,3360},
			[4] = {"V� g�p C� B�ch","",0,1,59,1619,3092},
		},
		[4] = {
			[1] = {"S� ���c phong l�: Th�y ��o Th�ng L�nh. H�c ���c v� c�ng: �o�n H�n Th�ch, N�i ti�p nh�n nhi�m v�: L� V�n Vi�n.<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1<color>: ��n Thi�n V��ng ��i �i�n (214/192) g�p Thi�n H� Ph�p L� V�n Vi�n nh�n nhi�m v�.<enter><color=red>B��c 2<color>: ��n Ba L�ng Huy�n g�p Ng� th�n Y (199/200). �ng ta n�i c�n ph�i c� 2 lo�i d��c li�u l� v�y th�n l�n l�a v� l�ng mai r�a l�c m�o.<enter><color=red>B��c 3<color>: T� Ba L�ng Huy�n -> V� L�ng S�n -> Ph�c L�u ��ng. ��nh c�c con Th�n L�n �� (179/190), (216/190), (204/192), (188/183) l�y v�y th�n l�n l�a.<enter><color=red>B��c 4<color>: V� Thi�n V��ng ��o g�p l�o Ng� �ng (179/210). �ng �y ch�p nh�n cho b�n con r�a xanh v�i �i�u ki�n b�n ph�i t�m cho �ng �y v�i con giun ��t v� l�m m�i c�u.<enter><color=red>B��c 5<color>: Qua g�p c�u b� Th�y Sinh (184/212). C�u ta ��ng � ��o cho b�n v�i con giun ��t n�u b�n t�m cho c�u ta m�n tr�ng lu�c c�u ta �a th�ch.<enter><color=red>B��c 6<color>: G�p Ng� Ph� H� T�u (190/213). Nh�n l�i �i mua d�m m�t �t Li�n T�.<enter><color=red>B��c 7<color>: V� Ba l�ng Huy�n, ��n Ti�m t�p h�a (199/198) mua h�t sen �em v� cho Ng� Ph� H� T�u.<enter><color=red>B��c 8<color>: L�n l��t g�p : Ng� Ph� H� T�u -> b� Th�y Sinh -> l�o Ng� �ng.<enter><color=red>B��c 9<color>: L�y ���c 2 v�t ph�m, �em v� ��i �i�n cho L� V�n Vi�n, ho�n th�nh nhi�m v�."},
			[2] = {"G�p L� V�n Vi�n","",0,1,61,1603,3191},
			[3] = {"Ng� th�n y","",0,1,53,1600,3211},
			[4] = {"��nh th�n l�n �� l�y v�y th�n l�n l�a","",1,1,73,1431,3052},
			[5] = {"G�p Ng� �ng","",0,1,59,1429,3378},
			[6] = {"Th�y Sinh","",0,1,59,1479,3405},
			[7] = {"H� T�u","",0,0,59,190,213},
			[8] = {"T�p h�a Ba L�ng Huy�n","",0,0,53,199,198},
			[9] = {"H� T�u","",0,0,59,190,213},
			[10] = {"Th�y Sinh","",0,1,59,1479,3405},
			[11] = {"G�p Ng� �ng","",0,1,59,1429,3378},
			[12] = {"G�p L� V�n Vi�n","",0,1,61,1603,3191},
		},
		[5] = {
			[1] = {"S� ���c phong l�: H� ��o T��ng Qu�n. H�c ���c v� c�ng: Kim Chung Tr�o. N�i ti�p nh�n nhi�m v�: ��a H� Ph�p H� Th�nh.<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1<color>: G�p ��a H� Ph�p H� Th�nh (209/196) nh�n nhi�m v�.<enter><color=red>B��c 2<color>: ��n ��ng ��nh h� (209/196) � ph�a ��ng Thi�n V��ng ��o. V�o t�ng 2, ��nh Th�y Qu�i (209/196) ��n khi n�o l��m ���c �� ng� s�c.<enter><color=red>B��c 3<color>: Tr� V� trao �� ng� s�c cho ��a H� Ph�p H� Th�nh (209/196), ho�n th�nh nhi�m v�."},
			[2] = {"G�p H� Th�nh","",0,1,59,1672,3145},
			[3] = {"��nh Th�y Qu�i l�y �� ng� s�c","",1,1,67,1420,3140},
			[4] = {"G�p H� Th�nh","",0,1,59,1672,3145},
		},
		[6] = {
			[1] = {"S� ���c phong l�: K�nh Thi�n Nguy�n So�i. N�i ti�p nh�n nhi�m v�: Thi�n V��ng Bang Ch� D��ng Anh.<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1<color>: ��n T�m Cung g�p bang ch� D��ng Anh (223/196), nh�n nhi�m v� �i l�y Thi�n V��ng Di Th�.<enter><color=red>B��c 2<color>: Ra b�n t�u (177/216), ��n Thanh Loa ��o.<enter><color=red>B��c 3<color>: ��nh m�t trong 5 con m�nh th�: C�c Tinh (194/195), (201/187), C� S�u Tinh (184/188), (186/197), Th�n L�n Tinh (206/194) l�y ch�a kh�a.<enter><color=red>B��c 4<color>: C� ���c ch�a kh�a, ��n m� r��ng tr�n Thanh Loa ��o (205/186). Ph�t hi�n r��ng tr�ng kh�ng. Di Th� �� b� m�t nh�m ng��i l�y �i, ch�y v�o Thanh Loa s�n ��ng.<enter><color=red>B��c 5<color>: V�o Thanh Loa s�n ��ng ��nh b�i �� T� (240/199). L�y l�i ���c Di Th�.<enter><color=red>B��c 6<color>: Mang Di th� v� cho bang ch� D��ng Anh (223/196), ho�n th�nh nhi�m v�."},
			[2] = {"G�p D��ng Anh","",0,1,62,1609,3199},
			[3] = {"Ra b�n t�u �i Thanh Loa ��o","",1,1,59,1416,3467},
			[4] = {"Ti�u di�t C�c tinh ki�m ch�a kh�a","",1,1,68,1552,3125},
			[5] = {"M� r��ng t�m ki�m b�c th�","",1,1,68,1643,2985},
			[6] = {"��nh b�i �� T� l�y thi�n v��ng di th�","",1,1,69,1920,3190},
			[7] = {"Mang di th� cho bang ch� D��ng Anh","",0,1,62,1609,3199},
		},
		[7] = {
			[1] = {"Nhi�m v� tr�ng ph�n s� m�n. Ch� c�n n�p 5 v�n l��ng l� c� th� ho�n th�nh"},
		},
		[8] = {
			[1] = {"K� n�ng 90 c� b�n t�i c�a h�ng tinh l�c hay k� tr�n c�c"},
		},
		[9] = {
			[1] = {"C� b�n t�i k� tr�n c�c"},
		},
		[10] = {
			[1] = {"Ch�c n�ng ch�a ph�t tri�n"},
		},
	},
	[2] = { --���ng M�n OK
		[1] = {
			[1] = {"S� ���c phong l�: <color=yellow>Tr�ng �inh<color>.<enter>H�c ���c v� c�ng: ���ng M�n �m kh� , ��a Di�m H�a <enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1:<color> ��n ph�ng v� c�ng (510,317), g�p ���ng H�c ti�p nh�n nhi�m v� truy t�m Ma V� Ch�m.<enter><color=red>B��c 2:<color> ��n Th�nh �� (t� ���ng M�n ch�y xu�ng c�ng ph�a d��i), t�m Mai N��ng (389,315).<enter><color=red>B��c 3:<color> ��n nh� T�n Uy�n (394,323). C� �y ch�p nh�n ��i cho b�n Ma V� Ch�m l�y 1 c�i Nh�n M� N�o.<enter><color=red>B��c 4:<color> ��n Ti�m t�p h�a trong Th�nh �� (386,321) d�ng 500 l��ng mua chi�c Nh�n M� N�o , tr� v� ��i cho T�n Uy�n l�y Ma V� Ch�m.<enter><color=red>B��c 5:<color> Tr� v� ���ng M�n, giao Ma V� Ch�m cho ���ng H�c , ho�n th�nh nhi�m v�."},
			[2] = {"��n ph�ng v� c�ng g�p ���ng H�c","��n ph�ng v� c�ng (510,317), g�p ���ng H�c ti�p nh�n nhi�m v� truy t�m Ma V� Ch�m.",0,1,31,1607,3204},
			[3] = {"��n Th�nh �� g�p Mai N��ng","��n Th�nh �� (t� ���ng M�n ch�y xu�ng c�ng ph�a d��i), t�m Mai N��ng (389,315).",0,1,11,3116,5053},
			[4] = {"G�p T�n Uy�n ��i Ma V� Ch�m","��n nh� T�n Uy�n (394,323). C� �y ch�p nh�n ��i cho b�n Ma V� Ch�m l�y 1 c�i Nh�n M� N�o.",0,1,11,3155,5184},
			[5] = {"Mua nh�n m� n�o t�i t�p h�a","��n Ti�m t�p h�a trong Th�nh �� (386,321) d�ng 500 l��ng mua chi�c Nh�n M� N�o",0,1,11,3094,5139},
			[6] = {"Mang nh�n M� N�o ��i Ma V� Ch�m c�a T�n Uy�n","Tr� v� ��i Nh�n M� N�o l�y Ma V� Ch�m",0,1,11,3155,5184},
			[7] = {"Giao Ma V� Ch�m cho ���ng H�c","Tr� v� ���ng M�n, giao Ma V� Ch�m cho ���ng H�c , ho�n th�nh nhi�m v�.",0,1,31,1607,3204},
		},
		[2] = {
			[1] = {"S� ���c phong l�: <color=yellow>H� Vi�n<color>.<enter>H�c ���c v� c�ng: ��c Th�ch C�t<enter>N�i ti�p nh�n nhi�m v�: ���ng Nh�t Tr�n.<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1:<color> ��n ��i s�nh Ph�ng ngh� s� (507,319) g�p ���ng Nh�t Tr�n , nh�n nhi�m v�.<enter><color=red>B��c 2:<color> ��n V� T�m C�c (t� ���ng M�n �i sang c�ng b�n ph�a ��ng b�c) ��nh b�i 2 con G�u Ng�a (526,291), (531,293) v� 2 con X� L� tinh (528,294), (524,290) l�y ���c 4 s�i t� tr�n �� ghi kh�u quy�t.<enter><color=red>B��c 3:<color> ��n tr��c c�n nh� � V� T�m C�c (528,291), nh�p v�o khung c�a s� ��i tho�i v�i ���ng U.<enter><color=red>B��c 4:<color> ��n h� Ph� Th�y � ph�a T�y ���ng M�n, ph�t hi�n ra m�t con X�ch Di�m Ng�c (c� s�u) (472,324), ��nh b�i n� l�y ���c Kim H�ng Quy�n (X�c su�t 50 %).<enter><color=red>B��c 5:<color> Tr� l�i V� T�m C�c, nh�p v�o c�a g�, ��i tho�i v�i ���ng U. B� ta y�u c�u b�n mang s�i d�y chuy�n v� giao cho ch��ng m�n ���ng C�u.<enter><color=red>B��c 6:<color> ��n ph�ng kh�ch (508,322) g�p Ch��ng m�n ���ng C�u giao Kim H�ng Quy�n , ho�n th�nh nhi�m v�."},
			[2] = {"G�p ���ng Nh�t Tr�n","��n ��i s�nh Ph�ng ngh� s� (507,319) g�p ���ng Nh�t Tr�n , nh�n nhi�m v�.",0,1,34,1593,3204},
			[3] = {"��nh b�i G�u Ng�a - T�a �� 1","L�y ���c m�t trong 4 s�i t� tr�n �� ghi kh�u quy�t.",1,1,25,4211,4674},
			[4] = {"��nh b�i G�u Ng�a - T�a �� 2","L�y ���c m�t trong 4 s�i t� tr�n �� ghi kh�u quy�t.",1,1,25,4248,4688},
			[5] = {"��nh b�i X� L� Tinh - T�a �� 1","L�y ���c m�t trong 4 s�i t� tr�n �� ghi kh�u quy�t.",1,1,25,230,4724},
			[6] = {"��nh b�i X� L� Tinh - T�a �� 2","L�y ���c m�t trong 4 s�i t� tr�n �� ghi kh�u quy�t.",1,1,25,4197,4635},
			[7] = {"��i tho�i v�i ���ng U trong c�n nh� g�","��n tr��c c�n nh� � V� T�m C�c (528,291), nh�p v�o khung c�a s� ��i tho�i v�i ���ng U.",1,1,25,4227,4667},
			[8] = {"��nh X�ch Di�m Ng�c [C� S�u ��] l�y Kim H�ng Quy�n","��n h� Ph� Th�y � ph�a T�y ���ng M�n, ph�t hi�n ra m�t con X�ch Di�m Ng�c (c� s�u) (472,324), ��nh b�i n� l�y ���c Kim H�ng Quy�n (X�c su�t 50 %).",1,1,25,3716,5050},
			[9] = {"Tr� l�i g�p ���ng U n�i chuy�n","Tr� l�i V� T�m C�c, nh�p v�o c�a g�, ��i tho�i v�i ���ng U. B� ta y�u c�u b�n mang s�i d�y chuy�n v� giao cho ch��ng m�n ���ng C�u.",1,1,25,4227,4667},
			[10] = {"Giao Kim H�ng Quy�n cho ���ng C�u","��n ph�ng kh�ch (508,322) g�p Ch��ng m�n ���ng C�u giao Kim H�ng Quy�n , ho�n th�nh nhi�m v�.",0,1,33,1617,3191},
		},
		[3] = {
			[1] = {"S� ���c phong l�: <color=yellow>Gi�i Ti�n H� V�<color>.<enter>H�c ���c v� c�ng:<enter>Truy T�m Ti�n<enter>M�n Thi�n Hoa V� <enter>�o�t H�n Ti�u<enter>Xuy�n T�m Th� <enter>N�i ti�p nh�n nhi�m v�: <color=yellow>���ng B�t Nhi�m<color>.<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1:<color> ��n ph�ng T� t� ph�ng (514,318), g�p ���ng B�t Nhi�m, nh�n nhi�m v�. Gi�p ���ng V�n s� th�c tr� th� v� l�y l�i H�a Kh� ph�.<enter><color=red>B��c 2:<color> ��n Th�nh �� -> Thanh Th�nh S�n -> B�ch V�n ��ng (356,242) ��nh b�i ��i ��u m�c Cu�ng Sa (229,200), bi�t ���c H�a Kh� ph� �� b� gi�u trong r��ng. C�n ch�a kh�a b� gi�u t�i m�t n�i n�o �� trong ��ng.<enter><color=red>B��c 3:<color> ��nh b�i 4 t�n ti�u ��u m�c: ��c Nh� (218,200), Thi�t T� (219,207), Qu� �nh (239,202), L�ch Quy�n (228,197), l�y ���c ch�a kh�a (x�c su�t 50%), m� r��ng (230,199) l�y ���c H�a Kh� ph�.<enter><color=red>B��c 4:<color> Tr� v� ���ng M�n, ��n ph�ng H�a d��c (512,324) giao H�a Kh� ph� cho ���ng V�n, ho�n th�nh nhi�m v�."},
			[2] = {"G�p ���ng B�t Nhi�m","��n ph�ng T� t� ph�ng (514,318), g�p ���ng B�t Nhi�m, nh�n nhi�m v�. Gi�p ���ng V�n s� th�c tr� th� v� l�y l�i H�a Kh� ph�.",0,1,36,1595,3189},
			[3] = {"��nh ��i ��u M�c Cu�ng Sa - B�ch V�n ��ng","��n Th�nh �� -> Thanh Th�nh S�n -> B�ch V�n ��ng (356,242) ��nh b�i ��i ��u m�c Cu�ng Sa (229,200), bi�t ���c H�a Kh� ph� �� b� gi�u trong r��ng. C�n ch�a kh�a b� gi�u t�i m�t n�i n�o �� trong ��ng.",1,1,22,1831,3200},
			[4] = {"��nh b�i ��c Nh�","��nh b�i ��c Nh� l�y ���c ch�a kh�a (x�c su�t 50%)",1,1,22,1748,3201},
			[5] = {"��nh b�i Thi�t T�","��nh b�i Thi�t T� l�y ���c ch�a kh�a (x�c su�t 50%)",1,1,22,1757,3313},
			[6] = {"��nh b�i Qu� �nh","��nh b�i Qu� �nh l�y ���c ch�a kh�a (x�c su�t 50%)",1,1,22,1910,3241},
			[7] = {"��nh b�i L�ch Quy�n","��nh b�i L�ch Quy�n l�y ���c ch�a kh�a (x�c su�t 50%)",1,1,22,1833,3148},
			[8] = {"M� R��ng l�y h�a Kh� Ph�","M� R��ng l�y h�a Kh� Ph�",1,1,22,1841,3194},
			[9] = {"Mang h�a Kh� Ph� cho ���ng V�n","Tr� v� ���ng M�n, ��n ph�ng H�a d��c (512,324) giao H�a Kh� ph� cho ���ng V�n, ho�n th�nh nhi�m v�.",0,1,30,1599,3203},
		},
		[4] = {
			[1] = {"S� ���c phong l�: <color=yellow>Nh�p C�c �� T�<color>.<enter>H�c ���c v� c�ng: H�n B�ng Th�ch <enter>N�i ti�p nh�n nhi�m v�: ���ng D�<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1:<color> ��n ph�ng Y D��c (515,322) g�p ���ng D�, nh�n nhi�m v�.<enter><color=red>B��c 2:<color> ��n Th�nh �� -> Thanh Th�nh S�n, �i th�ng v� ph� t�y g�p C�nh T� K� (230,245). �ng ta b�t b�n ph�i v��t qua m�t th� th�ch l� ��nh b�i n�m con gia s�c c�a �ng ta l�: S�i x�m (238,244), M�nh H� (241,259), Kim Ti�n B�o (224,247), Heo R�ng (234,236), T�ng H�ng (241,238).<enter><color=red>B��c 3:<color> Sau khi ��nh b�i n�m con th�, quay l�i g�p C�nh T� K�. C�nh T� K� nh� b�n t�m c�ch c�u con g�i �ng ta �ang l�m tr�ng b�nh.<enter><color=red>B��c 4:<color> Tr� l�i ���ng M�n ��n ph�ng Y D��c, g�p ���ng D� . �ng ta b�o cho b�n bi�t ph��ng thu�c ch�a c�n b�nh k� l� ��.<enter><color=red>B��c 5:<color> Tr� l�n Thanh Th�nh S�n , t�i Thanh D��ng phong (297,233) � ��ng B�c Thanh Th�nh s�n, ��nh b�i Hung Th� v� Linh �i�u (316,215), (304,227), (304,218), (308,225), (314,223), H�c �ng (297,231) l�y ���c n�m lo�i d��c li�u: da c�a Ve s�u, gan r�n ��c, v� h�t Anh T�c, �u�i r�t ��c, ��u c�a Thi�n t�m.<enter><color=red>B��c 6:<color> Quay l�i g�p C�nh T� K� . C�nh T� K� t� � h�i h�n v� �� hi�u l�m ���ng D� tr��c ��y.<enter><color=red>B��c 7:<color> Tr� l�i ���ng M�n ��n ph�ng Y D��c, b�o l�i k�t qu� v�i ���ng D� . Ho�n th�nh nhi�m v�"},
			[2] = {"G�p ���ng D�","��n ph�ng Y D��c (515,322) g�p ���ng D�, nh�n nhi�m v�.",0,1,32,1603,3210},
			[3] = {"G�p C�nh T� K�","��n Th�nh �� -> Thanh Th�nh S�n, �i th�ng v� ph� t�y g�p C�nh T� K� (230,245). �ng ta b�t b�n ph�i v��t qua m�t th� th�ch l� ��nh b�i n�m con gia s�c c�a �ng ta l�: S�i x�m (238,244), M�nh H� (241,259), Kim Ti�n B�o (224,247), Heo R�ng (234,236), T�ng H�ng (241,238).",1,1,21,1846,3924},
			[4] = {"��nh b�i S�i X�m","��nh b�i S�i X�m",1,1,21,1906,3913},
			[5] = {"��nh b�i M�nh H�","��nh b�i M�nh H�",1,0,21,241,259},
			[6] = {"��nh b�i Kim Ti�n B�o","��nh b�i Kim Ti�n B�o",1,1,21,1797,3952},
			[7] = {"��nh b�i Heo R�ng","��nh b�i Heo R�ng",1,1,21,1881,3788},
			[8] = {"��nh b�i T�ng H�ng","��nh b�i T�ng H�ng",1,0,21,241,238},
			[9] = {"Quay l�i g�p C�nh T� K�","Sau khi ��nh b�i n�m con th�, quay l�i g�p C�nh T� K�. C�nh T� K� nh� b�n t�m c�ch c�u con g�i �ng ta �ang l�m tr�ng b�nh.",1,1,21,1846,3924},
			[10] = {"Tr� l�i ���ng M�n ��n ph�ng Y D��c, g�p ���ng D�","Tr� l�i ���ng M�n ��n ph�ng Y D��c, g�p ���ng D� . �ng ta b�o cho b�n bi�t ph��ng thu�c ch�a c�n b�nh k� l� ��.",0,1,32,1603,3210},
			[11] = {"��nh b�i Hung Th� - T�a �� 1","L�y ���c m�t trong n�m lo�i d��c li�u: da c�a Ve s�u, gan r�n ��c, v� h�t Anh T�c, �u�i r�t ��c, ��u c�a Thi�n t�m.",1,1,21,2545,3415},
			[12] = {"��nh b�i Hung Th� - T�a �� 2","L�y ���c m�t trong n�m lo�i d��c li�u: da c�a Ve s�u, gan r�n ��c, v� h�t Anh T�c, �u�i r�t ��c, ��u c�a Thi�n t�m.",1,1,21,2436,3635},
			[13] = {"��nh b�i Linh �i�u - T�a �� 1","L�y ���c m�t trong n�m lo�i d��c li�u: da c�a Ve s�u, gan r�n ��c, v� h�t Anh T�c, �u�i r�t ��c, ��u c�a Thi�n t�m.",1,1,21,2535,3448},
			[14] = {"��nh b�i Linh �i�u - T�a �� 2","L�y ���c m�t trong n�m lo�i d��c li�u: da c�a Ve s�u, gan r�n ��c, v� h�t Anh T�c, �u�i r�t ��c, ��u c�a Thi�n t�m.",1,1,21,2434,3492},
			[15] = {"��nh b�i Linh �i�u - T�a �� 3","L�y ���c m�t trong n�m lo�i d��c li�u: da c�a Ve s�u, gan r�n ��c, v� h�t Anh T�c, �u�i r�t ��c, ��u c�a Thi�n t�m.",1,1,21,2502,3578},
			[16] = {"��nh b�i H�c �ng","L�y ���c m�t trong n�m lo�i d��c li�u: da c�a Ve s�u, gan r�n ��c, v� h�t Anh T�c, �u�i r�t ��c, ��u c�a Thi�n t�m.",1,1,21,2370,3708},
			[17] = {"Quay l�i g�p C�nh T� K�","Quay l�i g�p C�nh T� K� . C�nh T� K� t� � h�i h�n v� �� hi�u l�m ���ng D� tr��c ��y.",1,1,21,1846,3924},
			[18] = {"Tr� l�i ���ng M�n ��n ph�ng Y D��c, g�p ���ng D�","Tr� l�i ���ng M�n ��n ph�ng Y D��c, b�o l�i k�t qu� v�i ���ng D� . Ho�n th�nh nhi�m v�",0,1,32,1603,3210},
		},
		[5] = {
			[1] = {"S� ���c phong l�: T� L�o M�n Nh�n.<enter>H�c ���c v� c�ng: L�i K�ch thu�t<enter>N�i ti�p nh�n nhi�m v�: ���ng Nh�n.<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1:<color> ��n ph�ng �m kh� (504/317) g�p ���ng Nh�n, nh�n nhi�m v� truy t�m b� k�p b� m�t.<enter><color=red>B��c 2:<color> ��n ph�ng Ngh� s� (507/319) g�p ���ng Nh�t Tr�n , bi�t ���c c� 2 k� ��ng kh� nghi.<enter><color=red>B��c 3:<color> ��n Th�nh �� -> th�n Giang T�n, g�p ���ng Nguy�n (430/385). ���ng Nguy�n cho bi�t �� th�y ���ng H�a �� �i ��n H��ng Th�y ��ng.<enter><color=red>B��c 4:<color> ��n Th�nh �� -> Thanh Th�nh S�n -> H��ng Th�y ��ng (214/242) n�m � c�c t�y c�a n�i Thanh Th�nh. V�o ��ng ��nh b�i ���ng H�a (234/207), bi�t ���c �m Kh� ph� �ang gi�u trong s�n ��ng.<enter><color=red>B��c 5:<color> ��nh b�i c�c t�n ��ng ��ng c�a ���ng H�a l�: Thi�t Quy�n Di�m La (232/210; 214/203; 224/201; 246/204) ho�c Thi�t Ch�y Ma Qu�n (217/205; 234/200). ��nh b�i b�n ch�ng s� l�y l�i ���c �m Kh� ph� (X�c su�t 50%).<enter><color=red>B��c 6:<color> Tr� l�i ph�ng �m kh�, giao �m Kh� ph� cho ���ng Nh�n , ho�n th�nh nhi�m v�."},
			[2] = {"G�p ���ng Nh�n","��n ph�ng �m kh� (504,317) g�p ���ng Nh�n, nh�n nhi�m v� truy t�m b� k�p b� m�t.",0,1,29,1599,3203},
			[3] = {"G�p ���ng Nh�t Tr�n","��n ph�ng Ngh� s� (507,319) g�p ���ng Nh�t Tr�n , bi�t ���c c� 2 k� ��ng kh� nghi.",0,1,34,1593,3204},
			[4] = {"G�p ���ng Nguy�n","��n Th�nh �� -> th�n Giang T�n, g�p ���ng Nguy�n (430,385). ���ng Nguy�n cho bi�t �� th�y ���ng H�a �� �i ��n H��ng Th�y ��ng.",0,1,20,3444,6169},
			[5] = {"��nh b�i ���ng H�a","��n Th�nh �� -> Thanh Th�nh S�n -> H��ng Th�y ��ng (214,242) n�m � c�c t�y c�a n�i Thanh Th�nh. V�o ��ng ��nh b�i ���ng H�a (234,207), bi�t ���c �m Kh� ph� �ang gi�u trong s�n ��ng.",1,0,24,234,207},
			[6] = {"��nh b�i Thi�t Quy�n Di�m La","��nh b�i t�n ��ng ��ng c�a ���ng H�a: Thi�t Quy�n Di�m La l�y l�i ���c �m Kh� ph� (X�c su�t 50%)",1,0,24,232,210},
			[7] = {"��nh b�i Thi�t Ch�y Ma Qu�n","��nh b�i t�n ��ng ��ng c�a ���ng H�a: Thi�t Ch�y Ma Qu�n l�y l�i ���c �m Kh� ph� (X�c su�t 50%)",1,1,24,1736,3295},
			[8] = {"Giao �m Kh� ph� cho ���ng Nh�n","Tr� l�i ph�ng �m kh�, giao �m Kh� ph� cho ���ng Nh�n , ho�n th�nh nhi�m v�.",0,1,29,1599,3203},
		},
		[6] = {
			[1] = {"S� ���c phong l�: Thi�n Th� Th�n V�.<enter>N�i ti�p nh�n nhi�m v�: Ch��ng M�n ���ng C�u.<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1:<color> ��n Ph�ng kh�ch (508,322) g�p Ch��ng m�n ���ng C�u , nh�n nhi�m v� thu h�i Th�t Tinh Tuy�t M�nh Ki�m.<enter><color=red>B��c 2:<color> ��n Tr�c T� ��ng (523,326) (�i c�a b�n ph�i c�a ���ng M�n).<enter><color=red>B��c 3:<color> T�i t�ng 1 ��nh b�i t�n M�ng H�n ��u L�nh (189,205; 185,204; 190,202; 192,200; 197,201) s� l�y ���c ch�a kho� t�ng 2.<enter><color=red>B��c 4:<color> T�i t�ng 2 ��nh b�i Tinh H� (194,198; 197,201) s� l�y ���c ch�a kho� l�n t�ng 3.<enter><color=red>B��c 5:<color> L�n t�ng 3 c� 2 r��ng: tr�n v� d��i (1 ch�a ti�n, 1 ch�a �o�t H�n Ki�m). Ch�n r��ng � tr�n s� l�y ���c Th�t Tinh Tuy�t M�nh Ki�m.<enter><color=red>B��c 6:<color> V� giao ki�m cho Ch��ng m�n ���ng C�u l� ho�n th�nh nhi�m v�. C�n n�u ch�n nh�m r��ng ch�a ti�n th� v� g�p Ch��ng m�n ���ng C�u n�p ph�t 4 v�n l��ng r�i l�m l�i nhi�m v�.<enter><color=red>L�u �:<color><enter>N�u �� l�n ���c t�ng 2 r�i m� b� ch�t th� khi v�o ��ng l�i c� vi�c l�n t�ng 2, kh�ng c�n ��nh l�i � t�ng 1."},
			[2] = {"G�p Ch��ng m�n ���ng C�u","��n Ph�ng kh�ch (508,322) g�p Ch��ng m�n ���ng C�u , nh�n nhi�m v� thu h�i Th�t Tinh Tuy�t M�nh Ki�m.",0,1,33,1617,3191},
			[3] = {"��nh b�i t�n M�ng H�n ��u L�nh","T�i t�ng 1 Tr�c T� ��ng ��nh b�i t�n M�ng H�n ��u L�nh s� l�y ���c ch�a kho� t�ng 2",1,1,26,1512,3290},
			[4] = {"S� d�ng ch�a kh�a l�n t�ng 2","S� d�ng ch�a kh�a v�a l�y ���c t� M�ng H�n ��u L�nh m� ra l�i l�n t�ng 2 Tr�c T� ��ng.",1,1,26,1597,3216},
			[5] = {"��nh b�i Tinh H�","T�i t�ng 2 ��nh b�i Tinh H� (194,198; 197,201) s� l�y ���c ch�a kho� l�n t�ng 3",1,0,27,194,198},
			[6] = {"S� d�ng ch�a kh�a l�n t�ng 3","S� d�ng ch�a kh�a v�a l�y ���c t� Tinh H� m� ra l�i l�n t�ng 3 Tr�c T� ��ng. Ch�n r��ng � tr�n.",1,1,27,1602,3210},
			[7] = {"G�p Ch��ng m�n ���ng C�u","V� giao ki�m cho Ch��ng m�n ���ng C�u l� ho�n th�nh nhi�m v�. ",0,1,33,1617,3191},
		},
		[7] = {
			[1] = {"Y�u c�u: ng��i ch�i �� xu�t s�, ��ng c�p tr�n 60, ch�a gia nh�p bang ph�i n�o, c� th� ��n g�p tr��ng m�n c�a ph�i giao 5 v�n l��ng �� tr�ng ph�n s� m�n. T� �� v� sau c� th� t�y � ra v�o s� m�n.<enter>Ph�n Thu�ng:<enter>Ti�u L� Phi �ao<enter>T�n Hoa Ti�u<enter>Thi�n La ��a V�ng<enter>T�m Nh�n<enter>���c phong l�m: L�c C�c Tr��ng L�o."},
		},
		[8] = {
			[1] = {"Y�u c�u: T� c�p 90 tr� l�n, danh v�ng tr�n 240 �i�m, l� ���ng M�n k� danh �� t�, tr��c m�t ch�a gia nh�p m�n ph�i n�o.<enter>Ph�n th��ng:<enter>Nhi�p H�n Nguy�t �nh<enter>C�u Cung Phi T�nh<enter>B�o V� L� Hoa<enter>Lo�n Ho�n K�ch<enter>Danh v�ng ���c 30 �i�m. (T�t c� c�c m�n ph�i kh�c ��u c� th� l�m nhi�m v� n�y �� nh�n ph�n th��ng �i�m danh v�ng, nh�ng kh�ng h�c ���c chi�u th�c)<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1: <color>��n Th�nh �� -> th�n Giang T�n, g�p ���ng Nguy�n (430,385), bi�t ���c ���ng B�t Nhi�m c� nh�ng d�u hi�u b�t th��ng v� b�n quy�t t�m t�m hi�u cho c�n k� m�i vi�c.<enter><color=red>B��c 2: <color>��n ���ng M�n t�i ph�ng T� t� ph�ng (513,317), g�p ���ng B�t Nhi�m... H�n nh� b�n chuy�n d�m 1 b�c th�.<enter><color=red>B��c 3: <color>��n Bi�n Kinh g�p B�ch C�ng T� (207,191) giao th�. H�n ��c th� m�t h�i r�i giao l�i cho b�n 1 b�c th� h�i �m.<enter><color=red>B��c 4: <color>Quay l�i ���ng M�n giao th� cho ���ng B�t Nhi�m . ��nh b�i ���ng B�t Nhi�m, nh�n quy�n s�ch ���ng M�n Tuy�t H�c M�t T�ch. (L�u �: n�u nh� trong l�c ��nh, b�n c� b� t� th��ng, b�n v�n c� th� v�o ��nh ti�p, m�u c�a ���ng B�t Nhi�m v�n b� m�t nh� th�i �i�m b�n ch�t).<enter><color=red>B��c 5: <color>��n Bi�n Kinh -> Thi�n Nh�n gi�o -> t�ng 1 -> t�ng 2 -> t�ng 3 g�p �oan M�c Du� (225,199) giao s�ch. �oan M�c Du� l�i nh� b�n g�i l�i ��n ���ng B�t Nhi�m.<enter><color=red>B��c 6: <color>Quay l�i ���ng M�n g�p ���ng B�t Nhi�m, ho�n th�nh nhi�m v�.<enter>L�u �:<enter>N�u �� l�n ���c t�ng 2 r�i m� b� ch�t th� khi v�o ��ng l�i c� vi�c l�n t�ng 2, kh�ng c�n ��nh l�i � t�ng 1."},
			[2] = {"G�p ���ng Nguy�n","��n th�n Giang T�n, g�p ���ng Nguy�n, bi�t ���c ���ng B�t Nhi�m c� nh�ng d�u hi�u b�t th��ng v� b�n quy�t t�m t�m hi�u cho c�n k� m�i vi�c.",0,1,20,3444,6169},
			[3] = {"G�p ���ng B�t Nhi�m","��n ���ng M�n t�i ph�ng T� t� ph�ng, g�p ���ng B�t Nhi�m... H�n nh� b�n chuy�n d�m 1 b�c th�.",0,1,36,1595,3189},
			[4] = {"G�p B�ch C�ng T�","��n Bi�n Kinh g�p B�ch C�ng T� giao th�. H�n ��c th� m�t h�i r�i giao l�i cho b�n 1 b�c th� h�i �m.",0,1,37,1656,3062},
			[5] = {"Giao th� cho ���ng B�t Nhi�m","Quay l�i ���ng M�n giao th� cho ���ng B�t Nhi�m . ��nh b�i ���ng B�t Nhi�m, nh�n quy�n s�ch ���ng M�n Tuy�t H�c M�t T�ch.",0,1,36,1595,3189},
			[6] = {"G�p �oan M�c Du�","��n Thi�n Nh�n gi�o t�ng 3 g�p �oan M�c Du� giao s�ch. �oan M�c Du� l�i nh� b�n g�i l�i ��n ���ng B�t Nhi�m.",0,0,49,225,199},
			[7] = {"G�p ���ng B�t Nhi�m","Quay l�i ���ng M�n g�p ���ng B�t Nhi�m, ho�n th�nh nhi�m v�.",0,1,36,1595,3189},
		},
		[9] = {
			[1] = {"M�t t�ch k� n�ng 120 c� th� ��i t�i ch��ng m�n. <enter>V�t ph�m c�n thi�t �� ��i:<enter>1 quy�n B�n Nh��c T�m Kinh, 1 b� s�ch k� n�ng 90 c�a m�n ph�i m�nh, 1 vi�n Tinh H�ng B�o Th�ch v� 1 vi�n Th�y Tinh."},
		},
		[10] = {
			[1] = {"<color=red>B��c 1: <color>T�m c�ch v� Th�nh �� Ph�, r�i ch�y b� theo h��ng ��ng-Nam �� sang ���ng M�n. ��n l�i v�o Tr�c H�i Tam Quan, b�n h�y n�i chuy�n v�i ���ng M�n Tr�ng �inh th� nh�t (453,357), v� xin nh�n l�m �� t� K� danh, y s� n�i cho b�n bi�t ph�i l�m g�.<enter><color=red>B��c 2: <color>Ch� c�n gi�t 1 trong 3 con ��i M� H�u (461,357), (460,354), (455,354) l�y ���c Thanh S�c Tr�c Tr��ng (g�y tr�c m�u xanh).<enter><color=red>B��c 3: <color>R�i �i ti�p g�p ���ng M�n Tr�ng �inh th� 2 (468,349), t�n n�y s� b�t b�n gi�i m�t b�i to�n ma tr�n, n�u b�n c�m th�y kh� kh�n khi gi�i b�i to�n n�y h�y tr� l�i nh� sau: [2-9-4], [7-5-3], [6-1-8]. Gi�i xong b�i to�n ��, y s� t�ng b�n B�ch S�c Tr�c Tr��ng (g�y tr�c m�u tr�ng).<enter><color=red>B��c 4: <color>C�c h� t�m ��n t�n ���ng M�n Tr�ng �inh th� ba (474,342). H�n s� ��a ra m�t s� c�u qu� c�a Kh�ng Minh cho b�n gi�i. (��p �n: Li�t ho� oanh l�i - M�a gi� kh�i sinh - Thi�n tai d�ch h�a. Sau khi tr� l�i xong, y s� t�ng b�n T� S�c Tr�c Tr��ng (g�y tr�c m�u t�m).<enter><color=red>B��c 5: <color>Mang c� 3 c�y g�y �� t�i g�p t�n ���ng M�n Tr�ng �inh th� t� (479,339) v� giao cho h�n. Ho�n th�nh nhi�m v�!"},
			[2] = {"G�p ���ng M�n Tr�ng �inh th� nh�t","��n l�i v�o Tr�c H�i Tam Quan, n�i chuy�n v�i ���ng M�n Tr�ng �inh th� nh�t , v� xin nh�n l�m �� t� K� danh.",1,1,25,3630,5741},
			[3] = {"Gi�t ��i M� H�u","Ch� c�n gi�t 1 trong 3 con ��i M� H�u l�y ���c Thanh S�c Tr�c Tr��ng",1,0,25,461,357},
			[4] = {"G�p ���ng M�n Tr�ng �inh th� 2","G�p ���ng M�n Tr�ng �inh th� 2, t�n n�y s� b�t b�n gi�i m�t b�i to�n ma tr�n, tr� l�i nh� sau: [2-9-4], [7-5-3], [6-1-8]. Gi�i xong ���c B�ch S�c Tr�c Tr��ng.",1,1,25,3749,5599},
			[5] = {"G�p ���ng M�n Tr�ng �inh th� 3","G�p ���ng M�n Tr�ng �inh th� ba. H�n s� ��a ra m�t s� c�u qu� c�a Kh�ng Minh. ��p �n: Li�t ho� oanh l�i - M�a gi� kh�i sinh - Thi�n tai d�ch h�a. Sau khi tr� l�i xong, y s� t�ng b�n T� S�c Tr�c Tr��ng",1,1,25,3792,5480},
			[6] = {"G�p ���ng M�n Tr�ng �inh th� t�","Mang c� 3 c�y g�y �� t�i g�p t�n ���ng M�n Tr�ng �inh th� t� v� giao cho h�n. Ho�n th�nh nhi�m v�!",0,0,25,479,339},
		},
	},
	[3] = { --Ngu doc OK
		[1] = {
			[1] = {"S� ���c phong l�: �o�t H�n T�n Nh�n. H�c ���c v� c�ng: Ng� ��c �ao ph�p, Ng� ��c Ch��ng ph�p, C�u Thi�n Cu�ng L�i. N�i ti�p nh�n nhi�m v�: M�c Th� tr�i, ch� tr�i ��c Nha."},
			[2] = {"G�p Tang Chu","",0,1,186,1599,3193},
			[3] = {"Nh�n 1 (Thu th�p �� 10 con)","",1,1,195,716,2920},
			[4] = {"Nh�n 2 (Thu th�p �� 10 con)","",1,1,195,713,3048},
			[5] = {"Nh�n 3 (Thu th�p �� 10 con)","",1,1,195,726,3169},
			[6] = {"Nh�n 4 (Thu th�p �� 10 con)","",1,1,195,790,3126},
			[7] = {"Mua 10 bao t�n th�ch","",0,1,174,1574,3255},
			[8] = {"Quay v� g�p Tang Chu","",0,1,186,1599,3193},
		},
		[2] = {
			[1] = {"S� ���c phong l�: Th�i M�nh S� gi�. H�c ���c v� c�ng: X�ch Di�m Th�c Thi�n, T�p Nan D��c Kinh, N�i ti�p nh�n nhi�m v�: Ng�n Thi�m tr�i ch� B�ch Doanh Doanh."},
			[2] = {"G�p B�ch Doanh Doanh","",0,1,188,1602,3189},
			[3] = {"S�c Qu� 1 (Thu th�p 7 ��u ng��i)","",1,1,179,1962,2661},
			[4] = {"S�c Qu� 2 (Thu th�p 7 ��u ng��i)","",1,1,179,1976,2724},
			[5] = {"S�c Qu� 3 (Thu th�p 7 ��u ng��i)","",1,1,179,1932,2706},
			[6] = {"S�c Qu� 4 (Thu th�p 7 ��u ng��i)","",1,1,179,1851,2557},
			[7] = {"S�c Qu� 5 (Thu th�p 7 ��u ng��i)","",1,1,179,1809,2599},
			[8] = {"S�c Qu� 6 (Thu th�p 7 ��u ng��i)","",1,1,179,1828,2666},
			[9] = {"S�c Qu� 7 (Thu th�p 7 ��u ng��i)","",1,1,179,1859,2712},
			[10] = {"G�p B�ch Doanh Doanh","",0,1,188,1602,3189},
		},
		[3] = {
			[1] = {"S� ���c phong l�: H�c �m Di�m La. H�c ���c v� c�ng: U Minh Kh� L�u, V� H�nh ��c, B�ch ��c Xuy�n T�m, B�ng Lam Huy�n Tinh. N�i ti�p nh�n nhi�m v�: X�ch Y�t tr�i ch� �� D�."},
			[2] = {"G�p �� D�","",0,1,184,1599,3197},
			[3] = {"��nh b�i Ph�n T�c (l�y M�c H��ng ��nh)","",1,1,193,1170,2928},
			[4] = {"Giao l�i cho �� D�","",0,1,184,1599,3197},
			[5] = {"��nh Ph�n T�c ��u M�c (l�y M�c H��ng ��nh th�t)","",1,1,193,1170,2928},
			[6] = {"Giao cho �� D�","",0,1,184,1599,3197},
		},
		[4] = {
			[1] = {"S� ���c phong l�: V� ��ng La S�t. H�c ���c v� c�ng: V�n ��c Th�c T�m, Xuy�n Y Ph� Gi�p. N�i ti�p nh�n nhi�m v�: Kim X� tr�i ch� V�n B�t T�."},
			[2] = {"G�p V�n B�t T�","",0,1,185,1607,3200},
			[3] = {"��n Hi�u thu�c (Mua X� H��ng)","",0,1,80,1771,3079},
			[4] = {"��nh Nh�n K�nh V��ng M�ng X� (B�t 1 con)","",1,1,183,944,2240},
			[5] = {"G�p V�n B�t T�","",0,1,185,1607,3200},
		},
		[5] = {
			[1] = {"S� ���c phong l�: C� ��c T�n Gi�. H�c ���c v� c�ng: Xuy�n T�m ��c Th�. N�i ti�p nh�n nhi�m v�: Thanh Ng� tr�i ch� Thang B�t."},
			[2] = {"G�p Thang B�t","",0,1,187,1598,3192},
			[3] = {"L�u Kh�u 1 (l�y tin t�c v� Ng�c San H�","",1,1,194,1835,3215},
			[4] = {"L�u Kh�u 2 (l�y tin t�c v� Ng�c San H�","",1,1,194,1561,2816},
			[5] = {"��nh t�n C��ng ��o (l�y Ng�c San H�)","",1,1,182,1896,3464},
			[6] = {"Giao cho Thang B�t","",0,1,187,1598,3192},
		},
		[6] = {
			[1] = {"S� ���c phong l�: U Minh Qu� S�. N�i ti�p nh�n nhi�m v�: Gi�o ch� Ng� ��c gi�o H�c Di�n Lang Qu�n."},
			[2] = {"G�p H�c Di�n Lang Qu�n","",0,1,189,1606,3189},
			[3] = {"��nh Nh�n ��ng ph�i �� t� (��n khi ch��ng m�n xu�t hi�n, ��nh b�i ch��ng m�n l�y T� ��c Chu)","",1,1,196,1648,2944},
			[4] = {"G�p H�c Di�n Lang Qu�n","",0,1,189,1606,3189},
		},
		[7] = {
			[1] = {"G�p H�c Di�n Lang Qu�n n�p ti�n"},
			[2] = {"G�p H�c Di�n Lang Qu�n","",0,1,189,1606,3189},
		},
		[8] = {
			[1] = {"C� b�n trong K� Tr�n C�c"},
		},
		[9] = {
			[1] = {"C� b�n trong K� Tr�n C�c"},
		},
		[10] = {
			[1] = {"Ch�a ho�n thi�n"},
		},
	},
	[4] = { --Nga Mi. OK
		[1] = {
			[1] = {"S� ���c phong l�: <color=yellow>V� Y Ni<color>.<enter>H�c ���c v� c�ng:<color=yellow>Nga My Ki�m ph�p<color>, <color=yellow>Nga My Ch��ng ph�p<color><enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1: <color>��n Ti�n �i�n (238,310) g�p Di�u �n , ti�p nh�n nhi�m v� gi�p c� �y h�n g�n chi�c g��ng ��ng.<enter><color=red>B��c 2: <color>Xu�ng n�i, t�m Di�u �n t��ng c�ng (241,328), nh�p v�o l�i tho�i, nh�n ���c n�a mi�ng g��ng c�n l�i.<enter><color=red>B��c 3: <color>��n Th�nh �� g�p th� r�n (388,320).<enter><color=red>B��c 4: <color>�� hai mi�ng g��ng l�i ch� ng��i th� r�n, �i t�m L��ng Ng�n Kho�ng trong r�ng ph�a t�y Th�nh �� (378,303; 379,299; 386,302; 386,300; 375,301; 375,297; 370,299). Ch� c�n l�y 1 vi�n.<enter><color=red>B��c 5: <color>Giao L��ng Ng�n Kho�ng cho th� r�n, nh�n ���c t�m g��ng �� s�a xong.<enter><color=red>B��c 6: <color>Tr� v� Nga My ph�i g�p Di�u �n.<enter><color=red>B��c 7: <color>Xu�ng n�i, g�p Di�u �n t��ng c�ng , truy�n l�i c�a Di�u �n.<enter><color=red>B��c 8: <color>Tr� v� Nga My ph�i, g�p Di�u �n , ho�n th�nh nhi�m v�."},
			[2] = {"G�p Di�u �n","��n Ti�n �i�n g�p Di�u �n , ti�p nh�n nhi�m v� gi�p c� �y h�n g�n chi�c g��ng ��ng",0,1,16,1604,3170},
			[3] = {"T�m Di�u �n t��ng c�ng","Xu�ng n�i, t�m Di�u �n t��ng c�ng, nh�n ���c n�a mi�ng g��ng c�n l�i.",1,1,13,1927,5260},
			[4] = {"T�m th� r�n Th�nh ��","��n Th�nh �� g�p th� r�n",0,0,11,388,320},
			[5] = {"�i l�y L��ng Ng�n Kho�ng","�� hai mi�ng g��ng l�i ch� ng��i th� r�n, �i t�m L��ng Ng�n Kho�ng trong r�ng ph�a t�y Th�nh ��, Ch� c�n l�y 1 vi�n",1,0,11,378,303},
			[6] = {"Giao L��ng Ng�n Kho�ng cho th� r�n","Giao L��ng Ng�n Kho�ng cho th� r�n, nh�n ���c t�m g��ng �� s�a xong.",0,0,11,388,320},
			[7] = {"G�p Di�u �n","Tr� v� Nga My ph�i g�p Di�u �n.",0,1,16,1604,3170},
			[8] = {"T�m Di�u �n t��ng c�ng","Xu�ng n�i, g�p Di�u �n t��ng c�ng , truy�n l�i c�a Di�u �n..",1,1,13,1927,5260},
			[9] = {"G�p Di�u �n","Tr� v� Nga My ph�i g�p Di�u �n.",0,1,16,1604,3170},
		},
		[2] = {
			[1] = {"S� ���c phong l�: <color=yellow>C�m Y Ni<color>.<enter>H�c ���c v� c�ng: <color=yellow>T� H�ng Ph� ��<color><enter>N�i ti�p nh�n nhi�m v�: Gi�ng Kinh ���ng, Di�u Nh�.<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1: <color>��n Gi�ng Kinh ���ng (240,307) g�p Di�u Nh�, ti�p nh�n nhi�m v� thu ph�c M�nh h�.<enter><color=red>B��c 2: <color>��n M�nh H� huy�t ��ng ph�a sau n�i, trong �� c� ba con B�ch H� (H� Tr�ng) (222,199; 225,201; 222,202), ph�i ��nh ba con n�y li�n t�c ba l�n, s� khu�t ph�c ���c ch�ng.<enter><color=red>B��c 3: <color>Tr� v� Gi�ng Kinh ���ng g�p Di�u Nh� ph�c m�nh, ho�n th�nh nhi�m v�."},
			[2] = {"G�p Di�u Nh�","��n Gi�ng Kinh ���ng g�p Di�u Nh�, ti�p nh�n nhi�m v� thu ph�c M�nh h�",0,1,15,1586,3199},
			[3] = {"��n M�nh H� huy�t ��ng","��n M�nh H� huy�t ��ng ph�a sau n�i, trong �� c� ba con B�ch H�, ph�i ��nh ba con n�y li�n t�c ba l�n, s� khu�t ph�c ���c ch�ng.",1,1,14,1784,3197},
			[4] = {"G�p Di�u Nh�","Tr� v� Gi�ng Kinh ���ng g�p Di�u Nh� ph�c m�nh, ho�n th�nh nhi�m v�",0,1,15,1586,3199},
		},
		[3] = {
			[1] = {"S� ���c phong l�: B�ch Li�n Ti�n T�.<enter>H�c ���c v� c�ng:<enter>Th�i Song V�ng Nguy�t<enter>T� T��ng ��ng Quy<enter>M�ng �i�p<enter>N�i ti�p nh�n nhi�m v�: M�c V�n T�.<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1: <color>��n ph�a sau H�u �i�n (242,305), g�p M�c V�n T�, ti�p nh�n nhi�m v�.<enter><color=red>B��c 2: <color>��n ti�m t�p h�a � Th�nh �� (386,321) mua ch�n g�<enter><color=red>B��c 3: <color>��n ph�a sau n�i, t�m th�y m�t ��m n��c, ��nh b�i n�m con Th�n L�n Ch�a (297,302; 327,294; 312,304; 324,298; 311,300) s� c�u ���c H�a H� (X�c su�t 50%). H�a H� s� ph�n �o�n xem b�n c� ch�n g� hay kh�ng, n�u c� th� b�n c�u n� th�nh c�ng. N�u b�n kh�ng c� ch�n g� th� xem nh� ph�i th�c hi�n nhi�m v� l�i t� ��u.<enter><color=red>B��c 4: <color>Tr� v� giao H�a H� giao cho M�c V�n T� ho�n th�nh nhi�m v�."},
			[2] = {"G�p M�c V�n T�","��n ph�a sau H�u �i�n, g�p M�c V�n T�, ti�p nh�n nhi�m v�",0,1,13,1937,4893},
			[3] = {"��n ti�m t�p h�a � Th�nh ��","��n ti�m t�p h�a � Th�nh �� mua ch�n g�",0,1,11,3095,5137},
			[4] = {"��nh Th�n L�n Ch�a","��n ph�a sau n�i, t�m th�y m�t ��m n��c, ��nh b�i Th�n L�n Ch�a c�u ���c H�a H� (X�c su�t 50%).N�u c� ch�n g� th� b�n c�u n� th�nh c�ng. N�u b�n kh�ng c� ch�n g� th� xem nh� ph�i th�c hi�n nhi�m v� l�i t� ��u",1,0,13,297,302},
			[5] = {"G�p M�c V�n T�","Tr� v� giao H�a H� giao cho M�c V�n T� ho�n th�nh nhi�m v�.",0,1,13,1937,4893},
		},
		[4] = {
			[1] = {"S� ���c phong l�: Thanh Li�n Ti�n T�.<enter>H�c ���c v� c�ng: L�u Th�y<enter>N�i ti�p nh�n nhi�m v�: T� Thi�n �i�n <color=yellow>B�i Nguy�t Ti�n T�<color> T� T� Hinh.<enter>C�c b��c th�c hi�n nhi�m v�<enter><color=red>B��c 1: <color>��n T� Thi�n �i�n (246,304) g�p T� T� Hinh, ti�p nh�n nhi�m v� t�m B�ch �i�u Tri�u Ph�ng kh�c ph�.<enter><color=red>B��c 2: <color>��n Th�nh �� -> Thanh Th�nh S�n -> Th�n Ti�n ��ng. V�o trong ��ng t�m Cao nh�n (234,204), �ng ta s� y�u c�u B�n ��nh b�i con Linh th� (235,203).<enter><color=red>B��c 3: <color>Sau khi ��nh b�i n�, b�n l�i nh�p v�o l�i tho�i v�i Cao nh�n. �ng ta y�u c�u b�n mang b�c tranh Ph� Dung C�m K� ��n ��i kh�c ph�.<enter><color=red>B��c 4: <color>��n Th�i B�nh Ti�u C�c � Th�nh �� ph�, g�p �ng ch� Ti�u C�c (376,316), nh�p v�o l�i tho�i, �ng ta y�u c�u b�n t�m Linh X� H��ng nang, �ng T�nh H� Th�n ph� v� B�ch T� Gi�i Ch�, s� giao Ph� Dung C�m K�.<enter><color=red>B��c 5: <color>V�o trong th�nh �i t�m ba ng��i, b�n s� l�y ���c ba m�n b�o v�t n�i tr�n :<enter>- Linh X� H��ng nang: ��n Th�nh �� t�m Ti�t Ti�u mu�i (383,315), nh�p v�o l�i tho�i, Ti�t Ti�u mu�i y�u c�u b�n mang Ng�n thi�m (Tr�m c�i) ��n ��i. ��n ti�m t�p h�a mua Ng�n thi�m (386,321) v�i gi� 200 l��ng. Tr� l�i g�p Ti�t Ti�u mu�i, d�ng Ng�n thi�m (Tr�m c�i) ��i H��ng nang. <enter>- �ng T�nh H� Th�n ph�: T�m g�p T� V�n Ph�p S� t�i T�n T��ng t� (403,319) � Th�nh �� ph�, l�n l��t tr� l�i ba c�u h�i, s� nh�n ���c �ng T�nh H� Th�n ph�. (��p �n l�n l��t l�: B, D, C). N�u nh� ��p sai, b�n c� th� nh�p v�o l�i tho�i �� th�c hi�n l�i. <enter>- B�ch T� Gi�i Ch�: ��n Th�nh �� t�m T�n Vi�n Ngo�i (400,309), tr� l�i hai c�u h�i s� nh�n ���c B�ch T� Gi�i Ch� (��p �n l� : B, C). N�u nh� ��p sai, b�n c� th� nh�p v�o l�i tho�i �� th�c hi�n l�i.<enter><color=red>B��c 6: <color>Tr� l�i Th�i B�nh Ti�u C�c � Th�nh �� ph�, giao Linh X� H��ng nang, �ng T�nh H� Th�n ph� v� B�ch T� Gi�i Ch� �� ��i Ph� Dung C�m K�.<enter><color=red>B��c 7: <color>Tr� v� Th�n Ti�n ��ng, g�p Cao nh�n, nh�p v�o l�i tho�i, d�ng Ph� Dung C�m K� ��i B�ch �i�u Tri�u Phong.<enter><color=red>B��c 8: <color>Tr� v� Nga My ph�i, ��n T� Thi�n �i�n g�p T� T� Hinh, giao B�ch �i�u Tri�u Phong, ho�n th�nh nhi�m v�."},
			[2] = {"G�p T� T� Hinh","��n T� Thi�n �i�n g�p T� T� Hinh, ti�p nh�n nhi�m v� t�m B�ch �i�u Tri�u Ph�ng kh�c ph�.",0,1,18,1603,3190},
			[3] = {"T�m  Cao nh�n","��n Th�nh �� -> Thanh Th�nh S�n -> Th�n Ti�n ��ng. V�o trong ��ng t�m Cao nh�n, �ng ta s� y�u c�u B�n ��nh b�i con Linh th�. Sau khi ��nh b�i n�, b�n l�i nh�p v�o l�i tho�i v�i Cao nh�n. �ng ta y�u c�u b�n mang b�c tranh Ph� Dung C�m K� ��n ��i kh�c ph�.",1,0,23,234,204},
			[4] = {"G�p �ng ch� Ti�u C�c","��n Th�i B�nh Ti�u C�c � Th�nh �� ph�, g�p �ng ch� Ti�u C�c, nh�p v�o l�i tho�i, �ng ta y�u c�u b�n t�m Linh X� H��ng nang, �ng T�nh H� Th�n ph� v� B�ch T� Gi�i Ch�, s� giao Ph� Dung C�m K�.",0,1,11,3012,5060},
			[5] = {"T�m Ti�t Ti�u mu�i","��n Th�nh �� t�m Ti�t Ti�u mu�i (383,315), nh�p v�o l�i tho�i, Ti�t Ti�u mu�i y�u c�u b�n mang Ng�n thi�m (Tr�m c�i) ��n ��i",0,1,11,3068,5048},
			[6] = {"��n ti�m t�p h�a mua Ng�n thi�m","��n ti�m t�p h�a mua Ng�n thi�m (386,321) v�i gi� 200 l��ng.",0,1,11,3096,5136},
			[7] = {"Tr� l�i g�p Ti�t Ti�u mu�i","Tr� l�i g�p Ti�t Ti�u mu�i, d�ng Ng�n thi�m (Tr�m c�i) ��i H��ng nang.",0,1,11,3068,5048},
			[8] = {"T�m g�p T� V�n Ph�p S�","T�m g�p T� V�n Ph�p S� t�i T�n T��ng t� (403,319) � Th�nh �� ph�, l�n l��t tr� l�i ba c�u h�i, s� nh�n ���c �ng T�nh H� Th�n ph�",0,1,11,3223,5108},
			[9] = {"T�m T�n Vi�n Ngo�i","��n Th�nh �� t�m T�n Vi�n Ngo�i (400,309), tr� l�i hai c�u h�i s� nh�n ���c B�ch T� Gi�i Ch� (��p �n l� : B, C)",0,1,11,3202,4951},
			[10] = {"Tr� l�i Th�i B�nh Ti�u C�c","Tr� l�i Th�i B�nh Ti�u C�c � Th�nh �� ph�, giao Linh X� H��ng nang, �ng T�nh H� Th�n ph� v� B�ch T� Gi�i Ch� �� ��i Ph� Dung C�m K�.",0,1,11,3012,5060},
			[11] = {"Tr� l�i g�p Cao nh�n","Tr� v� Th�n Ti�n ��ng, g�p Cao nh�n, nh�p v�o l�i tho�i, d�ng Ph� Dung C�m K� ��i B�ch �i�u Tri�u Phong.",1,0,23,234,204},
			[12] = {"Tr� v� g�p T� T� Hinh","Tr� v� Nga My ph�i, ��n T� Thi�n �i�n g�p T� T� Hinh, giao B�ch �i�u Tri�u Phong, ho�n th�nh nhi�m v�.",0,1,18,1603,3190},
		},
		[5] = {
			[1] = {"S� ���c phong l�: T�n Hoa Thi�n N�. H�c ���c v� c�ng: Ph�t T�m T� H�u, N�i ti�p nh�n nhi�m v�: Ch�nh �i�n, Ch��ng m�n Thanh Hi�u S� Th�i."},
			[2] = {"G�p Thanh Hi�u S� Th�i","",0,1,17,1595,3207},
			[3] = {"G�p T� V�n Ph�p S�","",0,1,11,3222,5107},
			[4] = {"��nh b�i Ph�n T�ng ��u M�c c�u T� H�i ��i S�","",1,1,12,1841,3181},
			[5] = {"G�p Thanh Hi�u S� Th�i","",0,1,17,1595,3207},
		},
		[6] = {
			[1] = {"S� ���c phong l�: Th�nh N�. N�i ti�p nh�n nhi�m v�: Ch�nh �i�n, Ch��ng m�n Thanh Hi�u S� Th�i."},
			[2] = {"G�p Thanh Hi�u S� Th�i","",0,1,17,1595,3207},
			[3] = {"��nh Thanh H�a l�y Y�n Ng�c Ch� Ho�n","",1,1,9,2111,5992},
			[4] = {"G�p Thanh Hi�u S� Th�i","",0,1,17,1595,3207},
		},
		[7] = {
			[1] = {"Y�u c�u: ng��i ch�i �� xu�t s�, ��ng c�p tr�n 60, ch�a gia nh�p bang ph�i n�o, c� th� ��n g�p tr��ng m�n c�a ph�i giao 5 v�n l��ng �� tr�ng ph�n s� m�n. T� �� v� sau c� th� t�y � ra v�o s� m�n. Ph�n Thu�ng: B�t Di�t B�t Tuy�t, Ph�t Quang Ph� Chi�u, Phan �m Ph�n X��ng, Ph�t Ph�p V� Bi�n. ���c phong l�m:Kim ��nh Th�nh N�."},
		},
		[8] = {
			[1] = {"Y�u c�u: T� c�p 90 tr� l�n, danh v�ng tr�n 240 �i�m, l� Nga My k� danh �� t�, tr��c m�t ch�a gia nh�p m�n ph�i n�o. Ph�n th��ng: Tam Nga T� Nguy�t, Phong S��ng To�i �nh, Ph� �� Ch�ng Sinh. Danh v�ng ���c 30 �i�m."},
			[2] = {"G�p Ti�u B� B�","",0,1,11,3109,5011},
			[3] = {"��nh D� Xoa, l�y V� T� Thi�n Th�","",1,1,23,1669,3164},
			[4] = {"G�p Ti�u B� B�","",0,1,11,3109,5011},
			[5] = {"G�p Thanh Hi�u S� Th�i","",0,1,17,1595,3207},
			[6] = {"G�p Ti�u B� B�","",0,1,11,3109,5011},
			[7] = {"G�p Thanh Hi�u S� Th�i","",0,1,17,1595,3207},
		},
		[9] = {
			[1] = {"K� n�ng c�p 120 c� th� mua trong k� tr�n c�c"},
		},
		[10] = {
			[1] = {"Nhi�m v� k� danh �� t� ph�i Nga My. Ph�i xu�t s� m�i c� th� l�m nhi�m v� n�y."},
			[2] = {"G�p Di�p B�ng H�n. ��p �n 3-3-1","",1,1,13,1916,5320},
			[3] = {"G�p T�n K� Phong. ��p �n 3-1-2","",1,1,13,1817,5157},
			[4] = {"G�p H� Linh Phi�u. ��p �n 1-2-3","",1,1,13,1836,5126},
			[5] = {"G�p T� V�n La","",1,1,13,1775,5145},
			[6] = {"��nh b�i V� Y Ni l�y B�ch Ng�c Nh� �","",1,1,13,1733,5116},
			[7] = {"G�p Di�u Tr�n","",1,1,13,1845,5010},
		},
	},
	[5] = { --Thuy yen OK
		[1] = {
			[1] = {"S� ���c phong l�: Tam Ph�m Hoa S�. H�c ���c v� c�ng: Th�y Y�n �ao Ph�p, Th�y Y�n Song �ao. N�i ti�p nh�n nhi�m v�: Ch� ph�ng, Ch��ng m�n Do�n H�m Y�n.\n<color=red>B��c 1<color>: ��n Ch� ph�ng <color=yellow>(35/75)<color> g�p Ch��ng m�n Do�n H�m Y�n , ti�p nh�n nhi�m v� truy t�m c�y Tr�m b� th�t l�c.\n<color=red>B��c 2<color>: ��n khu r�ng ph�a ��ng c�a Thu� Y�n, b�n h�y ��nh nh�ng con H�ng H� (C�o ��) <color=yellow>(83/105; 90/99; 82/ 99; 87/ 97)<color> l�y ���c Th�y V� Tr�m.\n<color=red>B��c 3<color>: Mang Th�y V� Tr�m v� giao cho Ch��ng m�n Do�n H�m Y�n, ho�n th�nh nhi�m v�."},
			[2] = {"G�p Do�n H�m Y�n","",0,1,161,1591,3203},
			[3] = {"��nh b�i C�o ��","",1,1,154,667,1691},
			[4] = {"Tr� v� giao Th�y V� Tr�m cho Do�n H�m Y�n","",0,1,161,1591,3203},
		},
		[2] = {
			[1] = {"S� ���c phong l�: Nh� Ph�m Hoa S�. H�c ���c v� c�ng: B�ng T�m Tr�i �nh. N�i ti�p nh�n nhi�m v�: Thi�n �i�n, Y�n Hi�u Tr�i..\n<color=red>B��c 1<color>: ��n Th� Ng�c ��nh <color=yellow>(43/90)<color> g�p Y�n Hi�u Tr�i , ti�p nh�n nhi�m v� �i h�i hoa. (M�n �� La Hoa l� m�t lo�i hoa k�ch ��c, v� v�y n�i trong th�i gian quy ��nh ph�i h�i �� �em v� �� ���c ch��ng m�n gi�i ��c, n�u kh�ng b�n s� ch�t).\n<color=red>B��c 2<color>: �i v� h��ng T�y B�c (b�n tr�i g�n M� Cung c�m ��a), h�y h�i 10 ��a ��i M�n �� La hoa (56/59; 55/63; 72/42; 69/53; 61/48; 73/47; 80/43; 72/39; 66/39; 63/40). Khi b�n b�t ��u h�i ��a hoa ��u ti�n th� th�i gian tr�ng ��c c�a b�n b�t ��u ���c t�nh. Tr�ng ��c chia l�m b�n giai �o�n, m�i giai �o�n l� 30 ph�t.\n<color=red>B��c 3<color>: M�i giai �o�n b� tr�ng ��c, h� th�ng ��u ph�t ra th�ng b�o cho ng��i ch�i bi�t, sau khi giai �o�n th� t� k�t th�c, ng��i ch�i s� b� ch�t. L�c n�y b�n s� ph�i th�c hi�n nhi�m v� l�i t� ��u. Tr��c khi giai �o�n th� t� k�t th�c, b�n ph�i �i t�m Y�n Hi�u Tr�i �� ���c gi�i ��c v� t�nh s� l��ng hoa. N�i trong th�i gian h�n ��nh b�n h�i �� 10 ��a hoa �em v� giao th� m�i ho�n th�nh ���c nhi�m v�.\nMang �� 10 ��a hoa v� cho Y�n Hi�u Tr�i , ho�n th�nh nhi�m v�."},
			[2] = {"G�p Y�n Hi�u Tr�i","",0,1,160,1593,3195},
			[3] = {"��n n�i h�i ��i M�n �� La Hoa 1","",1,0,154,56,59},
			[4] = {"��n n�i h�i ��i M�n �� La Hoa 2","",1,1,154,446,1020},
			[5] = {"��n n�i h�i ��i M�n �� La Hoa 3","",1,1,154,579,680},
			[6] = {"��n n�i h�i ��i M�n �� La Hoa 4","",1,0,154,69,53},
			[7] = {"��n n�i h�i ��i M�n �� La Hoa 5","",1,0,154,60,49},
			[8] = {"��n n�i h�i ��i M�n �� La Hoa 6","",1,1,154,587,769},
			[9] = {"��n n�i h�i ��i M�n �� La Hoa 7","",1,0,154,80,43},
			[10] = {"��n n�i h�i ��i M�n �� La Hoa 8","",1,0,154,72,39},
			[11] = {"��n n�i h�i ��i M�n �� La Hoa 9","",1,0,154,66,39},
			[12] = {"��n n�i h�i ��i M�n �� La Hoa 10","",1,1,154,509,648},
			[13] = {"Tr� v� giao cho Y�n Hi�u Tr�i","",0,1,160,1593,3195},
		},
		[3] = {
			[1] = {"S� ���c phong l�: <color=yellow>Nh�t Ph�m Hoa S�<color>. H�c ���c v� c�ng: <color=yellow>V� �� L� Hoa, Ph� V�n T�n Tuy�t<color>. N�i ti�p nh�n nhi�m v�: <color=yellow>B�ch Hoa �i�n, H� M� Tuy�t<color>.<enter><color=red>B��c 1<color>: ��n B�ch Hoa �i�n <color=yellow>(53/85)<color> g�p <color=yellow>H� M� Tuy�t<color>, ti�p nh�n nhi�m v�.<enter><color=red>B��c 2<color>: ��n <color=yellow>��i L�<color> t�m <color=yellow>�o�n L�o H�n (189/204)<color>, v�a g�p th� th�y <color=yellow>�o�n L�o H�n<color> �ang kh�c l�c �au bu�n, bi�t ���c con g�i l�o b� <color=yellow>Th� Ph�<color> b�t �i.<enter><color=red>B��c 3<color>: �i v� ph�a t�y th�nh, ��n �i�m Th��ng S�n, �i v�o Th� ph� s�n ��ng <color=yellow>(232/172)<color>, gi�t t�n Th� ph� <color=yellow>(232/193)<color> b�n c� th� c�u ���c con g�i c�a �o�n L�o H�n nh�ng x�c su�t r�t th�p.<enter><color=red>B��c 4<color>: Tr� l�i g�p <color=yellow>�o�n L�o H�n<color>, nh�p v�o l�i tho�i, bi�t ���c c�n ph�i �i t�m ba lo�i d��c li�u.<enter><color=red>B��c 5<color>: ��n B�n T�u t�m m�t Thuy�n gia <color=yellow>(204/183)<color>, b� 1000 l��ng mua ���c v�i con Ng�n Tuy�t Ng�.<enter><color=red>B��c 6<color>: V�o Th�nh ��i L� ��n su�i H� �i�p, s� th�y hai con b��m B�ch Th��ng Ph�ng �i�p <color=yellow>(184/196)<color>, b�n ch� c�n nh�p chu�t v�o m�t con, s� th�y xu�t hi�n d�ng ch� <color=yellow>Nh�n ���c B�ch Th��ng Ph�ng �i�p<color>, b�n ch� c�n l�y m�t con l� ��.<enter><color=red>B��c 7<color>: ��n V�n L�ng ��nh, t�m m�t con Th�n l�n �� <color=yellow>(182/197)<color>, nh�p chu�t v�o n�, s� th�y xu�t hi�n d�ng ch�: <color=yellow>Nh�n ���c th�n l�n ��<color> (S� h�i kh� t�m v� n� bi m�i ��nh che khu�t), b�n ch� c�n l�y m�t con l� ��.<enter><color=red>B��c 8<color>: Sau khi t�m ���c ba lo�i d��c li�u tr�n, tr� v� Th�y Y�n m�n, giao cho H� M� Tuy�t, ho�n th�nh nhi�m v�."},
			[2] = {"��n B�ch Hoa �i�n g�p H� M� Tuy�t","",0,1	,155,	1586,	3205},
			[3] = {"��n ��i L� t�m �o�n L�o Ho�n","",	0,	1,	162,	1512,	3277},
			[4] = {"V�o Th� Ph� S�n ��ng gi�t Th� Ph� c�u con g�i �o�n L�o Ho�n","",	1,	1,	170,	1858,	3094},
			[5] = {"Tr� l�i g�p �o�n L�o Ho�n","",	0,	1	,162,	1512,	3277},
			[6] = {"��n b�n t�u mua Ng�n Tuy�t Ng� c�a Thuy�n Gia","",	1,	1,	162,	1640,	2935},
			[7] = {"��n su�i H� �i�p th�nh ��i L� b�t B�ch Th��ng Ph�ng �i�p","",	0,	1,	162,	1472,	3145},
			[8] = {"��n V�n L�ng ��nh b�t Th�n L�n ��","",	0,	1,	162,	1459,	3146},
			[9] = {"Quay tr� v� g�p H� M� Tuy�t","",	0,	1,	155,	1586,	3205},
		},
		[4] = {
			[1] = {"S� ���c phong l�: Hoa Th�n S� Gi�. H�c ���c v� c�ng: <color=yellow>H� Th� H�n B�ng<color>. N�i ti�p nh�n nhi�m v�: Thi�n �i�n, Y�n Hi�u Tr�i.<enter><color=red>B��c 1<color>: ��n Th� Ng�c ��nh (43/90) g�p Y�n Hi�u Tr�i, ti�p nh�n nhi�m v� �i c�u nh�ng c� g�i b� �c b� b�t �i.<enter><color=red>B��c 2<color>: ��n ��i L�, t�m nh� t�n �c b� (206/200), trong nh� s� kh�ng c� ai, trong s�n b�n s� ph�t hi�n ra m�t l�i �i v�o m�t ��o. �i v�o trong M�t ��o ��nh b�i nh�ng t�n �c b� �� th� (223/199; 201/204; 197/195), ph�t hi�n ra �c b� �� mang nh�ng c� g�i kia l�n �i�m Th��ng S�n.<enter><color=red>B��c 3<color>: L�p t�c l�n �i�m Th��ng S�n, ti�n v�o �i�m Th��ng ��ng (210/195), b�n trong l� m�t m� cung c� r�t nhi�u <color=yellow>�� Th�<color>\n\t\t\t-T�i t�ng m�t b�n ��nh b�i hai t�n �c B� B�o Ti�u (199/191; 186/189), l�y ���c chi�c ch�a kh�a th� nh�t (X�c su�t 50%).\n\t\t\t- T�i t�ng th� hai ��nh hai t�n �c B� H� Vi�n (193/190; 186/195), l�y ���c chi�c ch�a kh�a th� hai (X�c su�t 40%).\n\t\t\t- L�n t�ng th� ba ��nh m�t t�n �c B� �� Th� (197/185; 196/186), l�y ���c chi�c ch�a kh�a th� ba (X�c su�t 30%).<enter><color=red>B��c 4<color>: Sau khi l�y �� ba chi�c ch�a kh�a, nh�p chu�t v�o c� quan (197/186), h� th�ng s� xu�t hi�n d�ng ch� <color=yellow>�c B� �� qu� s� b�n n�n b� tr�n r�i ! H�y d�ng ba chi�c ch�a kh�a m� '�m Th�t' c�u c�c c� g�i ra<color>.<enter><color=red>B��c 5<color>: Tr� v� Th�y Y�n m�n g�p Y�n Hi�u Tr�i ph�c m�nh, ho�n th�nh nhi�m v�."},
			[2] = {"��n Th� Ng�c ��nh g�p Y�n Hi�u Tr�i","",	0,	1,	160,	1593,	3195},
			[3] = {"��n �c B� gia ��a ��o ti�u di�t �c B� �� Th�","",	1,	1,	163,	1789,	3195},
			[4] = {"Ti�u di�t �c B� B�o Ti�u","",	1,	0,	171,	199,	191},
			[5] = {"Ti�u di�t �c B� H� Vi�n","",	1,	1,	172,	1550,	3040},
			[6] = {"Ti�u di�t �c B� �� Th� t�i t�n 3 �i�m Th��ng ��ng","",	1,	1,	173,	1582,	2966},
			[7] = {"D�ng 3 ch�a kh�a m� c� quan","",	1,	1,	173,	1582,	2966},
			[8] = {"Tr� v� g�p Y�n Hi�u Tr�i","",	0,	1,	160,	1593,	3195},
		},
		[5] = {
			[1] = {"S� ���c phong l�: Hoa Tinh. H�c ���c v� c�ng: <color=yellow>Tuy�t �nh<color>. N�i ti�p nh�n nhi�m v�: Ch��ng m�n Do�n H�m Y�n.<enter><color=red>B��c 1<color>: ��n Ch� ph�ng (35/75) g�p Ch��ng m�n Do�n H�m Y�n , ti�p nh�n nhi�m v� gi�p H� Vi�n ph��ng tr��ng �o�t l�i V� ��ng Quan �m.<enter><color=red>B��c 2<color>: ��n ��i L� tr��c m�t S�ng Th�nh t� l� Thi�n T�m th�p. G�p H� Vi�n ph��ng tr��ng (219/196), nh�p v�o l�i tho�i.<enter><color=red>B��c 3<color>: �i V�o Thi�n T�m Th�p, M�i t�ng ch� c�n ��nh m�t t�n tr�m b�o t�c. T�ng 1 (214/193), T�ng 2 (195/202), T�ng 3 (198/200), sau khi ��nh b�i h�t ba t�n s� l�y l�i ���c V� ��ng Quan �m .<enter><color=red>B��c 4<color>: Mang V� ��ng Quan �m V� cho H� Vi�n ph��ng tr��ng.<enter><color=red>B��c 5<color>: Tr� l�i Th�y Y�n m�n g�p Ch��ng m�n Do�n H�m Y�n ph�c m�nh, ho�n th�nh nhi�m v�."},
			[2] = {"��n ch� ph�ng g�p Do�n H�m Y�n","",	0,	1,	161,	1591,	3203},
			[3] = {"��n ��i L� g�p H� Vi�n Ph��ng Tr��ng","",	0,	1,	162,	1750,	3136},
			[4] = {"Ti�u di�t Tr�m B�o T�c t�i t�ng 1 Thi�n T�m Th�p","",	1,	1,	164,	1710,	3088},
			[5] = {"Ti�u di�t Tr�m B�o T�c t�i t�ng 2 Thi�n T�m Th�p","",	1,	1,	165	,1558,	3232},
			[6] = {"Ti�u di�t Tr�m B�o T�c t�i t�ng 3 Thi�n T�m Th�p","",	1,	1,	166,	1582,	3200},
			[7] = {"Mang V� ��ng Quan �m cho H� Vi�n Ph��ng Tr��ng","",	0,	1,	162,	1750,	3136},
			[8] = {"Tr� v� g�p Do�n H�m Y�n","",	0,	1,	161,	1591,	3203},
		},
		[6] = {
			[1] = {"S� ���c phong l�: Hoa Ti�n. N�i ti�p nh�n nhi�m v�: Xu�n Hoa B� B�.<enter><color=red>B��c 1<color>: ��n H�u Hoa Vi�n (40/74) g�p Xu�n Hoa B� B�, ti�p nh�n nhi�m v� �i�u tra s� th�t trong c�m ��a Th�y Y�n m�n.<enter><color=red>B��c 2<color>: ��n ��m Ng�c n� s� th�y l�i v�o C�m ��a s�n ��ng (78/78).<enter><color=red>B��c 3<color>: V�o C�m ��a s�n ��ng, ��nh hai t�n Th�o kh�u (187/193; 209/175), l�y ���c m�t chi�c kh�n t� (X�c su�t r�t th�p).<enter><color=red>B��c 4<color>: �i v�o trong g�p m�t �ng gi� (228/191) nh�n 1 b�c th�.<enter><color=red>B��c 5<color>: Quay l�i giao th� cho Xu�n Hoa B� B�.<enter><color=red>B��c 6<color>: Sau �� ��n Ch� ph�ng (35/75) g�p Ch��ng m�n Do�n H�m Y�n, ho�n th�nh nhi�m v�."},
			[2] = {"��n h�u hoa vi�n g�p Xu�n Hoa B� B�","",	0,	0,	154,	40,	74},
			[3] = {"Ti�u di�t th�o kh�u t�i c�m ��a s�n ��ng l�y kh�n t�","",	1,	1,	158,	1504,	3098},
			[4] = {"Nh�n b�c th� t� m�t �ng gi�","",	1,	1,	158,	1832,	3066},
			[5] = {"Quay l�i g�p Xu�n Hoa B� B�","",	0,	0,	154,	40,	74},
			[6] = {"G�p tr��ng m�n Do�n H�m Y�n","",	0,	1,	161,	1591,	3203},
		},
		[7] = {
			[1] = {"S� ���c phong l�: Hoa Th�n. H�c ���c v� c�ng: <color=yellow>M�c D� L�u Tinh, B�ch H�i Tri�u Sinh, B�ng C�t Tuy�t T�m<color>. N�i ti�p nh�n nhi�m v�: Ch��ng m�n Do�n H�m Y�n.<enter><color=yellow>Y�u c�u<color>: ng��i ch�i �� xu�t s�, ��ng c�p tr�n 60, ch�a gia nh�p bang ph�i n�o, c� th� ��n g�p tr��ng m�n c�a ph�i giao 5 v�n l��ng �� tr�ng ph�n s� m�n. T� �� v� sau c� th� t�y � ra v�o s� m�n."},
		},
		[8] = {
			[1] = {"K� n�ng c�p 90 c� th� mua t�i c�a h�ng tinh l�c hay k� tr�n c�c"},
		},
		[9] = {
			[1] = {"K� n�ng 120 c� th� mua t�i k� tr�n c�c"},
		},
		[10] = {
			[1] = {"Ch�c n�ng ch�a ph�t tri�n"},
		},
	},
	[6] = { --Cai bang OK
		[1] = {
			[1] = {"S� ���c phong l�: Ch�p ��i �� t�. H�c ���c v� c�ng: C�i Bang B�ng ph�p, C�i Bang Ch��ng ph�p. N�i ti�p nh�n nhi�m v�: Bang ch� H� Nh�n Ng�.<enter><color=red>Ch� �<color>��i tho�i v�i T�y B�n Ti�n ��ng c�nh �ng ch� T�u L�u ��p �n CBD"},
			[2] = {"��n g�p Bang ch� H� Nh�n Ng�","��n g�p Bang ch� H� Nh�n Ng� (191/231), ti�p nh�n nhi�m v� �i mua r��u.",0,1,115,1527,3706},
			[3] = {"��n T�u l�u (mua 4 lo�i r��u, c�n ng�n l��ng)","��n T�u l�u � D��ng Ch�u, g�p �ng ch� t�u �i�m (216/189), nh�p v�o l�i tho�i. Mua ���c b�n lo�i r��u , duy ch� c� Hu� Tuy�n t�u th� v�a b�n cho T�y B�n Ti�n m�t r�i!",0,1,80,1731,3033},
			[4] = {"G�p T�y b�n ti�n (ngay b�n c�nh - ��p �n B-C-D)","",0,1,80,1731,3033},
			[5] = {"Mang 5 lo�i r��u v� cho H� Nh�n Ng�","Mang n�m lo�i r��u v� giao cho Bang ch� H� Nh�n Ng� , ho�n th�nh nhi�m v�.",0,1,115,1527,3706},
		},
		[2] = {
			[1] = {"S� ���c phong l�: Ch�p B�t �� t�. H�c ���c v� c�ng: H�a Hi�m Vi Di. N�i ti�p nh�n nhi�m v�: �� t� C�i Bang."},
			[2] = {"G�p �� t� c�i bang","",0,1,115,1477,3575},
			[3] = {"��nh b�i M�nh Vi�n T�i","",1,1,115,1529,3040},
			[4] = {"G�p M�nh Th��ng L��ng","",0,1,115,1555,3792},
		},
		[3] = {
			[1] = {"S� ���c phong l�: Ch�p B�ng �� t�. H�c ���c v� c�ng: Gi�ng Long Ch��ng, �� C�u Tr�n. N�i ti�p nh�n nhi�m v�: Ch��ng B�ng Tr��ng l�o La Khu�ng Sinh."},
			[2] = {"G�p La Khu�ng Sinh","",0,1,115,1520,3616},
			[3] = {"T�m Tri�u �� Ch�","",0,0,80,213,177},
			[4] = {"��nh b�i Kim Binh (c�u �� t� c�i bang)","",1,1,92,1832,2487},
			[5] = {"T�m Tri�u �� Ch� (nh�n V�n Th�)","",0,0,80,213,177},
			[6] = {"Giao cho La Khu�ng Sinh","",0,1,115,1520,3616},
		},
		[4] = {
			[1] = {"S� ���c phong l�: Long ��u �� t�. H�c ���c v� c�ng: Ho�t B�t L�u Th�, N�i ti�p nh�n nhi�m v�: Truy�n C�ng Tr��ng l�o Ng�y Li�u �ng.<enter><color=red>Ch� �<color>��nh Kim Qu�c Th�ch Kh�ch cho t�i khi nh�n Th�ch s�t m�t h�m"},
			[2] = {"��n g�p Ng�y Li�u �ng","",0,1,115,1530,3867},
			[3] = {"��nh b�i Kim Qu�c Th�ch Kh�ch 1 (l�y Th�ch s�t m�t h�m - t� l� th�p)","",1,0,180,226,183},
			[4] = {"��nh b�i Kim Qu�c Th�ch Kh�ch 2 (l�y Th�ch s�t m�t h�m - t� l� th�p)","",1,0,180,178,195},
			[5] = {"V� g�p Ng�y Li�u �ng","",0,1,115,1529,3866},
			[6] = {"G�p Tr��ng Tu�n","",0,1,80,1608,3154},
			[7] = {"Tr� l�i g�p Ng�y Li�u �ng","",0,1,115,1529,3866},
		},
		[5] = {
			[1] = {"S� ���c phong l�: ��i Long ��u. H�c ���c v� c�ng: B�ng �� �c C�u, H�ng Long H�u H�i. N�i ti�p nh�n nhi�m v�: Bang ch� H� Nh�n Ng�.<enter><color=red>Ch� �<color> Sau khi v�o ���c Ho�ng Cung, t� ch�y ��n 202 200 �� v�o m�t th�t, ��n 210 187 �� ��a ��a �� cho T�o C�ng C�ng.<enter><enter>Sau khi ph�t hi�n T�o C�ng C�ng l� n�i gi�n, quay l�i m�t ��o, nh�p n�i chuy�n v�i T�o C�ng C�ng r�i m�i quay ra ��nh ��i Tr��ng V� Binh, th�y c� th�ng b�o <color=red>(��nh ng� t�n v� s� ho�ng cung �ang b�o v� t�o c�ng c�ng)<color> th� n�i chuy�n v�i T�o C�ng C�ng."},
			[2] = {"��n g�p Bang ch� H� Nh�n Ng�","",0,1,115,1527,3706},
			[3] = {"G�p v� binh ho�ng cung L�m An (b� ng�n l�i kh�ng cho v�o)","",0,1,176,1634,3203},
			[4] = {"T�m Tr��ng Tu�n","",0,1,176,1482,3416},
			[5] = {"Tr� l�i g�p v� binh ho�ng cung L�m An","",0,1,176,1634,3203},
			[6] = {"Sau khi ��a ��a �� cho T�o C�ng C�ng, tr� v� g�p Tr��ng Tu�n","",0,1,176,1482,3416},
			[7] = {"��t l�t Ti�u Th�i Gi�m �� v�o Ho�ng Cung","",0,1,176,1634,3203},
			[8] = {"��nh b�i T�o C�ng C�ng r�i quay v� t�m Tr��ng Tu�n","",0,1,176,1482,3416},
			[9] = {"��n g�p Bang ch� H� Nh�n Ng�","",0,1,115,1527,3706},
		},
		[6] = {
			[1] = {"S� ���c phong l�: Ti�u Dao Th�n C�i. N�i ti�p nh�n nhi�m v�: Ch��ng B�t Tr��ng l�o T� Tam Tr��ng.<enter><color=red>Ch� �<color> : � nhi�m v� n�y, � c�c r��ng c�n ch�a kh�a �� m�, b�n c� th� ��nh b�i qu�i v�t t��ng �ng �� nh�n ch�a kh�a nhi�u l�n. V� d�: sau khi �� m� r��ng b�n c� th� quay l�i ��nh H� Quy�n l�n n�a �� l�y ch�a kh�a ra m� r��ng, cho ��n khi b�n nh�n ���c 2 c�i t�i th� th�i.<enter>T�ng 1 : ��nh H� Quy�n m� r��ng cho ��n khi l�y ���c 2 t�i v�i<enter>T�ng 2 c� 2 r��ng nh�ng ch� l�y ���c 1 t�i v�i ho�c kh�ng l�y ���c t�i n�o. T�ng 5 Nhi�u nh�t l�y ���c 2 t�i v�i. "},
			[2] = {"G�p T� Tam Tr��ng","",0,1,115,1512,3790},
			[3] = {"T1 ��nh b�i H� Quy�n (l�y ch�a kh�a - max 2 c�i)","",1,1,116,1711,3016},
			[4] = {"T1 m� r��ng H� Quy�n. Max 2 t�i","",1,1,116,1775,3087},
			[5] = {"T2 kh�ng c�n ch�a m� r��ng 1. T2 2 r��ng max 1 t�i","",1,1,117,1615,3131},
			[6] = {"T2 kh�ng c�n ch�a m� r��ng 2. T2 2 r��ng max 1 t�i","",1,1,117,1688,3022},
			[7] = {"T4 kh�ng c�n ch�a m� r��ng 1. R��ng 1&2 max 2 t�i","",1,1,119,1518,3122},
			[8] = {"T4 kh�ng c�n ch�a m� r��ng 2. R��ng 1&2 max 2 t�i","",1,1,119,1526,3192},
			[9] = {"T4 ��nh b�i V�t H�c H�nh (l�y ch�a kh�a)","",1,1,119,1511,3301},
			[10] = {"T4 m� r��ng (l�y t�i r�i quay l�i ��nh H�c H�nh l�y ch�a kh�a 2). Max 2 t�i","",1,1,119,1504,3327},
			[11]= {"T5 ��nh b�i X�ch di�m (l�y ch�a kh�a)","",1,1,120,1757,3041},
			[12]= {"T5 m� r��ng 1. Max 2 t�i","",1,1,120,1738,3024},
			[13]= {"T5 m� r��ng 2. Max 2 t�i","",1,1,120,1696,3051},
			[14] = {"�� 9 t�i v�i v� g�p T� Tam Tr��ng","",0,1,115,1512,3790},
		},
		[7] = {
			[1] = {"Y�u c�u: ng��i ch�i �� xu�t s�, ��ng c�p tr�n 60, ch�a gia nh�p bang ph�i n�o, c� th� ��n g�p tr��ng m�n c�a ph�i giao 5 v�n l��ng �� tr�ng ph�n s� m�n. T� �� v� sau c� th� t�y � ra v�o s� m�n. Ti�u Di�u C�ng, T�y �i�p Cu�ng V�. ���c phong l�m:C�u ��i Tr��ng L�o."},
		},
		[8] = {
			[1] = {"Y�u c�u: T� c�p 90 tr� l�n, danh v�ng tr�n 240 �i�m, l� C�i Bang k� danh �� t�, tr��c m�t ch�a gia nh�p m�n ph�i n�o (Ch� ��). H�c ���c Phi Long T�i Thi�n, Thi�n H� V� C�u. Danh v�ng ���c 30 �i�m. (T�t c� c�c m�n ph�i kh�c ��u c� th� l�m nhi�m v� n�y �� nh�n ph�n th��ng �i�m danh v�ng, nh�ng kh�ng h�c ���c chi�u th�c).<enter><color=red>Ch� �<color> Sau khi ��nh b�i ��m cao th� c�u ���c Gi�i V� T� r�i ph�i n�i chuy�n v�i n� th� m�i quay v� g�p La Khu�ng Sinh"},
			[2] = {"G�p Gi�i V� T�",""},
			[3] = {"Mua Hu� Tuy�n T�u",""},
			[4] = {"Mang r��u cho Gi�i V� T�",""},
			[5] = {"G�p La Khu�ng Sinh",""},
			[6] = {"Quay tr� l�i g�p Gi�i V� T�",""},
			[7] = {"C�u ���c Gi�i V� T�, quay v� g�p La Khu�ng Sinh",""},
		},
		[9] = {
			[1] = {"K� n�ng c�p 120 c� th� mua trong K� Tr�n C�c"},
		},
		[10] = {
			[1] = {"Nhi�m v� k� danh �� t�"},
			[2] = {"G�p T� Tam Tr��ng","",0,1,115,1512,3790},
			[3] = {"G�p Li�u ��i Gia, n�i v� chuy�n Con Ch�u","",0,1,80,1666,3220},
			[4] = {"Nhi�m Thi�n Nhai, n�i v� chuy�n C�ng Danh","",0,1,80,1769,3124},
			[5] = {"Nh� �, n�i v� t��ng m�o","",0,1,80,1689,3085},
			[6] = {"T�n Vi�n Ngo�i, n�i v� T�i Ph�c","",0,1,80,1621,3051},
			[7] = {"G�p T� Tam Tr��ng","",0,1,115,1512,3790},
		},
	},
	[7] = { --Thien nhan
		[1] = {
			[1] = {"S� ���c phong l�: V� �nh S�t Th�. H�c ���c v� c�ng: Thi�n Nh�n �ao ph�p, Thi�n Nh�n M�u ph�p, H�a Ph�n Li�n Hoa. N�i ti�p nh�n nhi�m v�: H�a ���ng ���ng ch� Ng�t Ng�o."},
			[2] = {"G�p Ng�t Ng�o","",0,1,49,1642,3156},
			[3] = {"T� t� 1 (l�y L�nh b�i 1)","",1,1,50,1500,3259},
			[4] = {"T� t� 2 (l�y L�nh b�i 2)","",1,1,50,1495,3183},
			[5] = {"T� t� 3 (l�y L�nh b�i 3)","",1,1,50,1569,3187},
			[6] = {"T� t� 4 (l�y L�nh b�i 4)","",1,1,50,1569,3257},
			[7] = {"T� t� 5 (l�y L�nh b�i 5)","",1,1,50,1526,3144},
			[8] = {"T� t� 6 (l�y L�nh b�i 6)","",1,1,50,1601,3214},
			[9] = {"T� t� 7 (l�y L�nh b�i 7)","",1,1,50,1533,3219},
			[10] = {"G�p Ng�t Ng�o","",0,1,49,1642,3156},
		},
		[2] = {
			[1] = {"S� ���c phong l�: T� S�. H�c ���c v� c�ng: �o �nh Phi H�. N�i ti�p nh�n nhi�m v�: Nh�t Nguy�t ��n Ch� � H�p T�t."},
			[2] = {"G�p � H�p T�t (��p �n l� H��ng xu�ng ��t)","",1,1,45,1604,3181},
			[3] = {"g�p b� trai (��p �n Anh Hai)","",1,1,45,1709,3251},
			[4] = {"T�m con ch� nh�","",1,1,45,1685,3063},
			[5] = {"T�m con la x�m","",1,1,45,1568,3123},
			[6] = {"g�p b� trai (��i Nh�t nguy�t song lu�n)","",1,1,45,1709,3251},
			[7] = {"Mang v� cho � H�p T�t","",1,1,45,1604,3181},
		},
		[3] = {
			[1] = {"S� ���c phong l�: U Minh T� S�. H�c ���c v� c�ng: Phi H�ng V� T�ch, Li�t H�a T�nh Thi�n, Li�t Th�i S�n �i�n H�i. N�i ti�p nh�n nhi�m v�: Phong ���ng ���ng ch�: Ho�n Nhan Tuy�t Y."},
			[2] = {"G�p Ho�n Nhan Tuy�t Y","",0,1,49,1708,3226},
			[3] = {"T�m N�ng phu (mua V�n M�ng T�)","",1,1,7,2373,2530},
			[4] = {"Tr�m b�o t�c 1 (l�y C�p huy�t h�ng)","",1,1,8,1465,3255},
			[5] = {"Tr�m b�o t�c 2 ( l�y B�ng tinh lam)","",1,1,8,1676,3358},
			[6] = {"Tr�m b�o t�c 3 (l�y T� m�u l�c)","",1,1,8,1610,3207},
			[7] = {"Mang v� cho Ho�n Nhan Tuy�t Y","",0,1,49,1708,3226},
		},
		[4] = {
			[1] = {"S� ���c phong l�: Ch��ng K� S�. H�c ���c v� c�ng: Bi T� Thanh Phong. N�i ti�p nh�n nhi�m v�: H�u H� ph�p Gia Lu�t T� Li."},
			[2] = {"G�p Gia Lu�t T� Li","",0,1,49,1657,3032},
			[3] = {"��nh Li�u K� (l�y Thi�n Nh�n m�t h�m)","",1,1,6,1570,3241},
			[4] = {"Giao l�i cho Gia Lu�t T� Li","",0,1,49,1657,3032},
		},
		[5] = {
			[1] = {"S� ���c phong l�: H� Gi�o S�. H�c ���c v� c�ng: L� Ma �o�t H�n. N�i ti�p nh�n nhi�m v�: T� H� ph�p �oan M�c Du�."},
			[2] = {"G�p �oan M�c Du�","",0,1,49,1800,3184},
			[3] = {"��nh �ao binh ��i tr��ng (l�y ch�a kh�a)","",1,1,38,1729,3033},
			[4] = {"M� r��ng t�ng 1 (�� m� c� quan l�n t�ng 2)","",1,1,38,1665,3246},
			[5] = {"Nh�n v�o c� quan (�� l�n t�ng 2)","",1,1,38,1705,3131},
			[6] = {"��nh �ao binh th�ng l�nh (l�y ch�a kh�a)","",1,1,39,1734,3128},
			[7] = {"M� r��ng t�ng 2 (�� m� c� quan l�n t�ng 3)","",1,1,39,1639,3201},
			[8] = {"Nh�n v�o c� quan (�� l�n t�ng 3)","",1,1,39,1688,3028},
			[9] = {"��nh T�ng binh (l�y ch�a kh�a)","",1,1,40,1626,3149},
			[10] = {"M� r��ng t�ng 3 (c�u Ph�ng H�p Nh�)","",1,1,40,1688,3019},
			[11] = {"Tr� v� g�p �oan M�c Du�","",0,1,49,1800,3184},
		},
		[6] = {
			[1] = {" "},
			[2] = {"G�p Ho�n Nhan H�ng Li�t","",0,1,49,1721,3129},
			[3] = {"G�p Kh�c Thi�t T��ng","",0,1,37,1746,3052},
			[4] = {"Mang ng�n tr�m cho Tr��ng qu� ph�","",0,1,37,1707,3198},
			[5] = {"V� g�p Kh�c Thi�t T��ng (l�y Y�m Nh�t Ki�m)","",0,1,37,1746,3052},
			[6] = {"G�p T�n T� T�i (��p �n b-c-a-b-a) l�y �o�n Th�y Ki�m","",0,1,37,1834,2953},
			[7] = {"G�p con b�c (mua Chuy�n Ph�ch Ki�m v�i gi� 500 l��ng)","",0,1,37,1608,3118},
			[8] = {"G�p ��ng Mai","",0,1,37,1837,3053},
			[9] = {"G�p Ti�u H�i","",0,1,37,1762,3072},
			[10] = {"Quay l�i ��ng Mai b�o tin (l�y Kh� T� Ki�m)","",0,1,37,1837,3053},
			[11] = {"��n g�p �n m�y (cho ti�n 3 l�n s� l�y ���c Di�t H�n Ki�m)","",0,1,37,1685,2998},
			[12] = {"Mang 5 thanh ki�m v� cho Ho�n Nhan H�ng Li�t (sau �� t� ch�y t�i c�a th�nh ��ng ngay sau)","",0,1,49,1721,3129},
			[13] = {"Nh�n tinh","",1,1,51,1603,3188},
			[13] = {"��c x� tinh","",1,1,51,1878,3206},
			[13] = {"R�t tinh","",1,1,51,1678,3112},
			[13] = {"Nh�n tinh","",1,1,51,1839,3166},
			[13] = {"B� c�p ch�a (l�y ch�a kh�a th�nh ��ng)","",1,1,52,1796,3106},
			[13] = {"M� r��ng (l�y quy�n s�ch da d�)","",1,1,52,1865,3159},
			[13] = {"G�p Ho�n Nhan H�ng Li�t","",0,1,49,1721,3129},
		},
		[7] = {
			[1] = {"Y�u c�u: ng��i ch�i �� xu�t s�, ��ng c�p tr�n 60, ch�a gia nh�p bang ph�i n�o, c� th� ��n g�p tr��ng m�n c�a ph�i giao 5 v�n l��ng �� tr�ng ph�n s� m�n. T� �� v� sau c� th� t�y � ra v�o s� m�n. Ph�n th��ng: Th�u Thi�n Ho�n Nh�t, Ma Di�m Th�t S�t, Thi�n Ma Gi�i Th�. ���c phong l�m:Th�nh Gi�o Tr��ng L�o."},
		},
		[8] = {
			[1] = {"C� b�n trong k� tr�n c�c"},
		},
		[9] = {
			[1] = {"C� b�n trong K� tr�n c�c"},
		},
		[10] = {
			[1] = {"C� b�n trong K� tr�n c�c"},
		},
	},
	[8] = { --Vo dang OK
		[1] = {
			[1] = {"S� ���c phong l�: Nh�n T�n ��o Nh�n. H�c ���c v� c�ng: V� �ang Ki�m Ph�p, V� �ang Quy�n Ph�p. N�i ti�p nh�n nhi�m v�: T� Ti�u ��i �i�n, ��o Nh�t Ch�n Nh�n."},
			[2] = {"G�p ��o Nh�t Ch�n Nh�n","",0,1,84,1598,3183},
			[3] = {"G�p Di�p Ti�p M� (Ch� c�n nh�p v�o n�i chuy�n)","",0,1,81,1703,3041},
			[4] = {"Tr� l�i ��o Nh�t Ch�n Nh�n (C,B,B)","",0,1,84,1598,3183},
		},
		[2] = {
			[1] = {"S� ���c phong l�: Thanh Tu ��o Nh�n. H�c ���c v� c�ng: Th�t Tinh Tr�n. N�i ti�p nh�n nhi�m v�: Ph� M�u �i�n, ��o Th�ch M�n."},
			[2] = {"G�p ��o Th�ch M�n","",0,1,86,1605,3187},
			[3] = {"��nh S�i �� 1 (L�y Thi�n T�m B�o r�ch)","��n khi nh�n ���c Thi�n T�m ��o B�o r�ch",1,1,83,1510,3050},
			[4] = {"��nh S�i �� 2 (L�y Thi�n T�m B�o r�ch)","��n khi nh�n ���c Thi�n T�m ��o B�o r�ch",1,1,83,1642,2899},
			--[5] = {"��nh S�i �� 3","��n khi nh�n ���c Thi�n T�m ��o B�o r�ch",1,1,83,1750,3182},
			--[6] = {"��nh S�i �� 4","��n khi nh�n ���c Thi�n T�m ��o B�o r�ch",1,1,83,1680,3043},
			[5] = {"Quay l�i g�p ��o Th�ch M�n","",0,1,86,1605,3187},
			[6] = {"��n T�p H�a T��ng D��ng v� �o","",0,1,78,1627,3259},
			[7] = {"��nh D� H�n 1 (C�u ��a b�, l�y thi�n t�m)","��n khi c�u ���c ��a b� l�y ���c Thi�n T�m",1,1,83,1582,2860},
			[8] = {"��nh D� H�n 2 (C�u ��a b�, l�y thi�n t�m)","��n khi c�u ���c ��a b� l�y ���c Thi�n T�m",1,1,83,1676,2932},
			[9] = {"Tr� l�i T�p H�a �� v� �o","",0,1,78,1627,3259},
			[10] = {"Giao �o cho ��n Th�ch M�n","",0,1,86,1605,3187},
		},
		[3] = {
			[1] = {"S� ���c phong l�: Tu�n S�n ��i Nh�n. H�c ���c v� c�ng: Ki�m Phi Kinh Thi�n, B�t C�p Nhi Ph�c. N�i ti�p nh�n nhi�m v�: Th�p Ph��ng �i�n, T� ��i Nh�c."},
			[2] = {"G�p T� ��i Nh�c","",0,1,85,1598,3187},
			[3] = {"��i H�a H� 1 (l�y 5 c� h�a mi)","",1,1,90,1796,3286},
			[4] = {"��i H�a H� 2 (l�y 5 c� h�a mi)","",1,1,90,1617,3321},
			[5] = {"��i Tuy�t Lang 1 (l�y 5 c� h�a mi)","",1,1,90,1917,3086},
			[6] = {"��i Tuy�t Lang 2 (l�y 5 c� h�a mi)","",1,1,90,1742,3176},
			[7] = {"��i Thanh Lang 1 (l�y 5 c� h�a mi)","",1,1,90,1877,3186},
			[8] = {"��i Thanh Lang 2 (l�y 5 c� h�a mi)","",1,1,90,2009,3265},
			[9] = {"��i Thanh Lang 3 (l�y 5 c� h�a mi)","",1,1,90,1804,2979},
			[10] = {"�� 5 c� h�a mi v� giao cho T� ��i Nh�c","",0,1,85,1598,3187},
		},
		[4] = {
			[1] = {"S� ���c phong l�: Nh�p Quan ��o Nh�n. H�c ���c v� c�ng: Th� V�n Tung. N�i ti�p nh�n nhi�m v�: Chu V�n Tuy�n."},
			[2] = {"G�p Chu V�n Tuy�n","",0,1,81,1754,3081},
			[3] = {"G�p Nhu�n N��ng","",1,1,91,1618,2962},
			[4] = {"B�ch Ng�c H� 1","",1,1,91,1592,2931},
			[5] = {"B�ch Ng�c H� 2","",1,1,91,1537,3016},
			[6] = {"B�ch Ng�c H� 3","",1,1,91,1680,2965},
			[7] = {"B�ch Ng�c H� 4","",1,1,91,1648,3088},
			[8] = {"B�ch Ng�c H� 5","",1,1,91,1661,2891},
			[9] = {"V� g�p Nhu�n N��ng","",1,1,91,1618,2962},
			[10] = {"Nhu�n N��ng Gia H� (l�y th� h�i �m)","",1,1,91,1616,2819},
			[11] = {"Nhu�n N��ng Gia B�o (l�y th� h�i �m)","",1,1,91,1697,2740},
			[12] = {"Giao th� cho ��o Nh�t Ch�n Nh�n","",0,1,84,1598,3183},
		},
		[5] = {
			[1] = {"S� ���c phong l�: Ch��ng Kinh ��o Nh�n. H�c ���c v� c�ng: T�a V�ng V� Ng�. N�i ti�p nh�n nhi�m v�: Long H� �i�n, ��n T� Nam."},
			[2] = {"G�p ��n T� Nam","",0,1,87,1602,3186},
			[3] = {"��u m�c th� ph� Thi�t T�o (l�y 1 v�n l��ng)","",1,1,42,1513,3168},
			[4] = {"G�p ��n T� Nam","",0,1,87,1602,3186},
			[5] = {"T�m Tr�nh Gia T�u T�","",0,1,78,1648,3277},
			[6] = {"Tr� v� g�p ��n T� Nam","",0,1,87,1602,3186},
		},
		[6] = {
			[1] = {"S� ���c phong l�: Huy�n V� Th�n Th�. N�i ti�p nh�n nhi�m v�: T� Ti�u ��i �i�n, ��o Nh�t Ch�n Nh�n."},
			[2] = {"G�p ��o Nh�t Ch�n Nh�n","",0,1,84,1598,3183},
			[3] = {"T�m c�i r��ng th� nh�t","",1,1,81,1897,2912},
			[4] = {"G�p �ng ch� d��c �i�m","",0,1,78,1610,3245},
			[5] = {"L�y ���ng Quy","",1,1,90,2002,3454},
			[6] = {"L�y H�p Hoan","",1,1,90,1812,3652},
			[7] = {"L�y Huy�n S�m","",1,1,90,1745,3607},
			[8] = {"L�y Ph�ng K�","",1,1,90,1915,3554},
			[9] = {"L�y Chu Sa","",1,1,90,1777,3667},
			[10] = {"Giao 5 d��c li�u cho �ng ch� d��c �i�m","",0,1,78,1610,3245},
			[11] = {"V� m� r��ng th� nh�t (l�y Ng�c Thanh ch�n kinh)","",1,1,81,1897,2912},
			[12] = {"T�m c�i r��ng th� 2","",1,1,81,1897,2876},
			[13] = {"T�m th� r�n","",0,1,78,1554,3216},
			[14] = {"L�y T� thi�t kho�ng","",1,1,78,1422,2987},
			[15] = {"L�y L��ng ng�n kho�ng","",1,1,78,1400,3072},
			[16] = {"L�y X�ch ��ng kho�ng","",1,1,78,1466,2988},
			[17] = {"T�m th� r�n","",0,1,78,1554,3216},
			[18] = {"V� m� r��ng th� 2 (l�y Th��ng Thanh ch�n kinh)","",1,1,81,1897,2876},
			[19] = {"T�m chi�c r��ng th� 3","",1,1,81,1876,2833},
			[20] = {"T�m Nha m�n v� binh","",0,1,78,1590,3209},
			[21] = {"��nh b�i T��ng D��ng th� t��ng","",1,1,79,1750,3229},
			[22] = {"V� m� r��ng th� 3 (l�y Th�i Thanh ch�n kinh)","",1,1,81,1876,2833},
			[23] = {"V� g�p ��o Nh�t Ch�n Nh�n","",0,1,84,1598,3183},
		},
		[7] = {
			[1] = {"Y�u c�u: ng��i ch�i �� xu�t s�, ��ng c�p tr�n 60, ch�a gia nh�p bang ph�i n�o, c� th� ��n g�p tr��ng m�n c�a ph�i giao 5 v�n l��ng �� tr�ng ph�n s� m�n. T� �� v� sau c� th� t�y � ra v�o s� m�n. Ph�n th��ng: Th�i C�c Th�n C�ng, V� Ng� V� Ki�m, Tam Ho�n Thao Nguy�t. ���c phong l�m: Huy�n V� Ch�n Qu�n."},
		},
		[8] = {
			[1] = {"S�ch k� n�ng c�p 90 c� b�n trong K� Tr�n C�c"},
		},
		[9] = {
			[1] = {"S�ch k� n�ng c�p 120 c� b�n trong K� Tr�n C�c"},
		},
		[10] = {
			[1] = {"Ch�a ho�n th�nh"},
		},
	},
	[9] = { --Con lon OK
		[1] = {
			[1] = {" "},
			[2] = {"G�p Ti�u H�n","",0,1,131,1472,3140},
			[3] = {"��nh M�o R�ng l�y 5 lo�i th�o d��c","",1,1,140,2437,3742},
			[4] = {"Giao cho Ti�u H�n","",0,1,131,1472,3140},
		},
		[2] = {
			[1] = {" "},
			[2] = {"G�p Th�n T�c L�o Nh�n nh�n nhi�m v�","",0,1,131,1526,3225},
			[3] = {"��nh Th� Ph� l�y X��ng ��u l�c ��","",1,1,141,1548,3193},
			[4] = {"Giao cho Th�n T�c L�o Nh�n","",0,1,131,1526,3225},
		},
		[3] = {
			[1] = {" "},
			[2] = {"G�p Chu Khuy�t ��i S�","",0,1,131,1587,3202},
			[3] = {"��nh C�o �� l�y 3 D� Minh Ch�u","",1,1,145,1629,3222},
			[4] = {"Giao cho Chu Khuy�t ��i S�","",0,1,131,1587,3202},
		},
		[4] = {
			[1] = {" "},
			[2] = {"G�p Thanh Li�n T� nh�n nhi�m v�","",0,1,139,1606,3199},
			[3] = {"��nh b�i H�ng Nguy�t l�y th�ng tin v� thanh ki�m","",1,1,135,1675,2853},
			[4] = {"��nh Lam V�n l�y ch�a kh�a","",1,1,135,1764,3194},
			[5] = {"D�ng ch�a kh�a m� r��ng","",1,1,135,1529,2804},
			[6] = {"Giao Huy�t H�n Th�n Ki�m cho Thanh Li�n T�","",0,1,139,1606,3199},
		},
		[5] = {
			[1] = {" "},
			[2] = {"G�p Ng�c Ho�nh T� nh�n nhi�m v�","",0,1,137,1596,3193},
			[3] = {"��nh ��i tuy�t qu�i 1","",1,1,132,1472,3209},
			[4] = {"��nh ��i tuy�t qu�i 2","",1,1,132,1645,3218},
			[5] = {"��nh ��i tuy�t qu�i 3","",1,1,132,1620,3168},
			[6] = {"��nh ��i tuy�t qu�i 4","",1,1,132,1528,3208},
			[7] = {"��nh ��i tuy�t qu�i 5","",1,1,132,1476,3262},
			[8] = {"��nh qu�i nh�n l�y N�m T�c","",1,1,132,1574,3215},
			[9] = {"Giao cho Ng�c Ho�nh T� ho�n th�nh nhi�m v�","",0,1,137,1596,3193},
		},
		[6] = {
			[1] = {" "},
			[2] = {"G�p Truy�n C� T� nh�n nhi�m v�","",0,1,138,1596,3196},
			[3] = {"T�m g�p V� Danh L�o ��o","",1,1,122,1712,3142},
			[4] = {"��nh Truy H�n l�y Ph�c ty t�a","",1,1,125,1689,3245},
			[5] = {"Ti�n v�o t�ng 2, ch�n T�y Nh�n �� l�n t�ng 2","",1,1,125,1591,3205},
			[6] = {"��nh Th�a Phong, l�y Vi�m �� t�a","",1,1,126,1614,3015},
			[7] = {"Ti�n v�o t�ng 3, ch�n Tinh V� �� l�n t�ng 3","",1,1,126,1674,3060},
			[8] = {"��nh b�i L�u Tinh, l�y Thi�u t�o t�a","",1,1,127,1664,3087},
			[9] = {"Ti�n v�o t�ng 4, ch�n Xu�n �� l�n t�ng 4","",1,1,127,1697,3232},
			[10] = {"��nh b�i T�t �i�n, l�y Chuy�n t�c t�a","",1,1,128,1619,3142},
			[11] = {"Ti�n ��n t�ng 5, ch�n ��t tr�i ph�n ��i �� l�n t�ng 5","",1,1,128,1521,3057},
			[12] = {"��nh b�i N� Th�ch Kh�ch, l�y Ho�ng �� t�a","",1,1,129,1745,3347},
			[13] = {"Ti�n ��n t�ng 6, ch�n Hai b�c t��ng s�c v�t b�ng g� �� l�n t�ng 6","",1,1,129,1645,3250},
			[14] = {"M� r��ng l�y Ng� s�c th�ch","",1,1,130,1587,3195},
			[15] = {"Giao cho Truy�n C� T� ho�n th�nh nhi�m v�","",0,1,138,1596,3196},
		},
		[7] = {
			[1] = {"Nhi�m v� tr�ng ph�n s� m�n: Chu�n b� �� 5 v�n g�p ch��ng m�n l� c� th� ho�n th�nh"},
		},
		[8] = {
			[1] = {"K� n�ng c�p 9 c� b�n t�i c�a h�ng tinh l�c hay K� tr�n c�c"},
		},
		[9] = {
			[1] = {"K� n�ng 120 c� b�n t�i K� tr�n c�c"},
		},
		[10] = {
			[1] = {"Ch�c n�ng ch�a ho�n th�nh"},
		},
	},
}

function help_quest()
	local nFaction = GetLastFactionNumber()
	if nFaction < 0 then
		Msg2Player("Xin h�y gia nh�p m�n ph�i r�i m�i s� d�ng ch�c n�ng n�y!")
		return
	elseif nFaction == 0 then
		TenMP = "Thi�u L�m"
	elseif nFaction == 1 then
		TenMP = "Thi�n V��ng"
	elseif nFaction == 2 then
		TenMP = "���ng M�n"
	elseif nFaction == 3 then
		TenMP = "Ng� ��c"
	elseif nFaction == 4 then
		TenMP = "Nga My"
	elseif nFaction == 5 then
		TenMP = "Th�y Y�n"
	elseif nFaction == 6 then
		TenMP = "C�i Bang"
	elseif nFaction == 7 then
		TenMP = "Thi�n Nh�n"
	elseif nFaction == 8 then
		TenMP = "V� �ang"
	elseif nFaction == 9 then
		TenMP = "C�n L�n"
	elseif nFaction == 10 then
		TenMP = "Hoa S�n"
	end
	if TenMP == "Hoa S�n" then
		return Msg2Player("<color=yellow>Hi�n t�i ch�a ho�n th�nh nhi�m v� Hoa S�n<color>")
	end
	local tab_Content = {
		"Nhi�m v� c�p 10 "..TenMP.."/#help_quest_step1("..nFaction..",1,2,"..getn(tb_HelpQuest[nFaction][1])..")",
		"Nhi�m v� c�p 20 "..TenMP.."/#help_quest_step1("..nFaction..",2,2,"..getn(tb_HelpQuest[nFaction][2])..")",
		"Nhi�m v� c�p 30 "..TenMP.."/#help_quest_step1("..nFaction..",3,2,"..getn(tb_HelpQuest[nFaction][3])..")",
		"Nhi�m v� c�p 40 "..TenMP.."/#help_quest_step1("..nFaction..",4,2,"..getn(tb_HelpQuest[nFaction][4])..")",
		"Nhi�m v� c�p 50 "..TenMP.."/#help_quest_step1("..nFaction..",5,2,"..getn(tb_HelpQuest[nFaction][5])..")",
		"Nhi�m v� Xu�t S� "..TenMP.."/#help_quest_step1("..nFaction..",6,2,"..getn(tb_HelpQuest[nFaction][6])..")",
		"Nhi�m v� Tr�ng Ph�n S� M�n "..TenMP.."/#help_quest_step1("..nFaction..",7,2,"..getn(tb_HelpQuest[nFaction][7])..")",
		"Nhi�m v� c�p 90 "..TenMP.."/#help_quest_step1("..nFaction..",8,2,"..getn(tb_HelpQuest[nFaction][8])..")",
		"K� n�ng 120 "..TenMP.."/#help_quest_step1("..nFaction..",9,2,"..getn(tb_HelpQuest[nFaction][9])..")",
		"K� danh �� t� "..TenMP.."/#help_quest_step1("..nFaction..",10,2,"..getn(tb_HelpQuest[nFaction][10])..")",
		"Quay l�i/character",
		"K�t th�c ��i tho�i/Quit"
		}
		Say("H� tr� t�n th� l�m nhi�m v� m�n ph�i. Xin h�y c� g�ng ho�n th�nh nhi�m v� m�n ph�i r�i m�i gia nh�p bang h�i tung ho�nh giang h�. ", getn(tab_Content), tab_Content);
end
function help_quest_step1(nFaction,nIDQ,nX,nY)
	local strDesc = tb_HelpQuest[nFaction][nIDQ][1][1]
	if (not nX) then
		nX1 = 2;
		nY1 = 10;
	else
		nX1 = nX;
		nY1 = nY;
	end
	if (nY1 - nX1 > 9) then
		nY1 = nX1 + 9;
	end
	if nIDQ == 1 then
		TenNV = "Nhi�m v� c�p 10"
	elseif nIDQ == 2 then
		TenNV = "Nhi�m v� c�p 20"
	elseif nIDQ == 3 then
		TenNV = "Nhi�m v� c�p 30"
	elseif nIDQ == 4 then
		TenNV = "Nhi�m v� c�p 40"
	elseif nIDQ == 5 then
		TenNV = "Nhi�m v� c�p 50"
	elseif nIDQ == 6 then
		TenNV = "Nhi�m v� Xu�t S�"
	elseif nIDQ == 7 then
		TenNV = "Nhi�m v� Tr�ng Ph�n S� M�n"
	elseif nIDQ == 8 then
		TenNV = "Nhi�m v� c�p 90"
	elseif nIDQ == 9 then
		TenNV = "K� n�ng 120"
	elseif nIDQ == 10 then
		TenNV = "K� danh �� t�"
	end
	local tbOpt = {}
	local TotalSelect = getn(tb_HelpQuest[nFaction][nIDQ])
	for i=nX1,nY1 do
		local FightState = tb_HelpQuest[nFaction][nIDQ][i][3]
		local TypeMove = tb_HelpQuest[nFaction][nIDQ][i][4] --Ban ��u m�nh l�m ph�n to� �o� l� ki�u nh� game v� d� 271 - 291 nh�ng to� �� n�y n� ph� kh�ng ch�nh x�c n�n v� sau �� h�t sang to� �� ki�u 4 s�. TypeMove lu�n l� 1
		local MapId = tb_HelpQuest[nFaction][nIDQ][i][5]
		local nX =tb_HelpQuest[nFaction][nIDQ][i][6]
		local nY = tb_HelpQuest[nFaction][nIDQ][i][7]
		tinsert(tbOpt, {tb_HelpQuest[nFaction][nIDQ][i][1],help_quest_step2,{FightState,TypeMove,MapId,nX,nY,TenMP,TenNV,tb_HelpQuest[nFaction][nIDQ][i][2],tb_HelpQuest[nFaction][nIDQ][i][1]}})
	end
	if (nX1 ~= 2) then
		tinsert(tbOpt,{"Trang tr��c",help_quest_step1,{nFaction,nIDQ,2,nX1-1}});
	end
	if (nY1 < TotalSelect) then
		tinsert(tbOpt,{"Trang sau",help_quest_step1,{nFaction,nIDQ,nY1+1,TotalSelect}});
	end
	tinsert(tbOpt, {"Quay l�i",help_quest})
	tinsert(tbOpt, {"Tho�t."})
	CreateNewSayEx(strDesc, tbOpt);
end
function help_quest_step2(FightState,TypeMove,MapId,nX,nY,MonPhai,NhiemVu,BuocThucHien,NoiDungNhiemVu)
	if TypeMove == 0 then
		NewWorld(MapId,nX*8,nY*16) --
	else
		NewWorld(MapId,nX,nY) --
	end
	SetFightState(FightState)
	Msg2Player("�ang th�c hi�n <color=yellow>"..NhiemVu.."<color> m�n ph�i <color=yellow>"..MonPhai.."<color>. N�i dung nhi�m v�: <color=green>"..NoiDungNhiemVu.."<color>")
	AddNote("N�i dung nhi�m v�: <color=green>"..BuocThucHien.."<color>")
end
--------------------------------------------------------------
--			 		H� Tr� L�m nv ho�ng kim					--
--------------------------------------------------------------
tb_HelpGoldQuest = {
--=========================================================Ho�ng Kim Ch�nh Tuy�n START
	[1] = { --Chinh tuyen
		[1] = { --Chinh phai OK
			[1] = { --Cap 20
				[1] = {"��n ��i L� g�p L� M�c S�u",0,1,162,1470,3170},
				[2] = {"Ra b�n t�u ��nh b�i M�c S�u",1,1,162,1636,2984},
				[3] = {"V� th�nh g�p M�c S�u",0,1,162,1470,3170},
			},
			[2] = { --Cap 30
				[1] = {"T�m C�ng T� Ti�u",0,1,11,3223,5118},
				[2] = {"��nh b�i Gi�i L�u Phong",1,1,141,1544,3323},
				[3] = {"V� g�p M�c S�u",0,1,162,1470,3170},
			},
			[3] = { --Cap 40
				[1] = {"T�m g�p H� V� Th�",0,1,80,1705,3119},
				[2] = {"��nh b�i T� �ao Hi�p",1,1,173,1557,3049},
				[3] = {"Quay v� g�p M�c S�u",0,1,162,1470,3170},
			},
			[4] = { --Cap 50
				[1] = {"T�m g�p M�nh Ph�m",0,1,176,1626,2990},
				[2] = {"Ti�u di�t O�n ��c",1,1,24,2109,3322},
				[3] = {"Quay v� g�p M�nh Ph�m",0,1,176,1626,2990},
			},
			[5] = { --Cap 60
				[1] = {"Ti�u di�t Th�n b� nam nh�n",1,1,79,1681,3142},
				[2] = {"Quay v� g�p M�c S�u",0,1,162,1470,3170},
			},
		},
		[2] = { --Trung lap OK
			[1] = { --Cap 20 OK
				[1] = {"T�m g�p Ph� Nam B�ng",0,1,37,1699,3161},
				[2] = {"��nh Ninh T��ng Qu�n",1,1,179,2033,2755},
				[3] = {"T�m g�p Ph� Nam B�ng",0,1,37,1699,3161},
			},
			[2] = { --Cap 30 OK
				[1] = {"T�m g�p Ph� Nam B�ng",0,1,37,1699,3161},
				[2] = {"��nh L� Thi�n T��ng",1,1,136,1602,3197},
				[3] = {"T�m g�p Ph� Nam B�ng",0,1,37,1699,3161},
			},
			[3] = { --Cap 40 OK
				[1] = {"G�p L� Thu Thu�",0,1,154,343,1346},
				[2] = {"��nh T� T� L�c",1,1,5,1476,3433},
				[3] = {"G�p L� Thu Thu�",0,1,154,343,1346},
			},
			[4] = { --Cap 50 OK
				[1] = {"T�m g�p Ph� Nam B�ng",0,1,37,1699,3161},
				[2] = {"T�m ��c �i�u T�u",0,1,59,1642,3188},
				[3] = {"Ti�u di�t ��c �i�u T�u",1,1,66,1596,3307},
				[4] = {"Quay l�i g�p Ph� Nam B�ng",0,1,37,1699,3161},
			},
			[5] = { --Cap 60 -OK
				[1] = {"T�m g�p Ph� Nam B�ng",0,1,37,1699,3161},
				[2] = {"G�p ��i s� Kh�ng T�ch",0,1,103,1776,2843},
				[3] = {"��nh b�i Kh�ng T�ch",1,1,103,1744,2662},
				[4] = {"V� g�p Ph� Nam B�ng",0,1,37,1699,3161},
			},
		},
		[3] = { --Ta phai OK
			[1] = { --Cap 20 OK
				[1] = {"G�p V�n Nhi",0,1,100,1729,3173},
				[2] = {"G�p Th�i C�ng C�ng",0,1,176,1625,3203},
				[3] = {"��nh b�i Ti�u K� Nhi",1,1,90,1798,3284},
				[4] = {"G�p Th�i C�ng C�ng",0,1,176,1625,3203},
				[5] = {"G�p V�n Nhi",0,1,100,1729,3173},
			},
			[2] = { --Cap 30 OK
				[1] = {"G�p Ti�u S�",0,1,80,1597,3117},
				[2] = {"��nh b�i H� H�u Ph�c",1,1,21,2720,3956},
				[3] = {"G�p V�n Nhi",0,1,100,1729,3173},
				[4] = {"G�p Ph� L�i Th�",0,1,174,199*8,203*16},
				[5] = {"G�p M�c Th� H��ng Ch�",0,1,186,1600,3196},
				[6] = {"G�p Ph� L�i Th�",0,1,174,199*8,203*16},
			},
			[3] = { --Cap 40 OK
				[1] = {"G�p ��o Th�ch M�n",0,1,86,1606,3190},
				[2] = {"��nh Ti�u V� Th��ng",1,1,92,1948,3233},
				[3] = {"G�p ��o Th�ch M�n",0,1,86,1606,3190},
				[4] = {"G�p Ph� L�i Th�",0,1,174,199*8,203*16},
				[5] = {"G�p Nh� Ng�c",0,1,37,1681,3139},
			},
			[4] = { --Cap 50 OK
				[1] = {"G�p Tr�n Tam B�o",0,1,37,1756,2995},
				[2] = {"Ti�u di�t ��o T�c L�c Phi",1,1,195,599,3068},
				[3] = {"G�p Tr�n Tam B�o",0,1,37,1756,2995},
				[4] = {"��nh t��ng Kim �� Lan � T�ng 3 Thi�t Th�p",1,1,40,1699,3044},
				[5] = {"G�p �o�n M�c Du�",0,1,49,1801,3183},
				[6] = {"G�p �o�n M�c Thanh",0,1,121,2013,4490},
			},
			[5] = { --Cap 60 -OK
				[1] = {"G�p �o�n M�c Thanh",0,1,121,2013,4490},
				[2] = {"Ti�u anh h�ng kh�ng Kim, Li�u ��nh",1,1,94,1565,3141},
				[3] = {"G�p �o�n M�c Thanh",0,1,121,2013,4490},
			},
		},
	},
--=========================================================Ho�ng Kim Ch�nh Tuy�n END
--=========================================================Ho�ng Kim Ph� Tuy�n START
	[2] = { --Ph� tuy�n
		[1] = { --------------------------------------------Ph� tuy�n Chinh phai OK
			[1] = { --Cap 20-29 OK
				[1] = {"G�p Ng�o V�n T�ng",0,1,1,1587,3303},
				[2] = {"G�p Si T�ng",0,1,332,167*8,176*16},
				[3] = {"��nh T�ng B�o Kh�ch l�y 5 �� ph�",1,1,332,156*8,188*16},
				[4] = {"G�p Si T�ng",0,1,332,167*8,176*16},
				[5] = {"G�p Ng�o V�n T�ng",0,1,1,1587,3303},
				[6] = {"G�p Ti�n ��u",0,1,333,1246,3267},
				[7] = {"G�p S�m H�ng",0,1,1,192*8,201*16},
				[8] = {"��nh b�i Phan Nh� Long",1,1,1,220*8,190*16},
				[9] = {"G�p Ng�o V�n T�ng",0,1,1,1587,3303},
			},
			[2] = { --Cap 30-39 OK
				[1] = {"G�p Ng�o V�n T�ng",0,1,1,1587,3303},
				[2] = {"G�p H� Lan Chi",0,1,11,3085,5191},
				[3] = {"G�p Ng� L�o Th�i",0,1,20,3465,6195},
				[4] = {"G�p Ng�o V�n T�ng",0,1,1,1587,3303},
				[5] = {"��nh 50 S�i Xanh",1,1,90,1639,3511},
				[6] = {"G�p Ng�o V�n T�ng",0,1,1,1587,3303},
				[7] = {"G�p Cung A Ng�u",0,1,78,1551,3191},
				[8] = {"��nh �c Lang",1,1,90,1789,3140},
				[9] = {"G�p Cung A Ng�u",0,1,78,1551,3191},
				[10] = {"G�p Ng� L�o Th�i",0,1,20,3465,6195},
				[11] = {"G�p Ng�o V�n T�ng",0,1,1,1587,3303},
			},
			[3] = { --Cap 40-49 OK
				[1] = {"G�p Ng�o V�n T�ng",0,1,1,1587,3303},
				[2] = {"G�p C�ng B�nh T� ��nh l�i ��i l�n 1",0,1,11,3165,5194},
				[3] = {"G�p Ng�o V�n T�ng",0,1,1,1587,3303},
				[4] = {"G�p H�n H�n",0,1,80,1846,3046},
				[5] = {"G�p C�ng B�nh T� ��nh l�i ��i l�n 2",0,1,11,3165,5194},
				[6] = {"G�p H�n H�n",0,1,80,1846,3046},
				[7] = {"G�p Ng�o V�n T�ng",0,1,1,1587,3303},
				[8] = {"��nh Du S��ng T�n",1,1,11,3371,4889},
				[9] = {"G�p Ng�o V�n T�ng",0,1,1,1587,3303},
			},
			[4] = { --Cap 50-59 OK
				[1] = {"G�p H�n H�n",0,1,80,1846,3046},
				[2] = {"Ho�n th�nh t�ng kim v� g�p H�n H�n",1,1,24,2109,3322},
				[3] = {"��nh T� T�c Phong",1,1,176,1680,2575},
				[4] = {"G�p Ng�o V�n T�ng",0,1,1,1587,3303},
			},
		},
		[2] = { --------------------------------------------Ph� tuy�n Trung l�p OK
			[1] = { --Cap 20 OK
				[1] = {"G�p Li�u Nam V�n",0,1,176,1368,3050},
				[2] = {"��nh 50 nh�m T�n L�ng",1,1,7,2277,2824},
				[3] = {"G�p Giang Nh�t Ti�u",0,1,80,204*8,192*16},
				[4] = {"G�p L�c Thanh Thu",0,1,80,1694,3129},
				[5] = {"G�p b�o k� s�ng b�c",0,1,80,1744,3151},
				[6] = {"��nh L� Tr��ng Thi�n",1,1,80,1999,2882},
				[7] = {"G�p b�o k� s�ng b�c",0,1,80,1744,3151},
				[8] = {"G�p L�c Thanh Thu",0,1,80,1694,3129},
				[9] = {"��nh nh�n v�t v� l�m l�y b�o ki�m",1,1,80,1396,3397},
				[10] = {"G�p L�c Thanh Thu",0,1,80,1694,3129},
			},
			[2] = { --Cap 30 OK
				[1] = {"G�p Li�u Nam V�n",0,1,176,1368,3050},
				[2] = {"G�p ch� ti�u c�c Song �ng",0,1,1,1543,3191},
				[3] = {"G�p A Ng�u",0,1,1,1567,3253},
				[4] = {"G�p H� L�o B�n (Ch� ti�u c�c)",0,1,11,3011,5057},
				[5] = {"��nh 50 kh� x�m",1,1,92,1977,3116},
				[6] = {"G�p H� L�o B�n (Ch� ti�u c�c)",0,1,11,3011,5057},
				[7] = {"��nh B�ch Ng�c, Nh� Y�n, T�ng M�ng",1,1,131,1872,3392},
				[8] = {"G�p H� L�o B�n (Ch� ti�u c�c)",0,1,11,3011,5057},
				[9] = {"G�p Li�u Nam V�n",0,1,176,1368,3050},
			},
			[3] = { --Cap 40 OK
				[1] = {"G�p Li�u Nam V�n",0,1,176,1368,3050},
				[2] = {"G�p C�ng B�nh T� ��nh l�i ��i l�n 1",0,1,11,3165,5194},
				[3] = {"Th�ng l�i ��i v� g�p Li�u Nam V�n",0,1,176,1368,3050},
				[4] = {"G�p C�ng B�nh T� ��nh l�i ��i l�n 2",0,1,11,3165,5194},
				[5] = {"G�p Li�u Nam V�n",0,1,176,1368,3050},
				[6] = {"��nh Du S��ng T�n",1,1,11,3371,4889},
				[7] = {"G�p Li�u Nam V�n",0,1,176,1368,3050},
			},
			[4] = { --Cap 50 OK
				[1] = {"G�p Li�u Nam V�n",0,1,176,1368,3050},
				[2] = {"Ho�n th�nh t�ng kim v� g�p Li�u Nam V�n",0,1,176,1368,3050},
				[3] = {"��nh b�i Long Truy V�",1,1,162,1723,2987},
				[4] = {"G�p Li�u Nam V�n",0,1,176,1368,3050},
			},
		},
		[3] = { --------------------------------------------Ph� tuy�n t� ph�i OK
			[1] = { --Cap 20 OK
				[1] = {"G�p Th�c B�t Ho�i Xuy�n",0,1,37,1677,3040},
				[2] = {"��nh 50 H�c Di�p H�u",1,1,25,3952,5284},
				[3] = {"G�p Th�c B�t Ho�i Xuy�n",0,1,37,1677,3040},
				[4] = {"G�p Ch�u Tr��ng C�u",0,1,11,3139,5086},
				[5] = {"G�p Th�m Phong",0,1,80,1684,3078},
				[6] = {"��nh Th�m Phong",1,1,80,1788,3383},
				[7] = {"G�p Th�c B�t Ho�i Xuy�n",0,1,37,1677,3040},
			},
			[2] = { --Cap 30 OK
				[1] = {"G�p Th�c B�t Ho�i Xuy�n",0,1,37,1677,3040},
				[2] = {"��nh 50 con s�i v�ng",1,1,193,1560,3188},
				[3] = {"G�p Th�c B�t Ho�i Xuy�n",0,1,37,1677,3040},
				[4] = {"G�p L�u U�n C�",0,1,78,1611,3185},
				[5] = {"G�p Th�c B�t Ho�i Xuy�n",0,1,37,1677,3040},
				[6] = {"G�p Tu� H�n (T�u Qu�)",0,1,176,1691,3033},
				[7] = {"��nh Thi Nghi Sinh",1,1,176,1701,3388},
				[8] = {"G�p Th�c B�t Ho�i Xuy�n",0,1,37,1677,3040},
			},
			[3] = { --Cap 40 OK
				[1] = {"G�p Th�c B�t Ho�i Xuy�n",0,1,37,1677,3040},
				[2] = {"G�p L�u U�n C�",0,1,78,1611,3185},
				[3] = {"G�p C�ng B�nh T� ��nh l�i ��i l�n 1",0,1,11,3165,5194},
				[4] = {"G�p L�u U�n C�",0,1,78,1611,3185},
				[5] = {"G�p Th�c B�t Ho�i Xuy�n",0,1,37,1677,3040},
				[6] = {"G�p C�ng B�nh T� ��nh l�i ��i l�n 2",0,1,11,3165,5194},
				[7] = {"G�p Th�c B�t Ho�i Xuy�n",0,1,37,1677,3040},
				[8] = {"��nh Nguy�n Minh Vi�n",1,1,78,1788,3189},
				[9] = {"G�p Th�c B�t Ho�i Xuy�n",0,1,37,1677,3040},
			},
			[4] = { --Cap 50 OK
				[1] = {"G�p Th�c B�t Ho�i Xuy�n",0,1,37,1677,3040},
				[2] = {"Ho�n th�nh t�ng kim v� g�p Th�c B�t Ho�i Xuy�n",0,1,37,1677,3040},
				[3] = {"��nh S� Th�nh Do�n",1,1,78,1372,3500},
				[4] = {"G�p Th�c B�t Ho�i Xuy�n",0,1,37,1677,3040},
			},
		},
	},
}
--=========================================================Ho�ng Kim Ph� Tuy�n END
function helpgoldquest()
	if GetLevel() < 20 then
		Msg2Player("<color=yellow>H�y ��t ��n c�p 20 h�y s� d�ng ch�c n�ng n�y")
		return
	end
	local tb = {
	"Ch�nh tuy�n/#gquest(1)",
	"Ph� tuy�n/#gquest(2)",
	"Quay l�i./hotrolamnvhoangkim",
	"Tho�t./Quit",
	}
	Say("",getn(tb),tb)
end
function gquest(ID)
	local MissType = ID --Lo�i nv ch�nh hay ph� tuy�n. Ch�nh l� 1 ph� l� 2
	local tb = {
	"Ch�nh ph�i - B� m�t T�m Long H�i/#gquest_step1("..MissType..",1)",
	"Trung l�p - C�u chuy�n L�m Uy�n Nhai/#gquest_step1("..MissType..",2)",
	"T� ph�i - Long kh� chi ho�/#gquest_step1("..MissType..",3)",
	"Quay l�i/character",
	"K�t th�c ��i tho�i/Quit"
	}
	Say("",getn(tb),tb)
end
function gquest_step1(ID1,ID2)
	local MissType = ID1 --Lo�i NV ch�nh hay ph�
	local PheType = ID2 --Nhi�m v� ch�nh - trung - t�
	if MissType == 1 then --ch�nh tuy�n
		local tab_Content = {
		"Ch�nh tuy�n c�p 20/#gquest_step2("..MissType..","..PheType..",1)",
		"Ch�nh tuy�n c�p 30/#gquest_step2("..MissType..","..PheType..",2)",
		"Ch�nh tuy�n c�p 40/#gquest_step2("..MissType..","..PheType..",3)",
		"Ch�nh tuy�n c�p 50/#gquest_step2("..MissType..","..PheType..",4)",
		"Ch�nh tuy�n c�p 60/#gquest_step2("..MissType..","..PheType..",5)",
		"Quay l�i/character",
		"K�t th�c ��i tho�i/Quit"
		}
		Say("H� tr� l�m nhi�m v� ho�ng kim Ch�nh Tuy�n. ", getn(tab_Content), tab_Content);
	elseif MissType == 2 then --ph� tuy�n
		local tab_Content = {
		"Ph� tuy�n c�p 20 - 29/#gquest_step2("..MissType..","..PheType..",1)",
		"Ph� tuy�n c�p 30 - 39/#gquest_step2("..MissType..","..PheType..",2)",
		"Ph� tuy�n c�p 40 - 49/#gquest_step2("..MissType..","..PheType..",3)",
		"Ph� tuy�n c�p 50 - 59/#gquest_step2("..MissType..","..PheType..",4)",
		"Quay l�i/character",
		"K�t th�c ��i tho�i/Quit"
		}
		Say("H� tr� l�m nhi�m v� ho�ng kim Ch�nh Tuy�n. ", getn(tab_Content), tab_Content);
	end
end
function gquest_step2(ID1,ID2,ID3)
	local MissType = ID1 --Lo�i NV ch�nh hay ph�
	local PheType = ID2 --Nhi�m v� ch�nh - trung - t�
	local CapDo = ID3
	local strDesc = tb_HelpGoldQuest[MissType][PheType][CapDo][1][1]
	local tbOpt = {}
	local TotalSelect = getn(tb_HelpGoldQuest[MissType][PheType][CapDo]) --T�ng c�ng c� bao nhi�u l�a ch�n.
	for i=1,TotalSelect do
		local FightState = tb_HelpGoldQuest[MissType][PheType][CapDo][i][2]
		local MapId = tb_HelpGoldQuest[MissType][PheType][CapDo][i][4]
		local nX =tb_HelpGoldQuest[MissType][PheType][CapDo][i][5]
		local nY = tb_HelpGoldQuest[MissType][PheType][CapDo][i][6]
		tinsert(tbOpt, {tb_HelpGoldQuest[MissType][PheType][CapDo][i][1],gquest_step3,{FightState,MapId,nX,nY}})
	end
	tinsert(tbOpt, {"Quay l�i",gquest_step1})
	tinsert(tbOpt, {"Tho�t."})
	CreateNewSayEx(strDesc, tbOpt);
end
function gquest_step3(ID1,ID2,ID3,ID4)
	local FightState = ID1
	local MapId = ID2
	local nX = ID3
	local nY = ID4
	NewWorld(MapId,nX,nY)
	SetFightState(FightState)
end
--------------------------------------------------------------
--			 			Boss Ho�ng Kim						--
--------------------------------------------------------------
function bosshk1()
		local strFaction = GetFaction()
		local nW,nX,nY = GetWorldPos();
		local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY)};
			tinsert(tbSay, "G�i Boss Ho�ng Kim/goibosshk");
			tinsert(tbSay, "T�m Boss Ho�ng Kim/timbosshk");
			tinsert(tbSay, "K�t th�c ��i tho�i./no")
		CreateTaskSay(tbSay)
	return 1;
end
---------------G�i Boss HK------------------------
function goibosshk()
BossHK23(f_bossx,f_bossy)
end

TBBOSS  =
{ --t�n boss,id boss, t� l� r�i ��,series boss,nLevel
	[1]={	szName = "Huy�n Gi�c ��i S�",		nBossId = 740,	nRate = 322,	nSeries = 0,	nLevel = 95},
	[2]={	szName = "���ng B�t Nhi�m",			nBossId = 741,	nRate = 336,	nSeries = 1,	nLevel = 95},
	[3]={	szName = "B�ch Doanh Doanh",		nBossId = 742,	nRate = 336,	nSeries = 1,	nLevel = 95},
	[4]={	szName = "Thanh Tuy�t S� Th�i",		nBossId = 743,	nRate = 341,	nSeries = 2,	nLevel = 95},
	[5]={	szName = "Y�n Hi�u Tr�i",			nBossId = 744,	nRate = 336,	nSeries = 2,	nLevel = 95},
	[6]={	szName = "H� Nh�n Ng�",				nBossId = 745,	nRate = 321,	nSeries = 3,	nLevel = 95},
	[7]={	szName = "T� ��i Nh�c",				nBossId = 746,	nRate = 341,	nSeries = 4,	nLevel = 95},
	[8]={	szName = "Tuy�n C� T�",				nBossId = 747,	nRate = 341,	nSeries = 4,	nLevel = 95},
	[9]={	szName = "H�n Ngu D�t",				nBossId = 748,	nRate = 342,	nSeries = 3,	nLevel = 95},
	[10]={	szName = "�o�n M�c Du�",			nBossId = 565,	nRate = 227,	nSeries = 3,	nLevel = 95},
	[11]={	szName = "C� B�ch",					nBossId = 566,	nRate = 200,	nSeries = 0,	nLevel = 95},
	[12]={	szName = "���ng Phi Y�n",			nBossId = 1366,	nRate = 200,	nSeries = 1,	nLevel = 95},
	[13]={	szName = "H� Linh Phi�u",			nBossId = 568,	nRate = 200,	nSeries = 2,	nLevel = 95},
	[14]={	szName = "Lam Y Y",					nBossId = 582,	nRate = 200,	nSeries = 1,	nLevel = 95},
	[15]={	szName = "M�nh Th��ng L��ng",		nBossId = 583,	nRate = 200,	nSeries = 3,	nLevel = 95},
	[16]={	szName = "Gia Lu�t T� Ly",			nBossId = 563,	nRate = 200,	nSeries = 3,	nLevel = 95},
	[17]={	szName = "��o Thanh Ch�n Nh�n",		nBossId = 562,	nRate = 200,	nSeries = 4,	nLevel = 95},
	[18]={	szName = "V��ng T�",				nBossId = 739,	nRate = 200,	nSeries = 0,	nLevel = 95},
	[19]={	szName = "Huy�n Nan ��i S�",		nBossId = 1365,	nRate = 200,	nSeries = 0,	nLevel = 95},
	[20]={	szName = "Chung Linh T�",			nBossId = 567,	nRate = 200,	nSeries = 2,	nLevel = 95},
	[21]={	szName = "Thanh Li�n T�",			nBossId = 1368,	nRate = 200,	nSeries = 4,	nLevel = 95},

}

function BossHK23(f_bossx,f_bossy)

	if (not f_bossx) then
		f_bossx1 = 1;
		f_bossy1 = 12;
	else
		f_bossx1 = f_bossx;
		f_bossy1 = f_bossy;
	end

	if (f_bossy1 - f_bossx1 > 11) then
		f_bossy1 = f_bossx1 + 11;
	end

	local n_count = getn(TBBOSS);
	local tb = {}

	tb = {GetName().." b�n mu�n th� boss n�o?"}

	for i = f_bossx1, f_bossy1 do
		tinsert(tb,format("%s/#PickBoss(%d)",TBBOSS[i].szName,i));
	end

	if (f_bossx1 ~= 1) then
		tinsert(tb, "Trang tr��c/#BossHK( 1,"..(f_bossx1-1)..")");
	end

	if (f_bossy1 < n_count) then
		tinsert(tb, "Trang sau/#BossHK( "..(f_bossy1+1)..","..n_count..")");
	end
	tinsert(tb,"�� ta suy ngh� ��/cancel");
	CreateTaskSay(tb)

end

function PickBoss(nIndex)
	if GetFightState() == 0 then
		Talk(1,"","Kh�ng th� th� boss � nh�ng n�i phi chi�n ��u ���c.")
		return
	end
	local item = TBBOSS[nIndex];
	local nw,nx,ny = GetWorldPos();
	local index = AddNpcEx(item.nBossId,item.nLevel,item.nSeries,SubWorldID2Idx(nw),nx*32,ny*32,1,item.szName,1);
	SetNpcDeathScript(index,"\\script\\missions\\boss\\bossdeath.lua")
	SetNpcParam(index,1,item.nBossId); --l�u id boss.
	SetNpcTimer(index,120*60*18)
	local W,X,Y = GetWorldPos();
	str = format("<color=yellow>%s<color> �� xu�t hi�n t�i <color=yellow>%s(%d,%d)<color>",item.szName,SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16))
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, str)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
--------------T�m Boss HK --------------------------------
function timbosshk()
    findgoldboss(1,12)
end

tbMapGoldBoss = {
{"C� B�ch","Ph� Dung ��ng",202,"S�n B�o ��ng",76,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Huy�n Gi�c ��i S�","Nh�n Th�ch ��ng",10,"Thanh kh� ��ng",198,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"���ng Phi Y�n", "Phong L�ng ��",336,"Kho� Lang ��ng",75,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Lam Y Y","V� L�ng ��ng",199,"Phi Thi�n ��ng",204,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"H� Linh Phi�u", "Tr��ng B�ch s�n B�c",322,"V� Danh ��ng",203,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Y�n Hi�u Tr�i", "Sa M�c s�n  ��ng 1",225,"Sa M�c s�n  ��ng 3",227,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"M�nh Th��ng L��ng","Sa m�c ��a bi�u",224,"Sa M�c s�n  ��ng 2",226,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Gia Lu�t T� Ly", "L��ng Th�y ��ng",181,"D��ng Trung ��ng",205,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"��o Thanh Ch�n Nh�n","Tr��ng B�ch s�n Nam",321,"M�c Cao Qu�t",340,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Tuy�n C� T�", "T�y S�n ��o",342,"Phi Thi�n ��ng",204,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"V��ng T�","V� L�ng ��ng",199,"Ph� Dung ��ng",202,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Huy�n Nan ��i S�","Phong L�ng ��",336,"Kho� Lang ��ng",75,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"���ng B�t Nhi�m", "Tr��ng B�ch s�n Nam",321,"Kho� Lang ��ng",75,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"B�ch Doanh Doanh", "Thanh kh� ��ng",198,"Sa m�c ��a bi�u",224,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Thanh Tuy�t S� Th�i", "T�y S�n ��o",342,"D��ng Trung ��ng",205,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Chung Linh T�", "Phi Thi�n ��ng",204,"V� Danh ��ng",203,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"H� Nh�n Ng�", "Nh�n Th�ch ��ng",10,"L��ng Th�y ��ng",181,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"�oan M�c Du�", "Phong L�ng ��",336,"S�n B�o ��ng",76,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"T� ��i Nh�c", "M�c B�c Th�o Nguy�n",341,"V� L�ng ��ng",199,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Thanh Li�n T�","Tr��ng B�ch s�n B�c",322,"Sa M�c s�n  ��ng 3",227,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"Thanh Tuy�t S� Th�i","Sa M�c s�n  ��ng 1",225,"Sa M�c s�n  ��ng 3",227,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
{"H�n Ngu D�t","Phong L�ng ��",336,"Kho� Lang ��ng",75,"T��ng D��ng",78,"Ph��ng T��ng",1,"Th�nh ��",11,"D��ng Ch�u",80,"Bi�n Kinh",37,"��i L�",162,"L�m An",176},
}

function findgoldboss(f_bossx,f_bossy)
    if (not f_bossx) then
        f_bossx1 = 1;
        f_bossy1 = 22;
    else
        f_bossx1 = f_bossx;
        f_bossy1 = f_bossy;
    end

    if (f_bossy1 - f_bossx1 > 11) then
        f_bossy1 = f_bossx1 + 11;
    end

    local n_count = getn(tbMapGoldBoss);
    local tab_Content = {}
    for i = f_bossx1, f_bossy1 do
        tinsert(tab_Content, {tbMapGoldBoss[i][1], findgoldboss_Step2, {i}});
    end
    tinsert(tab_Content, {"Tho�t./OnCancel"});
    CreateNewSayEx("T�m ki�m Boss ��i Ho�ng Kim", tab_Content);
end
function findgoldboss_Step2(nId)
    local tb = {};
    for i=2,getn(tbMapGoldBoss[nId]),2 do
        local npcidxtab = GetMapNpcWithName(tbMapGoldBoss[nId][i+1], tbMapGoldBoss[nId][1]);
        if npcidxtab == nil then
                nNPCCount = 0;
        else
            nNPCCount = getn(npcidxtab);
        end;
        for j = 1, nNPCCount do
            x, y, subworld = GetNpcPos(npcidxtab[j]);
            m,n,k = floor(x/32),floor(y/32),SubWorldIdx2ID(subworld);
            tinsert(tb,{tbMapGoldBoss[nId][1].."-"..tbMapGoldBoss[nId][i].."["..m.."-"..n.."]",findgoldboss_Step3,{m.."-"..n.."-"..k}});
        end;
    end;
    strTittle = "T�m th�y cao th� v� l�m "..tbMapGoldBoss[nId][1].." t�i c�c v� tr� sau ��y:";
    tinsert(tb,{"Quay l�i.",findgoldboss});
    tinsert(tb,{"Tho�t./OnCancel"});
    CreateNewSayEx(strTittle, tb);
end
function findgoldboss_Step3(nStr)
    local szICode = lib:Split(nStr, "-");
    local Map = szICode[3]
    local xPos = tonumber(floor(szICode[1]))
    local yPos = tonumber(floor(szICode[2]))
    NewWorld(Map,xPos,yPos)
end

function OnCancel()
end
--------------------------------------------------------------
--			 		C�ng �i�m Nhanh							--
--------------------------------------------------------------
function add_prop()
	local tbOpt =
	{
		{"T�ng s�c m�nh.", add_prop_str},
		{"T�ng th�n ph�p.", add_prop_dex},
		{"T�ng sinh kh�.", add_prop_vit},
		{"T�ng n�i c�ng.", add_prop_eng},
		{"Tho�t."}
	}
	CreateNewSayEx("<npc>Xin m�i ch�n ti�m n�ng c�n t�ng!", tbOpt)
end

function add_prop_str()
	AskClientForNumber("enter_str_num", 0, GetProp(), "M�i nh�p ch� s� s�c m�nh: ");
end
function add_prop_dex()
	AskClientForNumber("enter_dex_num", 0, GetProp(), "M�i nh�p ch� s� th�n ph�p: ");
end
function add_prop_vit()
	AskClientForNumber("enter_vit_num", 0, GetProp(), "M�i nh�p ch� s� sinh kh�:");
end
function add_prop_eng()
	AskClientForNumber("enter_eng_num", 0, GetProp(), "M�i nh�p ch� s� n�i c�ng: ");
end
function enter_str_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddStrg(n_key);
end
function enter_dex_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddDex(n_key);
end
function enter_vit_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddVit(n_key);
end
function enter_eng_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddEng(n_key);
end
--------------------------------------------------------------
--							Point							--
--------------------------------------------------------------
function CacLoaiDiem()
	local tbSay  = {"<dec>Ng��i mu�n nh�n lo�i �i�m n�o?"}
		tinsert(tbSay, "T�ng �i�m kinh nghi�m/kinhnghiem")
		tinsert(tbSay, "N�ng c�p ��/dangcap200")
		tinsert(tbSay, "Th�m ti�n v�n/tien")
		tinsert(tbSay, "T�m N�ng/pointtiemnang")
		tinsert(tbSay, "K� N�ng/pointkynang")
		tinsert(tbSay, "Th�m ti�n ��ng/tiendong")
		tinsert(tbSay, "Th�m kim nguy�n b�o/knb")
		tinsert(tbSay, "�i�m C�ng Hi�n Bang h�i/conghien")
		tinsert(tbSay, "Trang 2/CacLoaiDiem2")
		tinsert(tbSay, "K�t th�c ��i tho�i./no")
	CreateTaskSay(tbSay)
end

function CacLoaiDiem2()
	local tbSay  = {"<dec>Ng��i mu�n nh�n lo�i �i�m n�o?"}
		tinsert(tbSay, "Th�m danh v�ng/danhvong")
		tinsert(tbSay, "Th�m ph�c duy�n/phucduyen")
		tinsert(tbSay, "Th�m t�i l�nh ��o/tailanhdao")
		tinsert(tbSay, "Trang 1/CacLoaiDiem")
		tinsert(tbSay, "K�t th�c ��i tho�i./no")
	CreateTaskSay(tbSay)
end
------------C�p-------------------
function dangcap200()
AskClientForNumber("level",0,200,"Nh�p C�p ��:")
end

function level(num)
local nCurLevel = GetLevel()
local nAddLevel = num - nCurLevel
ST_LevelUp(nAddLevel)
Msg2Player("B�n nh�n ���c <color=yellow>"..num.."<color> c�p ��.")
end
---EXP-----
function kinhnghiem()
AskClientForNumber("kinhnghiem1",0,9999999999999999,"Nh�p EXP")
end
function kinhnghiem1(nNum)
AddOwnExp(nNum)
Msg2Player("B�n nh�n ���c <color=yellow>"..nNum.."<color> kinh nghi�m.")
end
---Tien Van---
function tien()
AskClientForNumber("tienvan",0,10000000,"Nh�p S� L��ng:")
end
function tienvan(slkv)
local money= slkv*10000
local giatrikv=money/10000
Earn(money)
Msg2Player(format("B�n nh�n ���c <color=yellow>%s v�n<color>.",giatrikv))
end
---Tien Dong---
function tiendong()
AskClientForNumber("tiendong1",0,1000,"Nh�p S� L��ng:")
end;
function tiendong1(sltiendong)
for i = 1, sltiendong do
AddStackItem(1,4,417,1,1,0,0,0)
end
Msg2Player("B�n nh�n ���c <color=yellow>"..sltiendong.." <color>ti�n ��ng.")
end
----KNB------
function knb()
AskClientForNumber("layknb",0,100000,"Nh�p S� L��ng:")
end
function layknb(slknb)
for i=1, slknb do
AddEventItem(343)
end
Msg2Player("B�n nh�n ���c <color=yellow>"..slknb.." <color>KNB.")
end
----------------�i�m K� N�ng----------------------------------------
function pointkynang()
AskClientForNumber("pointkynang1",0,1000,"Nh�p S� L��ng:")
end;
function pointkynang1(nNum)
AddMagicPoint(nNum)		---Nh�n �i�m k� n�ng
Msg2Player("B�n nh�n ���c <color=yellow>"..nNum.."<color> �i�m K� N�ng.")
end
------------------�i�m Ti�m N�ng--------------------------------------
function pointtiemnang()
AskClientForNumber("pointtiemnang1",0,1000000,"Nh�p S� L��ng:")
end;
function pointtiemnang1(nNum)
AddProp(nNum)		---Nh�n �i�m ti�m n�ng
Msg2Player("B�n nh�n ���c <color=yellow>"..nNum.."<color> �i�m Ti�m N�ng.")
end
------------Danh V�ng----------------------------
function danhvong()
AskClientForNumber("danhvongINPUT",0,100000,"Nh�p S� L��ng:")
end
function danhvongINPUT(nNum)
AddRepute(nNum);
Msg2Player("B�n nh�n ���c "..nNum.." �i�m Danh V�ng.")
end
------------Ph�c Duy�n----------------------------
function phucduyen()
AskClientForNumber("phucduyen2",0,100000,"Nh�p S� L��ng:")
end
function phucduyen2(nNum)
FuYuan_Start();
FuYuan_Add(nNum);
Msg2Player("B�n nh�n ���c "..nNum.." �i�m Ph�c Duy�n.")
end
------------T�i L�nh ��o----------------------------
function tailanhdao()
	for i = 1, 250 do
		AddLeadExp(1000000000)
	end
	Msg2Player("B�n nh�n ���c 100 c�p t�i l�nh ��o");
end
------------�i�m C�ng Hi�n----------------------------
function conghien()
	AddContribution(1000000);
	Msg2Player("B�n nh�n ���c 1.000.000 �i�m c�ng hi�n")
end
