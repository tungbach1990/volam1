Include("\\script\\item\\techan_zijingao.lua")
Include("\\script\\item\\techan_dahuandan.lua")

----���Ӣ���� ���
function enter_heroling()
	local nCount = GetTask(TASKID_HEROLING_COUNT);
	local tbDescribe = {"<dec>Ho�t ��ng Phong H�a Anh H�ng L�nh b�t ��u t� <color=yellow>01-12-2006<color> ��n <color=yellow>24h00 01-01-2007<color>. S� d�ng Phong H�a Anh H�ng L�nh �� mua c�c v�t ph�m v� ��i L�nh b�i g�i Boss s� ti�p t�c ��n <color=yellow>08-01-2007<color>. N�i dung chi ti�t xem tr�n trang ch�. <enter>Tr��c m�t s� l��ng anh h�ng l�nh c�a ng��i l�: <color=yellow>"..nCount.." c�i<color>.<enter>Ng��i mu�n tham gia ho�t ��ng n�o?", 
	"��i phong h�a anh h�ng l�nh/change_contribution_heroling", 
	"�em Phong H�a Anh H�ng l�nh �� mua v�t ph�m/saleby_heroling", 
	"�em Phong H�a Anh H�ng L�nh ��i l�y L�nh b�i g�i Boss/change_heroling_bosscharm", 
	"�em M�t th� ��i l�y L�nh b�i vinh d�/change_letter_honour",
	"R�i kh�i/tong_cancel"};
	
	CreateTaskSay(tbDescribe);
end;

-----�Է��Ӣ�����������Ʒ Start
function saleby_heroling()
	local nCount = GetTask(TASKID_HEROLING_COUNT);
	CreateTaskSay({"<dec><color=yellow>Phong H�a Anh H�ng L�nh<color> d�ng �� mua c�c v�t ph�m ��c bi�t. V�t ph�m ��c bi�t v�n ph�i ti�u hao <color=yellow>�i�m c�ng hi�n c� nh�n<color> �� ��i. Khi mua v�t ph�m s� tr� v�o s� l��ng l�nh b�i v� ���c ghi l�i � <color=yellow>s� l��ng l�nh b�i c�a bang b� ti�u hao<color>. S� l��ng ti�u hao n�y s� quy�t ��nh bang h�i c� th� nh�n ���c bao nhi�u l�nh b�i g�i Boss trong tu�n, v� bang h�i c� quy�n tham gia ho�t ��ng M�t th� hay kh�ng."
	.."<enter>S� l��ng Phong H�a Anh H�ng L�nh c� th� s� d�ng hi�n t�i l�: <color=yellow>"..nCount.." c�i<color>."
	.."<enter>T�ng �i�m c�ng hi�n hi�n t�i c� th� s� d�ng l�: <color=yellow>"..GetContribution().." �i�m<color>."
	.."<enter>Ng��i mu�n mua v�t ph�m g�?", 
	"T� Kim C�o/saleby_heroling_enter",
	"T�i Th�n k�/saleby_heroling_enter",
	"M�c nh�n/saleby_heroling_enter",
	"V�ng s�ng �m �nh/saleby_heroling_enter",
	"V�ng s�ng H��ng Ti�u/saleby_heroling_enter",
	"V�ng s�ng Th��ng �ng/saleby_heroling_enter",
	"M�t n� ng�y trang/saleby_heroling_enter",
	"��i Ho�n ��n/saleby_heroling_enter",
	"Tr� v�/enter_heroling",
	"R�i kh�i/tong_cancel"});
end;

function check_salebyheroling(nTongID, nPrice)
	if (nTongID == 0) then
		return 0;
	end;
	local nContribution = GetContribution();
	local nHeroling = GetTask(TASKID_HEROLING_COUNT);
	if (nHeroling < 1) then
		CreateTaskSay({"<dec>�i�m c�ng hi�n kh�ng ��, h�y c� g�ng t�m �i�m c�ng hi�n tr��c ��.", "K�t th�c ��i tho�i/tong_cancel"});
	elseif (nContribution < nPrice) then
		CreateTaskSay({"<dec>Hi�n t�i kh�ng c� Phong H�a Anh H�ng L�nh, sau khi t�ch l�y �� �i�m c�ng hi�n m�i c� th� ��n nh�n Phong H�a Anh H�ng L�nh.", "K�t th�c ��i tho�i/tong_cancel"});
	else
		return 1
	end;
	return 0;
end;


-----**�󻹵�**
function sale_heroling_dahuandan(nCount, nPrice)
		local nRestH, nRestM = adddahuandan_main(10, nCount);	--1.6����Ҫ 10������
		Msg2Player("<#>B�n mua ���c 1 vi�n"..nCount.."��i Ho�n ��n, th�i gian s� d�ng ��i Ho�n ��n hi�n t�i l� "..nRestH.."gi� "..nRestM.."ph�t.")
end;
-----**�󻹵� end


-----**αװ���**
function sale_heroling_weizhuang(nCount, nPrice)
	for i = 1, nCount do
		AddItem(0,11,366,1,0,0);
	end;
		Msg2Player("B�n ��t ���c "..nCount.." 24 gi�, m�t n� ng�y trang c� th� s� d�ng 10 l�n")
end;
-----**αװ��� end


-----**��ӥ�⻷**
function sale_heroling_cangying(nCount, nPrice)
	delguanghuan()
	AddSkillState(728, 1, 1, 10886400 * nCount, 1);--7��
	Msg2Player("Nh�n ���c 1 v�ng danh hi�u Th��ng �ng, th�i gian c�n l�i l� "..(7*nCount).."Ng�y");
end;
-----**��ӥ�⻷ end


-----**�㽶�⻷**
function sale_heroling_xiangjiao(nCount, nPrice)	
	delguanghuan()
	AddSkillState(727, 1, 1, 10886400 * nCount,1);--7��
	Msg2Player("Nh�n ���c 1 v�ng danh hi�u H��ng Ti�u, th�i gian c�n l�i l� "..(7*nCount).."Ng�y");
end;
-----**�㽶�⻷ end


-----**��Ӱ�⻷**
function sale_heroling_anying(nCount, nPrice)
	delguanghuan()
	AddSkillState(730, 1, 1, 10886400 * nCount, 1);--7��
	Msg2Player("Nh�n ���c 1 v�ng danh hi�u �m �nh, th�i gian c�n l�i l� "..(7*nCount).."Ng�y");
end;
-----**��Ӱ�⻷ end

function delguanghuan()
	for i = 726, 731 do
		AddSkillState(i, 1, 1, 0);
	end;
end;

-----**����ľ��**
function sale_heroling_xiulianmuren(nCount, nPrice)
	for i = 1, nCount do
		local nItemIndex = AddItem(6,1,1085,1,1,0)
		SetSpecItemParam(nItemIndex, 1, nTongID)
		SetSpecItemParam(nItemIndex, 2, 10)
		SyncItem(nItemIndex)
	end;
	Msg2Player("Nh�n ���c "..nCount.." m�t M�c Nh�n.")
end;
-----**����ľ�� end

-----**�����**
function sale_heroling_xiulibao(nCount, nPrice)
	for i =1, nCount do
		local nItemIndex = AddItem(6,1,1084,1,1,0)
		SetSpecItemParam(nItemIndex, 2, GetLocalDate("%y%m%d"))
		SyncItem(nItemIndex)
	end;
		Msg2Player("Nh�n ���c "..nCount.." t�i �� ngh�, th�i gian c�n l�i l� 7 ng�y.")
end;
-----**����� end

-----**�Ͻ��**
function sale_heroling_zijingao(nCount, nPrice)
		local nRestH, nRestM = addzijingao_main(nCount);
		Msg2Player("Nh�n ���c 1 T� Kim C�o, th�i gian c�n l�i l� "..nRestH.." gi�, "..nRestM.."ph�t")
end;
-----**�Ͻ�� end

function saleby_heroling_enter(nSel)
	nSel = nSel + 1
	local nCount = GetTask(TASKID_HEROLING_COUNT);
	if (nCount < 1) then
		CreateTaskSay({"<dec>Kh�ng c� Phong H�a Anh H�ng L�nh th� kh�ng th� mua v�t ph�m.", "K�t th�c ��i tho�i/tong_cancel"});
		return 0
	end;
	local arySalebyHeroling = {
						{"<dec>C� th� s� d�ng <color=yellow>T� Kim C�o<color> �� ��o kho�ng tr�n ��o Hoa ��o, L�u � l� kh�ng th� d�ng T� Kim C�o chung v�i c�c c�ng c� ��o kho�ng th��ng kh�c. N�u d�ng chung th� tr��c ti�n s� tr� th�i gian s� d�ng T� Kim C�o, sau �� l� ��n c�ng c� kia. <enter>�� nh�n T� Kim C�o c�n ti�u ph�: <color=yellow>200 �i�m<color> ", "Mu�n nh�n 1 c�i/#saleby_heroling_confirm(1,200,'sale_heroling_zijingao')", "Mu�n nh�n 2 c�i/#saleby_heroling_confirm(2,400,'sale_heroling_zijingao')", "Tr� v�/enter_heroling", "R�i kh�i/tong_cancel"},
						{"<dec><color=yellow>T�i �� ngh�<color> l� ��o c� c� th� ��t v�o h�nh trang, gi�p s�a ch�a trang b� m� kh�ng c�n quay v� th�nh, v� ���ng nhi�n l� ph�i tr� chi ph� t��ng ���ng. T�i �� ngh� c� th�i h�n s� d�ng l� 1 tu�n.<enter>�� nh�n 1 t�i �� ngh� c�n ti�u ph� �i�m c�ng hi�n l�: <color=yellow>50 �i�m<color>", "��i 1 t�i �� ngh�/#saleby_heroling_confirm(50,'sale_heroling_xiulibao')", "Tr� v�/enter_heroling", "R�i kh�i/tong_cancel"},
						{"<dec>Nh�p chu�t ph�i s� d�ng �� g�i ra 1 M�c Nh�n. Sau khi ��nh b�i m�c nh�n s� nh�n ���c �i�m kinh nghi�m.<enter>�� nh�n 1 M�c nh�n c�n ti�u ph� �i�m c�ng hi�n: <color=yellow>100 �i�m<color>", "��i 1 m�c nh�n/#saleby_heroling_confirm(100,'sale_heroling_xiulianmuren')", "Tr� v�/enter_heroling", "R�i kh�i/tong_cancel"},
						{"<dec>V�ng danh hi�u n�y s� cho ng��i m�t c�m gi�c th�m s�u huy�n �o, c� th�i h�n s� d�ng l� 1 tu�n.<enter>�� ��i l�y v�ng danh hi�u c�n s� d�ng �i�m c�ng hi�n: <color=yellow>30 �i�m<color>", "Nh�n 1 v�ng danh hi�u �m �nh/#saleby_heroling_confirm(30,'sale_heroling_anying')", "Tr� v�/enter_heroling", "R�i kh�i/tong_cancel"},
						{"<dec>��y l� v�ng danh hi�u mang s�c th�i ph��ng Nam. Nh�n v�ng H��ng Ti�u c�n s� d�ng �i�m c�ng hi�n l� <color=yellow>30 �i�m<color>. �i�m c�ng hi�n, th�i gian s� d�ng l� 1 tu�n.", "Nh�n 1 v�ng danh hi�u H��ng Ti�u/#saleby_heroling_confirm(30,'sale_heroling_xiangjiao')", "Tr� v�/enter_heroling", "R�i kh�i/tong_cancel"},
						{"<dec>Ng��i th�ch bay l��n kh�ng? v�ng danh hi�u n�y mang l�i c�m gi�c m�t con chim �ng bay � ph�a sau, c� th�i gian s� d�ng l� 1 tu�n.<enter>Mu�n nh�n v�ng danh hi�u n�y c�n s� d�ng �i�m c�ng hi�n l�: <color=yellow>30 �i�m<color>", "Nh�n 1 v�ng danh hi�u Th��ng �ng/#saleby_heroling_confirm(30,'sale_heroling_cangying')", "Tr� v�/enter_heroling", "R�i kh�i/tong_cancel"},
						{"<dec>M�t n� ng�y trang l� lo�i m�t n� h�n ch� th�i gian 24 gi� v� s� l�n s� d�ng k� n�ng ng�y trang l� 10 l�n. Khi d�ng h�t 10 l�n th� kh�ng th� s� d�ng k� n�ng ng�y trang ���c n�a.<enter>�i�m c�ng hi� c�n �� ��i m�t n� ng�y trang l�: <color=yellow>300 �i�m<color>", "��i 1 m�t n� ng�y trang/#saleby_heroling_confirm(300,'sale_heroling_weizhuang')", "Tr� v�/enter_heroling", "R�i kh�i/tong_cancel"},
						{"<dec>Lo�i ��n d��c th�n k� n�y c� th� gi�p t�ng 1.6 l�n kinh nghi�m khi �y th�c r�i m�ng, m�i vi�n c� th� s� d�ng trong 6 gi�.<enter>�i�m c�ng hi�n �� ��i l�y 1 vi�n ��i Ho�n ��n: <color=yellow>30 �i�m<color>", "��i 1 vi�n ��i Ho�n ��n/#saleby_heroling_confirm(1,30,'sale_heroling_dahuandan')", "��i 2 vi�n ��i Ho�n ��n/#saleby_heroling_confirm(2,60,'sale_heroling_dahuandan')", "��i 5 vi�n ��i Ho�n ��n/#saleby_heroling_confirm(5,150,'sale_heroling_dahuandan')", "��i 10 vi�n ��i Ho�n ��n/#saleby_heroling_confirm(10,300,'sale_heroling_dahuandan')", "Tr� v�/enter_heroling", "R�i kh�i/tong_cancel"},
																	};
	if (arySalebyHeroling[nSel]) then
		if (nSel == 8) then
			nRestH, nRestM = GetMinAndSec(GetTask(TASKID_TECHAN_HUANDAN_TIME));
			arySalebyHeroling[nSel][1] = arySalebyHeroling[nSel][1].."<enter>Th�i gian s� d�ng ��i Ho�n ��n c�n l�i l�: <color=yellow>"..nRestH.."gi� "..nRestM.." ph�t<color>"
		end;
		arySalebyHeroling[nSel][1] = arySalebyHeroling[nSel][1].."<enter>S� l��ng Phong H�a Anh H�ng L�nh c� th� s� d�ng hi�n t�i l�: <color=yellow>"..nCount.." c�i<color><enter>T�ng �i�m c�ng hi�n hi�n t�i c� th� s� d�ng l�: <color=yellow>"..GetContribution().." �i�m<color><enter>Ng��i ��ng � ��i kh�ng?"
		CreateTaskSay(arySalebyHeroling[nSel]);
	end;
end;

function saleby_heroling_confirm(nCount, nPrice, szfunc)
	if (not szfunc) then
		szfunc = nPrice;
		nPrice = nCount;
		nCount = 1;
	end;
	local _, nTongID = GetTongName();
	if (check_salebyheroling(nTongID, nPrice) == 1) then
		local nHeroling = GetTask(TASKID_HEROLING_COUNT);
		SetTask(TASKID_HEROLING_COUNT, nHeroling - 1);
		AddContribution(-nPrice);
		heroling_applyaddtask(nTongID, 1);	--���Ӱ���ۻ����Ӣ���������
		dostring(szfunc.."("..nCount..","..nPrice..")");
	end;
end;
-----�Է��Ӣ�����������Ʒ End

-----�һ����Ӣ���� Start
function change_contribution_heroling()
	if (tonumber(GetLocalDate("%Y%m%d")) > 20070101) then
		CreateTaskSay({"<dec>Ho�t ��ng Phong H�a Anh H�ng L�nh s� k�t th�c v�o 01-01-2007. Tr��c 08-01-2007, ng��i ch�i c� th� ti�p t�c d�ng Phong H�a Anh H�ng L�nh �� ��i ph�n th��ng.", "K�t th�c ��i tho�i/tong_cancel"});
		return 0;
	end;
	local nWeekOffer = GetWeeklyOffer();--������ۻ����׶�
	local nUsedOffer = GetTask(TASKID_CONTRIBUTE_USED);
	local nMyCount = GetTask(TASKID_LASTHERO_TAKED);
	local nLastTime = GetTask(TASKID_LASTHERO_DATE);
	local nLastDate = mod(nLastTime , 1000);
	local nLastWeek = floor(nLastTime / 1000);
	local nDate = tonumber(GetLocalDate("%j"));
	local nWeek = tonumber(GetLocalDate("%W"));
	
	if (nWeek ~= nLastWeek) then
		nLastWeek = nWeek;
		SetTask(TASKID_CONTRIBUTE_USED, 0);
		nUsedOffer = 0;
	end;
	if (nDate ~= nLastDate) then
		nLastDate = nDate;
		SetTask(TASKID_LASTHERO_TAKED, 0);
		nMyCount = 0;
	end;
	
	SetTask(TASKID_LASTHERO_DATE, nLastWeek * 1000 + nLastDate);
	local nHeroCount = floor((nWeekOffer - nUsedOffer)/100);
	
	if (nHeroCount > 3 - nMyCount) then
		nHeroCount = 3 - nMyCount;
	end;
	if (nHeroCount > 0) then
		CreateTaskSay({"<dec>�i�m c�ng hi�n c� th� ki�m t� c�c ho�t ��ng. �i�m c�ng hi�n n�y s� ���c h� th�ng t� ��ng ghi nh�n t�ch l�y, m�i khi t�ch l�y ���c <color=yellow>100 �i�m c�ng hi�n<color> th� bang ch�ng c� th� ��n T� ��n bang h�i �� nh�n 1 Phong H�a Anh H�ng L�nh, s� l��ng nh�n ���c m�i ng�y kh�ng th� h�n <color=yellow>3 t�m<color>, m�i tu�n s� t�nh l�i t� ��u."
	.."<enter>�i�m c�ng hi�n t�ch l�y tu�n n�y l�: <color=yellow>"..nWeekOffer.." �i�m<color>."
	.."<enter>Phong H�a Anh H�ng L�nh c� th� ��i hi�n t�i l�: <color=yellow>"..nHeroCount.." c�i<color>.",
	"Ta mu�n ��i Phong H�a Anh H�ng L�nh/#sure_contribution_heroling("..nHeroCount..")", "Tr� v�/enter_heroling", "R�i kh�i/tong_cancel"});
	else
		CreateTaskSay({"<dec>�i�m c�ng hi�n c� th� ki�m t� c�c ho�t ��ng. �i�m c�ng hi�n n�y s� ���c h� th�ng t� ��ng ghi nh�n t�ch l�y, m�i khi t�ch l�y ���c <color=yellow>100 �i�m c�ng hi�n<color> th� bang ch�ng c� th� ��n T� ��n bang h�i �� nh�n 1 Phong H�a Anh H�ng L�nh, s� l��ng nh�n ���c m�i ng�y kh�ng th� h�n <color=yellow>3 t�m<color>, m�i tu�n s� t�nh l�i t� ��u."
	.."<enter>�i�m c�ng hi�n t�ch l�y tu�n n�y l�: <color=yellow>"..nWeekOffer.." �i�m<color>."
	.."<enter>Phong H�a Anh H�ng L�nh c� th� ��i hi�n t�i l�: <color=yellow>"..nHeroCount.." c�i<color>.",
	"Tr� v�/enter_heroling", "R�i kh�i/tong_cancel"});
	end;
end;

function sure_contribution_heroling(ncount)
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		return
	end;
	SetTask(TASKID_HEROLING_COUNT, GetTask(TASKID_HEROLING_COUNT) + ncount);	--���ӷ��Ӣ���������
	SetTask(TASKID_CONTRIBUTE_USED, GetTask(TASKID_CONTRIBUTE_USED) + ncount * 100);	--���Ӷһ����ĵĹ��׶�
	SetTask(TASKID_LASTHERO_TAKED, GetTask(TASKID_LASTHERO_TAKED) + ncount);		--���ӱ�����ȡ������
	Msg2Player("B�n ��t ���c "..ncount.." c�i Phong H�a Anh H�ng L�nh.");
end;

-----�һ����Ӣ���� End
-----���봫���ɷ����룬����62s = 1m2s
function GetMinAndSec(nSec)
	nRestMin = floor(nSec / 60);
	nRestSec = mod(nSec,60)
	return nRestMin, nRestSec;
end;

-----�һ�Boss�ٻ���
--AddItem(6, 1, 1022, 10, 0, 0, 0);
function change_heroling_bosscharm()
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		return
	end;
	local nTongHeroling = TONG_GetTaskValue(nTongID, TONGTSK_HEROLING);
	local nUseHeroling = TONG_GetTaskValue(nTongID, TONGTSK_USEHEROLING);
	CreateTaskSay({"<dec>Bang h�i c�n �em Phong H�a Anh H�ng L�nh �� ��i L�nh b�i g�i Boss. Ph��ng th�c t�ch l�y l�: Khi bang ch�ng d�ng Phong H�a Anh H�ng L�nh �� mua v�t ph�m, th� n� s� ���c t�ch l�y v�o s� l�nh b�i c�a bang h�i. Khi ��t ���c <color=yellow>63 c�i Phong H�a Anh H�ng L�nh<color> th� bang ch� ho�c tr��ng l�o c� th� ��i l�y 1 L�nh b�i g�i Boss.Phong H�a Anh H�ng L�nh t�ch l�y t�i �a h�ng tu�n l� <color=yellow>900 c�i<color>. V�o tu�n m�i th� Phong H�a Anh H�ng L�nh s� t�nh l�i t� ��u.<enter>Phong H�a Anh H�ng L�nh t�ch l�y trong tu�n c�a bang l�: "..nTongHeroling.." c�i.<enter>S� l��ng Phong H�a Anh H�ng L�nh bang h�i c� th� d�ng �� ��i L�nh b�i g�i Boss l�:  "..(nTongHeroling-nUseHeroling).." c�i<enter>, s� l��ng L�nh b�i g�i Boss c� th� nh�n ���c l�: "..floor((nTongHeroling-nUseHeroling)/63).."c�i", "��i l�nh b�i g�i Boss/sure_heroling_bosscharm", "Tr� v�/enter_heroling", "R�i kh�i/tong_cancel"});
end;


function sure_heroling_bosscharm()
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		return
	end;
	if (GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER) then
		CreateTaskSay({"<dec>Ch� c� bang ch� ho�c tr��ng l�o m�i c� th� s� d�ng Phong H�a Anh H�ng L�nh ��i L�nh b�i g�i Boss.", "K�t th�c ��i tho�i/tong_cancel"});
		return 0;
	end;
	local nTongHeroling = TONG_GetTaskValue(nTongID, TONGTSK_HEROLING);
	local nUseHeroling = TONG_GetTaskValue(nTongID, TONGTSK_USEHEROLING);
	local nCount = floor((nTongHeroling-nUseHeroling) / 63);
	if (nCount < 1) then
		CreateTaskSay({"<dec>Phong H�a Anh H�ng L�nh m� bang h�i c� th� d�ng �� ��i 1 l�nh b�i g�i Boss. Phong H�a Anh H�ng L�nh t�ch l�y c�n s� n� l�c c�a t�t c� m�i ng��i.", "K�t th�c ��i tho�i/tong_cancel"});
		return 0;
	end;
	if (CalcFreeItemCellCount() < nCount * 2) then
		CreateTaskSay({"<dec>H�nh trang kh�ng �� ch� tr�ng. C� kh� n�ng s� nh�n "..nCount.." l�nh b�i g�i Boss, h�y s�p x�p l�i h�nh trang tr��c.", "K�t th�c ��i tho�i/tong_cancel"});
		return 0;
	end;
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_USEHEROLING, nCount*63);
	for i=1, nCount do
		AddItem(6, 1, 1022, 10, 0, 0, 0);
	end;
	Msg2Player("B�n ��t ���c "..nCount.." L�nh b�i g�i Boss.");
end;
-----�һ�Boss�ٻ��� end


-----�һ��й��ܼ�
function change_letter_honour()
	CreateTaskSay({"<dec>Khi s� l��ng Phong H�a Anh H�ng L�nh ��t <color=yellow>120 c�i<color> th� v�o th� 6, th� 7 h�ng tu�n c� th� tham gia ho�t ��ng <color=yellow>Truy t�m m�t th�<color>. V�o th� 6 v� th� 7, b�n ngo�i c�c T�n Th� Th�n s� xu�t hi�n <color=yellow>Ng��i r�m<color> mang theo c�c m�t th�. M�i ng��i c�n t�m c�c m�t th� c� tr�n ng��i nh�ng ng��i r�m n�y. Th�i gian xu�t hi�n c�a ng��i r�m l� 7h30, 7h40, 7h50, th�i gian c� th� t�m m�t th� l� <color=yellow>7h35, 7h45, 7h55<color>. Th�i gian nh�n ���c m�t th� l� 1 ph�t. Ta s� nh�n m�t th� t� c�p l�nh ��o bang, sau �� s� ��ch th�n ta giao cho tri�u ��nh. Tri�u ��nh s� t�ng th��ng cho bang <color=yellow>25 t�m l�nh b�i vinh d� H�c thi�t<color>. T�a �� c�a ng��i r�m l�: <enter>"
	.."Ba L�ng Huy�n: 220/200     Giang T�n Th�n: 438/396<enter>"
	.."V�nh L�c Tr�n: 197/188     ��o H��ng Th�n: 215/185<enter>"
	.."Long M�n Tr�n: 233/287     Th�ch C� Tr�n: 214/205<enter>"
	.."Long Tuy�n Th�n: 216/199",
	"M�t th� ta t�m ���c v� ��y!/sure_letter_honour", "Tr� l�i thao t�c tr��c/enter_heroling", "R�i kh�i/tong_cancel"});
end;

function sure_letter_honour()
	local _, nTongID = GetTongName();
	
	local count = CalcEquiproomItemCount(4,1121,1,-1);
	if (GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER) then
		CreateTaskSay({"<dec>T�t nh�t s� do bang ch� ho�c tr��ng l�o giao cho ta.", "Ta bi�t r�i/tong_cancel"});
	elseif (count < 1) then
		CreateTaskSay({"<dec>M�t th� ��u sao ta kh�ng th�y?", "K�t th�c ��i tho�i/tong_cancel"});
	elseif (CalcFreeItemCellCount() < 25) then
		CreateTaskSay({"<dec>H�nh trang kh�ng �� ch� tr�ng, kh�ng th� giao H�c thi�t l�nh.", "�� ta x�p l�i h�nh trang ��./tong_cancel"});
	else
		ConsumeEquiproomItem(1,4,1121,1,-1);
		for i = 1, 25 do
			AddItem(6,1,1257,1,1,1); 
		end;
		Msg2Player("Nh�n ���c 25 c�i l�nh b�i vinh d� H�c thi�t");
	end;
end;

--���Ӱ���ۻ����Ӣ����
function heroling_applyaddtask(nTongID, nValue)
	local ntask = TONG_GetTaskValue(nTongID, TONGTSK_HEROLING);
	if (ntask < 900) then
		ntask = ntask + nValue;
		if (ntask + nValue > 900) then
			nValue = 900 - ntask;
		end;
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_HEROLING, nValue);
	end;
end;