IncludeLib("TONG")

Include("\\script\\tong\\tong_header.lua")
Include("\\script\\tong\\log.lua")
Include("\\script\\tong\\map\\map_management.lua")
Include("\\script\\global\\tonggetmasterpower.lua")
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\fenghuo_hero\\hero_event.lua")

--�����Ŀ���콱
function tong_award(nTongID)
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WEEKGOAL) ~= 1) then
		CreateTaskSay({"<dec><npc>Ng��i kh�ng c� quy�n h�n qu�n l� m�c ti�u tu�n, kh�ng th� l�nh th��ng!", "Ta bi�t r�i/tong_cancel"});
		return
	end
	if (TONG_GetLWeekGoalEvent(nTongID) == 0) then
		CreateTaskSay({"<dec><npc>Tu�n tr��c kh�ng c� m�c ti�u tu�n, kh�ng th� nh�n th��ng!", "Ta bi�t r�i/tong_cancel"});
		return
	end
	if (TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE) ~= 1) then
		CreateTaskSay({"<dec><npc>Qu� bang ch�a ho�n th�nh m�c ti�u tu�n tr��c, kh�ng th� nh�n th��ng!", "Ta bi�t r�i/tong_cancel"});
		return
	end
	local nWeek = TONG_GetWeek(nTongID);
	--�������ʱ�����жϣ������ˢ����Ϊ�����������ڷ���˲��Ǽ�ʱ���ϵģ�
	--�����콱ֻ�����������ͼ����˻��������ڶ��������ͬʱ�콱��ˢ�����
	if (nWeek == TONG_GetTaskTemp(nTongID, TONG_TMPWEEKGOALPRICE) or 
		nWeek == TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_PRICE_WEEK)) then
		CreateTaskSay({"<dec><npc>�� nh�n ph�n th��ng r�i, c�n mu�n nh�n n�a sao!", "Ta bi�t r�i/tong_cancel"});
		return
	end
	local nWeekGoalPriceTong = TONG_GetLWeekGoalPriceTong(nTongID)
	TONG_ApplyAddWarBuildFund(nTongID, nWeekGoalPriceTong);
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFADD, nWeekGoalPriceTong);
	--���콱��־��Ϊ����
	TONG_SetTaskTemp(nTongID, TONG_TMPWEEKGOALPRICE, nWeek);
	TONG_ApplySetTaskValue(nTongID, TONGTSK_WEEKGOAL_PRICE_WEEK, nWeek);
	TONG_ApplyAddEventRecord(nTongID, "�� nh�n th��ng m�c ti�u tu�n."..nWeekGoalPriceTong.." v�n ng�n s�ch chi�n b�");	-- ����¼���¼
	Msg2Player(format("Nh�n ���c ph�n th��ng m�c ti�u tu�n: Ng�n s�ch chi�n b� <color=gold>%d<color> v�n", nWeekGoalPriceTong))
end

--������Ŀ���콱
function WeekGoalPrice(nTongID)
	if (TONG_GetLWeekGoalEvent(nTongID) == 0) then
		CreateTaskSay({"<dec><npc>Tu�n tr��c qu� bang kh�ng c� m�c ti�u tu�n, kh�ng th� nh�n th��ng!", "Ta bi�t r�i/tong_cancel"});
		return
	end
	if (TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE) ~= 1) then
		CreateTaskSay({"<dec><npc>Ch�a ho�n th�nh m�c ti�u tu�n, kh�ng th� nh�n th��ng!", "Ta bi�t r�i/tong_cancel"});
		return
	end
	local nTongWeek = TONG_GetWeek(nTongID)
	local nLWeekValue = TONGM_GetLWeekGoalOffer(nTongID, GetName())
	local nPlayerGoal = TONG_GetLWeekGoalPlayer(nTongID)
	--ʹ�õ����ɷ���˾����ĳ�Ա����
	local nState = GetTongMTask(TONGMTSK_WEEK_GOAL_PRICE)
	if (nState == nTongWeek) then --�������������Ϊ����
		CreateTaskSay({"<dec><npc>�� nh�n ph�n th��ng m�c ti�u tu�n tr��c r�i, c�n ti�p t�c c�ng hi�n cho bang h�i, tu�n sau h�y ��n nh�.", "Ta bi�t r�i/tong_cancel"});
		return
	end
	if (nLWeekValue == 0 or nPlayerGoal == 0) then
		CreateTaskSay({"<dec><npc>Tu�n tr��c ch�a l�m vi�c g� c�, l�m g� c� chuy�n kh�ng c�ng ���c th��ng ch�?", "Ta bi�t r�i/tong_cancel"});
		return
	end
	if (nLWeekValue < nPlayerGoal) then
		CreateTaskSay({"<dec><npc>Ch�a ho�n th�nh m�c ti�u tu�n tr��c, kh�ng th� nh�n th��ng, c�n ti�p t�c c� g�ng cho bang h�i, s�m mu�n g� c�ng ���c ��n ��p th�i.", "Ta bi�t r�i/tong_cancel"});
		return
	end	
	local nPrice = TONG_GetLWeekGoalPricePlayer(nTongID)
	AddContribution(nPrice)
	Msg2Player("<#>�� ho�n th�nh m�c ti�u tu�n bang h�i, nh�n ���c ph�n th��ng �i�m c�ng hi�n:"..nPrice.."�i�m")
	Msg2Player("<#>�� ho�n th�nh m�c ti�u tu�n bang h�i, nh�n ���c ph�n th��ng �i�m kinh nghi�m: "..(nPrice*10000).."�i�m")
	AddOwnExp(nPrice*10000)
	SetTongMTask(TONGMTSK_WEEK_GOAL_PRICE, nTongWeek)
end

function main()
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	if (GetProductRegion() == "cn_ib") then
		-- ����ͼģ���еļ�����ֱ�ӽ����ͼ����
		if (aDynMapCopyName[nSubWorldId] ~= nil) then
			tongmap_management();
			return
		end
	end;
	local _Name, nTongID = GetTongName();
	-- ���û�а���򲻳��ֹ����б�
	if (nTongID == 0) then
		CreateTaskSay({"<dec><npc>Mu�n t�m hi�u th�ng tin v� h� th�ng bang h�i m�i!", "Tr� gi�p bang h�i/#tong_help()", "H�y b� /tong_cancel"});
		return
	end
	local param = "("..nTongID..")";
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	if (nSubWorldId > DYNMAP_ID_BASE and nSubWorldId ~= TONG_GetTongMap(nTongID)) then
		Say("��y kh�ng ph�i l� l�nh ��a c�a qu� bang, mu�n ��n tham quan sao?", 2, "Tr� gi�p bang h�i/#tong_help()", "Nh�n ti�n gh� qua th�i/tong_cancel");
		return
	end
	local figure = TONGM_GetFigure(nTongID, GetName());
	local aryDescribe = 
	{
				"<dec><npc>Ng��i t�m ta c� vi�c g�?",
				"Ph�n th��ng m�c ti�u tu�n c� nh�n/#WeekGoalPrice"..param,
				"Nh�n ph�n th��ng �i�m c�ng hi�n m�i ng�y/#GetDayPrice"..param,
--				"����ȼ���������/LUP_HelpInfo",
				-- Խ�ϰ�᲻��
--				"���ư�����װ/enter_anbang",
				"T� ti�n c� ch�c bang ch�/#tong_mastercompetition"..param,
--				"��������Ϣ/#tong_help()",
	};
	--����ǳ��ϺͰ���
	if (figure == TONG_MASTER or figure == TONG_ELDER) then
		tinsert(aryDescribe, "Thi�t l�p �� kh� m�c ti�u tu�n/#tong_levelchoose"..param);
		tinsert(aryDescribe, "Ph�n th��ng m�c ti�u tu�n bang h�i/#tong_award"..param);
	end
	tinsert(aryDescribe, "Tr� gi�p bang h�i/#tong_help()");
	tinsert(aryDescribe, "H�y b� /tong_cancel");
	CreateTaskSay(aryDescribe);
end

function tong_help()
	OpenHelp(80)
end

function GetDayPrice(nTongID)
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_RETIRE) then
		Say("�ang � tr�ng th�i tho�i �n, kh�ng th� nh�n th��ng", 0);	
		return
	end	
	if (TONGM_GetJoinDay(nTongID, GetName() ) == TONG_GetDay(nTongID)) then
		Say("<#>Ph�i v�o bang tr�n m�t ng�y m�i ���c nh�n!", 0)
		return
	end

	if (TONG_GetBuildLevel(nTongID) <= 0) then
		Say("<#>Bang h�i ��t c�p 1 m�i ���c nh�n �i�m c�ng hi�n", 0)
		return
	end
	--��̳�������ۼӵ����ۻ����׶�
	if (TONG_GetPauseState(nTongID) ~= 0) then
		Say("<#>Bang h�i �ang � tr�ng th�i t�m ng�ng ho�t ��ng, kh�ng th� nh�n  ", 0)
		return
	end
	local nTongDay = TONG_GetDay(nTongID)
	if (GetTongMTask(TONGMTSK_DAILY_PRICE) == nTongDay) then
		Say("<#>�� nh�n ph�n th��ng h�m nay", 0)
		return
	end
	local nPrice = DAILY_PRICE
	if (nPrice > 0)then
		AddContribution(nPrice)
		Msg2Player("Nh�n ���c <color=gold>"..nPrice.."<color> �i�m c�ng hi�n")
	end
	SetTongMTask(TONGMTSK_DAILY_PRICE, nTongDay)
end

function unchain_pause_state(nTongID)
	local nConsume = TONG_GetMaintainFund(nTongID)	
	local nCurFund = TONG_GetWarBuildFund(nTongID)
	if (nCurFund < nConsume*7) then
		Say("<#>Ng�n s�ch chi�n b� th�p h�n m�c ng�n s�ch chi�n b� b�o tr� cho ph�p, kh�ng th� kh�i ��ng t�c ph��ng!", 0)
	else	
		TONG_ApplySetPauseState(nTongID, 0)
		Msg2Tong(nTongID, "T�c Ph��ng bang h�i kh�i ph�c ho�t ��ng!")
	end
end

function tong_levelchoose(nTongID)
	if nTongID == 0 then return end;
	local nLevel = TONG_GetCurWeekGoalLevel(nTongID)
	Say("<#>M�c �� kh� m�c ti�u tu�n c�a bang h�i l� c�p <color=yellow>"..nLevel.."<color>,\n\n Thi�t l�p �� kh� m�c ti�u tu�n hi�n t�i s� c� t�c d�ng v�o tu�n sau, mu�n thi�t l�p l�i �� kh� c�a m�c ti�u tu�n kh�ng?", 3, "�� kh� c�p 1/#select_level(1)", "�� kh� c�p 2/#select_level(2)", "Kh�ng c�n ��u/tong_cancel")
end

function select_level(nLevel)
	local _Name, nTongID = GetTongName()
	if nTongID == 0 then return end;
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WEEKGOAL) ~= 1) then
		Say("<#>Ng��i kh�ng c� quy�n h�n qu�n l� m�c ti�u tu�n, h�y m�i bang ch� ��n ��y!", 0)
		return
	end
	TONG_ApplySetCurWeekGoalLevel(nTongID, nLevel)
	Say("<#>�� kh� m�c ti�u tu�n hi�n t�i l�: <color=yellow>"..nLevel.."c�p", 0)
end

-- �û���������Լ�
function tong_mastercompetition() 
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrDateTime = GetCurServerTime();
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then
		local nMasterID = TONG_GetFirstMember(nTongID, 0);
		local nMasterLastOnlineDate = 0;
		if (nMasterID ~= 0) then --�����������
			nMasterLastOnlineDate = TONGM_GetLastOnlineDate(nTongID, nMasterID);
		end
		
		if (TONGM_GetOnline(nTongID, nMasterID) == 1 or
			(floor(dwCurrDateTime/(24*3600)) - nMasterLastOnlineDate) <= MASTER_ASIDE_TIME) then --�����뿪����30��,�������ڲ�����
				Say("Bang ch� ch�a r�i kh�i 30 ng�y, ch�a th� t� ch�c t� ti�n c� v�o ch�c v� bang ch�", 1, "X�c nh�n/tong_cancel");
			return
		end
	end
	
	local param = "("..nTongID..")";
	
	-- ִ�е��˴����������뿪30����
	if (CheckTongMasterPower() ~= 1) then --�����ϵ��������ʸ�
		Say("�i�m th�ng so�i v� danh v�ng kh�ng �� �� ��m nhi�m ch�c v� bang ch�", 1, "X�c nh�n/tong_cancel")
		return
	end

	--ִ�е�����������������������ﵽ�������Ƿ�����ѡ�����������
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then --��û�п���
		Say("Bang ch� �� r�i kh�i 30 ng�y, ng��i c� th� t� ti�n c� v�o ch�c v� bang ch�, 2 tu�n sau c� th� tham gia cu�c b�nh ch�n bang ch�.",
			2, "B�t ��u/#_tong_startup_compete"..param, "H�y b� /tong_cancel");
	elseif (TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_MASTERCANDIDATE) == 0) then --��û�н���2240����,���ǰ�����ѡ��
		Say("Mu�n tranh �ua ch�c bang ch� c�n ph�i ��ng g�p nhi�u cho bang h�i trong v�ng 2 tu�n t�i: tham gia c�c ho�t ��ng v� ��t ���c 2240 �i�m c�ng hi�n c� nh�n (�i�m c�ng hi�n d� tr� th��ng t� bang h�i, �i�m c�ng hi�n t� T� ��n, �i�m c�ng hi�n c� nh�n t� m�c ti�u tu�n s� kh�ng ���c t�nh)", 2, "Tham gia/_foretask", "H�y b� /tong_cancel");
	else  --�Ѿ��Ǻ�ѡ���ˣ����μ���2240����
		local nIniContribution = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_INICONTRIBUTIVENESS);--��øղ���2240����ʱ�Ĺ��׶�
		local nEarnContributiveness =  GetCumulateOffer() - nIniContribution;--����õ����ӵ��ֹ����׶�
		if(nEarnContributiveness < FORETASKVALUE ) then --���׵㻹����2240
			Say("�� c� "..tostring(nEarnContributiveness).." �i�m c�ng hi�n"..", c�n thi�u "..tostring(FORETASKVALUE - nEarnContributiveness).." �i�m c�ng hi�n.", 0);
			return
		end
		local nLastContributiveness = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS);
		if (nLastContributiveness == 0) then
			Say("Xin ch�c m�ng! Ng��i �� t�m ���c t�i thi�u l� 2240 �i�m c�ng hi�n n�n c� th� tham gia tranh �ua c��ng v� bang ch�, h�y nh�p v�o con s� �� thi th�, con s� cao nh�t s� g�p 20 l�n �i�m c�ng hi�n c� nh�n c�a ng��i, v� c�ng l�u � l� m�i l�n ch�n l�c s� tr� 5% ph� th� t�c.", 2, "X�c nh�n/inputcontributiveness", "H�y b� /tong_cancel");
		else
			Say("S� �i�m thi �ua l� "..tostring(nLastContributiveness)..", ng��i mu�n t�ng th�m sao?", 2, "+/inputcontributiveness", "H�y b� /tong_cancel");
		end
	end
end 

--���������Լ�
function _tong_startup_compete(nTongID)
	local _Name, nCurTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrDateTime = GetCurServerTime();
	
	if (nCurTongID == 0 or nTongID ~= nCurTongID) then
		return
	end
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then
		local nMasterID = TONG_GetFirstMember(nTongID, 0);
		local nMasterLastOnlineDate = 0;
		if (nMasterID ~= 0) then --�����������
			nMasterLastOnlineDate = TONGM_GetLastOnlineDate(nTongID, nMasterID);
		end
		
		if (TONGM_GetOnline(nTongID, nMasterID) == 1 or
			(floor(dwCurrDateTime/(24*3600)) - nMasterLastOnlineDate) <= MASTER_ASIDE_TIME) then --�����뿪����30��,�������ڲ�����
			return
		end
	end
	
	
	TONG_ApplySetTaskValue(nTongID, TONGTSK_OPEN_DATE, dwCurrDateTime); --��ѡ��ʼ����
	--���ģ�����¼��м�¼
	Msg2Tong(nTongID, "Ho�t ��ng t� ti�n c�a bang ch� �� b�t ��u");
	TONG_ApplyAddEventRecord(nTongID, "Ho�t ��ng t� ti�n c�a bang ch� �� b�t ��u");
	--�������
	local tbMsg = {
		startmemberid	 = GetTongMemberID(),
		startupdate      = FormatTime2String(dwCurrDateTime)
		}
		cTongLog:WriteInfTB("TONG", "master_compete_date", nTongID, tbMsg)

		Say("�� b�t ��u t� ti�n c� v�o ch�c bang ch�, mu�n tranh �ua ch�c bang ch� c�n ph�i ra s�c c�ng hi�n cho bang h�i trong v�ng 2 tu�n s�p t�i: tham gia c�c ho�t ��ng v� l�m �� t�m 2240 �i�m c�ng hi�n c� nh�n (�i�m c�ng hi�n t� ph�n th��ng c�a bang h�i, �i�m c�ng hi�n nh�n � T� ��n, �i�m c�ng hi�n c� nh�n t� ph�n th��ng m�c ti�u tu�n ��u kh�ng t�nh v�o �i�m c�ng hi�n tham gia ho�t ��ng)", 2, "Tham gia/_foretask", "H�y b� /tong_cancel");
end

--����Ϊ��ѡ��,�������Ⱦ�����,Ϊ��ṱ��2240�㹱�׶�
function _foretask()
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_MASTERCANDIDATE, 1);--��Ϊ������ѡ��
	Say("Xin ch�c m�ng, ng��i �� tr� th�nh ng��i ���c �� c�, h�y mau ch�ng nh�n l�i 2240 �i�m c�ng hi�n.", 1, "X�c nh�n/tong_cancel");
	local tbMsg = {
		mastercandidat	 = GetTongMemberID()
		};
	cTongLog:WriteInfTB("TONG", "master_candidat", nTongID, tbMsg);
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_INICONTRIBUTIVENESS, GetCumulateOffer()); --��¼��ǰ�ֹ����׶�,��Ϊ2240�������ʼ��־
end

--���û�����ҪͶ��Ǯ��
function inputcontributiveness()
	AskClientForNumber("tong_masterbidding", 1, 500000000, "H�y nh�p v�o con s�: ");
end

-- ��Ͷ��ע�Ᵽ��ÿ���˵ľ�Ͷ����,�ѱ㲢�е�ʱ���������
function tong_masterbidding(nContributiveness )
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrsecond = GetCurServerTime();

	--���㽫Ҫ�۳����׶�
	local nLastContributiveness = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS);--�ϴ�Ͷ����
	local nCurrTotalOffer = nLastContributiveness + nContributiveness; --�ܹ�Ͷ����
	local nDeductContributiveness = ceil((nContributiveness/ 20));--Ҫ�۳��Ĺ��׶�
	local nNewcontrvalue = GetContribution() - nDeductContributiveness;
	
	if (nNewcontrvalue < 0) then
		Say("�i�m c�ng hi�n th�p h�n 5% con s� �� nh�p v�o, kh�ng th� tham gia.", 0);
		return
	end
	
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS, nCurrTotalOffer)
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_SELFCOMMEND_TIME, dwCurrsecond)--��¼��Ͷʱ��,�����׶���ͬ��ʱ������������
	
	Say("S� �i�m tranh �ua l�: "..tostring(nCurrTotalOffer), 0);
	AddContribution((-nDeductContributiveness));

	local tbMsg = {
		contribution     = nCurrTotalOffer,
		selfcommend_time = FormatTime2String(dwCurrsecond)
		}
	cTongLog:WriteInfTB("TONG", "master_bidding", nTongID, tbMsg)
end

---���ƶ�������---------------------------------------------------------------------------
--���ƶ�������ı�
ab_detail = {
			[1] = {"An Bang �i�n Ho�ng th�ch ng�c b�i", "T�ng qu�n Ho�t ��ng ph��ng: Mua <color=yellow>[Ph�ng ch�] An Bang �i�n Ho�ng Th�ch Ng�c B�i<color> c�n <color=yellow>200<color> �i�m c�ng hi�n, ng��i ��ng � kh�ng?", 200, 218},
			[2] = {"An Bang C�c hoa Th�ch ch� ho�n", "T�ng qu�n Ho�t ��ng ph��ng: Mua <color=yellow>[Ph�ng ch�] An Bang C�c Hoa Th�ch Ch� Ho�n <color> c�n <color=yellow>500<color> �i�m c�ng hi�n, ng��i ��ng � kh�ng?", 500, 217},
			[3] = {"An Bang K� Huy�t Th�ch Gi�i Ch�", "T�ng qu�n Ho�t ��ng ph��ng: Mua <color=yellow>[Ph�ng ch�] An Bang K� Huy�t Th�ch Gi�i Ch�<color> c�n <color=yellow>500<color> �i�m c�ng hi�n, ng��i ��ng � kh�ng?", 500, 219},
			[4] = {"An Bang B�ng Tinh Th�ch H�ng Li�n", "T�ng qu�n Ho�t ��ng ph��ng: Mua <color=yellow>[Ph�ng ch�] An Bang B�ng Tinh Th�ch H�ng Li�n<color> c�n <color=yellow>1000<color> �i�m c�ng hi�n, ng��i ��ng � kh�ng?", 1000, 216}
};
function enter_anbang()
	--�����ѡ��
	local tab_ab_content = {};
	local nLoop = 4;

	tinsert(tab_ab_content, "T�m hi�u v� b� An bang ph�ng ch�/tong_ab_about");
	for i = 1, nLoop do
		tinsert(tab_ab_content, "Ta mu�n mua "..ab_detail[i][1].." ("..ab_detail[i][3].." �i�m c�ng hi�n) /#tong_ab_get("..i..")");
	end;
	tinsert(tab_ab_content, "R�i kh�i/tong_cancel");
	Say("T� ��n:  Ha ha ha�g�n ��y, bang h�i �� ph�ng ch� ���c b� trang b� an bang, tuy ch� l� m� ph�ng, nh�ng hi�u qu� c�a n� c�ng kh�ng thua g� b� an bang th�t, ngo�i ra, khi d�ng chung v�i b� an bang th�t v�n c� th� k�ch ho�t ���c nh� th��ng. Ng��i c� mu�n mua kh�ng?",
	getn(tab_ab_content), tab_ab_content);
end;

function tong_ab_about()
	Say("T� ��n:  ��y l� b� an bang ph�ng ch�, tuy thu�c t�nh c� kh�c v�i b� an bang g�c, nh�ng nguy�n li�u ch� t�o th� r� h�n nhi�u. Ng��i c� th� mua <color=yellow>[Ph�ng ch�] An Bang C�c Hoa Th�ch Ch� Ho�n<color>, <color=yellow>[Ph�ng ch�] An Bang K� Huy�t Th�ch Gi�i Ch�<color>, <color=yellow>[Ph�ng ch�] An Bang �i�n Ho�ng Th�ch Ng�c B�i<color>, <color=yellow>[Ph�ng ch�] An Bang B�ng Tinh Th�ch H�ng Li�n<color>.", 0);
end;

function tong_ab_get(nIndex)
	if (nIndex < 1 or nIndex > 4) then
		return
	end;
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	if (GetContribution() < ab_detail[nIndex][3]) then
		Say("T� ��n:  �i�m c�ng hi�n c� nh�n kh�ng �� <color=yellow>"..ab_detail[nIndex][3].."<color> �i�m, kh�ng th� mua bang v�t n�y, h�y c� g�ng t�m �i�m c�ng hi�n tr��c ��.", 0);
		Msg2Player("�i�m c�ng hi�n c� nh�n kh�ng ��, kh�ng th� s� d�ng ch�c n�ng n�y.");
		SetTaskTemp(193, 0);
		return
	end;
	
	AddGoldItem(0, ab_detail[nIndex][4]);
	AddContribution(-ab_detail[nIndex][3]);
	Msg2Player("S� d�ng <color=yellow>"..ab_detail[nIndex][3].." �i�m c�ng hi�n<color> �� mua 1<color=yellow>"..ab_detail[nIndex][1].."<color>.")
	SetTaskTemp(193, 0);
end;

-------------------------------�����������---------------------------------------
aTongLevelUpPrice = {
	[2] = {	--2��ʱ��boss��������֮ӡ���߼��Ի�֮��
		{20, 100, 200},
		{10, 100, 50},
		{8, 100, 50},
		{6, 100, 50},
		{4, 100, 50},
		{2, 100, 50},
		{1, 100, 50},
	},
	[4] = {	--4��ʱ��boss��������֮ӡ���߼��Ի�֮��
		{30, 200, 200},
		{20, 200, 100},
		{15, 200, 100},
		{10, 200, 100},
		{8, 200, 100},
		{6, 200, 100},
		{4, 200, 100},
	}									}

function LUP_HelpInfo()
	Say("Ch� c�n l� 1 trong <color=red>7<color> bang h�i ��ng ��u c� ��ng c�p ki�n thi�t th�ng l�n c�p <color=yellow>2<color> ho�c <color=yellow>4<color>, "..
	 	"s� do bang ch� ��n ch� ta nh�n ph�n th��ng, ph�n th��ng c� th� l� L�nh b�i g�i Boss, V� th�n �n v� qu� Huy Ho�ng cao c�p, th� h�ng c�ng cao th� ph�n th��ng c�ng nhi�u.",
	 	3, "Bang h�i ta ��t �� �i�u ki�n, mu�n nh�n ph�n th��ng/LUP_GetPrice", "Ta mu�n xem n�i dung ph�n th��ng/#LUP_PriceInfo(nil)", "Bi�t r�i/tong_cancel")	
end

function LUP_PriceInfo(nLevel, nOrder)
	if (nLevel == nil) then		
		Say("H�y l�a ch�n", 4, "Ph�n th��ng khi ��ng c�p ki�n thi�t ��t c�p 2/#LUP_PriceInfo(2)", "Ph�n th��ng khi ��ng c�p ki�n thi�t ��t c�p 4/#LUP_PriceInfo(4)",
			 "Quay l�i/LUP_HelpInfo", "R�i kh�i/tong_cancel")
	elseif nOrder == nil then
		local S = {i = 0, l = nLevel}
		function S:GenParam()
			self.i = self.i+1
			return "h�ng th� "..self.i.."ph�n th��ng/#LUP_PriceInfo("..self.l..","..self.i..")"
		end
		Say("H�y l�a ch�n", 9, S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(),
			"Quay l�i/#LUP_PriceInfo(nil)", "R�i kh�i/tong_cancel")
	else
		Say("Bang h�i c� th� nh�n ���c <color=yellow>L�nh b�i g�i Boss c�p 10<color><color=green> "..aTongLevelUpPrice[nLevel][nOrder][1].." <color>c�i, <color=yellow>V� Th�n �n<color>(Sau khi s� d�ng, trong 2 gi� �i�m c�ng hi�n nh�n ���c s� nh�n ��i)<color=green> "..aTongLevelUpPrice[nLevel][nOrder][2].." <color> c�i, <color=yellow>qu� Huy Ho�ng cao c�p<color><color=green> "..aTongLevelUpPrice[nLevel][nOrder][3].." <color> qu�.",2,
			"Quay l�i/#LUP_PriceInfo("..nLevel..",nil)", "R�i kh�i/tong_cancel")
	end
end

function LUP_PriceInfo2()
	Say("", 4, "Ph�n th��ng khi ��ng c�p ki�n thi�t ��t c�p 2/LUP_PriceInfo2", "Ph�n th��ng khi ��ng c�p ki�n thi�t ��t c�p 2/LUP_PriceInfo4",
		 "Quay l�i/LUP_HelpInfo", "R�i kh�i/tong_cancel")
end

function LUP_GetPrice()
	local _,nTongID = GetTongName();
	local figure = TONGM_GetFigure(nTongID, GetName())
	--������ǰ���
	if (figure ~= TONG_MASTER) then
		Say("Th�t ��ng ti�c, ch� c� bang ch� m�i c� th� nh�n ph�n th��ng.", 0)
		return
	end
	local nLevel = TONG_GetBuildLevel(nTongID)
	local nOrder = TONG_GetTaskValue(nTongID, TONGTSK_LUP_ORDER)
	if (nLevel >= 4)then
		nLevel = 4
	else
		nLevel = 2
	end
	if nOrder <=0 or nOrder > 7 then
		Say("Kh�ng ���c r�i, bang h�i kh�ng l� 1 trong <color=red>7<color> bang ��u ti�n th�ng ��n c�p "..nLevel..", kh�ng th� nh�n th��ng.", 0)
		return
	end
	local nPrice = TONG_GetTaskValue(nTongID, TONGTSK_LUP_PRICE)
	local nBossFu, nContributionPie, nFruit
	local szOrder = "Qu� bang l� bang h�i th� <color=red>"..nOrder.."<color> th�ng ��n c�p <color=yellow>"..nLevel.."<color>."
	if (nPrice == 0)then
		Say(szOrder..", ph�n th��ng �� nh�n h�t r�i.", 0)
		return
	elseif (nPrice < 0) then --û�����
		nBossFu = aTongLevelUpPrice[nLevel][nOrder][1]
		nContributionPie = aTongLevelUpPrice[nLevel][nOrder][2]
		nFruit = aTongLevelUpPrice[nLevel][nOrder][3]
	else
		nBossFu = floor(mod(nPrice, 1000))
		nPrice = floor(nPrice/1000)
		nContributionPie = mod(nPrice, 1000)
		nPrice = floor(nPrice/1000)
		nFruit = nPrice
	end
	local tbSel = {}
	if (nBossFu > 0)then
		tinsert(tbSel, "Nh�n tr��c "..nBossFu.." c�i l�nh b�i g�i Boss c�p 10/#LUP_GivePrice(1,"..nBossFu..")")
	end
	if (nContributionPie >= 1 and nContributionPie < 20)then
		tinsert(tbSel, "l�nh"..nContributionPie.." c�i V� Th�n �n/#LUP_GivePrice(2,"..nContributionPie..")")
	elseif (nContributionPie >= 20)then
		tinsert(tbSel, "Nh�n tr��c 20 c�i V� Th�n �n/#LUP_GivePrice(2, 20)")
		if (nContributionPie >= 40)then
			tinsert(tbSel, "Nh�n tr��c 40 c�i V� Th�n �n/#LUP_GivePrice(2, 40)")
			if (nContributionPie >= 60)then
				tinsert(tbSel, "Nh�n tr��c 60 c�i V� Th�n �n/#LUP_GivePrice(2, 60)")
			end	
		end
	end
	if (nFruit >= 1 and nFruit < 20)then
		tinsert(tbSel, "l�nh"..nFruit.." qu� Huy Ho�ng cao c�p/#LUP_GivePrice(3,"..nFruit..")")
	elseif (nFruit >= 20)then
		tinsert(tbSel, "Nh�n tr��c 20 qu� Huy Ho�ng cao c�p/#LUP_GivePrice(3, 20)")
		if (nFruit >= 40)then
			tinsert(tbSel, "Nh�n tr��c 40 qu� Huy Ho�ng cao c�p/#LUP_GivePrice(3, 40)")
			if (nFruit >= 60)then
				tinsert(tbSel, "Nh�n tr��c 60 qu� Huy Ho�ng cao c�p/#LUP_GivePrice(3, 60)")
			end	
		end
	end	
	tinsert(tbSel, "T�m th�i ch�a l�y/tong_cancel")
	Say(szOrder..", hi�n t�i c� <color=yellow>"..nBossFu.."<color> c�i <color=yellow>L�nh b�i g�i Boss c�p 10<color>, <color=yellow>"..nContributionPie.."<color> c�i <color=yellow>V� Th�n �n<color> v� <color=yellow> "..nFruit.."<color> <color=yellow>qu� Huy Ho�ng cao c�p<color> c� th� nh�n, h�y quy�t ��nh xem l�n n�y mu�n nh�n g� v� s� l��ng bao nhi�u", 
		getn(tbSel), tbSel)
end

function LUP_GivePrice(nWhich, num)
	local aName = {"L�nh b�i g�i Boss c�p 10", "V� Th�n �n", "Qu� Huy Ho�ng (cao) "}
	Say("�� nh�n tr��c <color=yellow>"..num.."<color> <color=yellow>"..aName[nWhich].."<color>, h�y b�o ��m h�nh trang �� ch� tr�ng, n�u c� r�t ra ��t b� ng��i kh�c nh�t ���c c�ng ��ng tr�ch ta kh�ng nh�c nh�.", 
		2, "Ta bi�t r�i!/#LUP_GivePrice_OK("..nWhich..","..num..")", "H�y ��i ta x�p l�i h�nh trang ��./tong_cancel")
end

function LUP_GivePrice_OK(nWhich, num)
	local _,nTongID = GetTongName();	
	local nLevel = TONG_GetBuildLevel(nTongID)
	local nOrder = TONG_GetTaskValue(nTongID, TONGTSK_LUP_ORDER)
	if (nLevel >= 4)then
		nLevel = 4
	else
		nLevel = 2
	end
	if nOrder <=0 or nOrder > 7 then
		Say("Th�t ��ng ti�c, qu� bang kh�ng thu�c 1 trong 7 bang ��ng ��u ��t c�p "..nLevel..", kh�ng th� nh�n th��ng.", 0)
		return
	end
	local nPrice = TONG_GetTaskValue(nTongID, TONGTSK_LUP_PRICE)
	local nBossFu, nContributionPie, nFruit
	local szOrder = "Qu� bang l� bang h�i th� <color=red>"..nOrder.."<color> th�ng ��n c�p <color=yellow>"..nLevel.."<color>."
	if (nPrice == 0)then
		Say(szOrder..", ph�n th��ng �� nh�n h�t r�i.", 0)
		return
	elseif (nPrice < 0) then --û�����
		nBossFu = aTongLevelUpPrice[nLevel][nOrder][1]
		nContributionPie = aTongLevelUpPrice[nLevel][nOrder][2]
		nFruit = aTongLevelUpPrice[nLevel][nOrder][3]
	else
		nBossFu = floor(mod(nPrice, 1000))
		nPrice = floor(nPrice/1000)
		nContributionPie = mod(nPrice, 1000)
		nPrice = floor(nPrice/1000)
		nFruit = nPrice
	end
	if nWhich == 1 then
		if (nBossFu < num)then
			return
		end
		nBossFu = nBossFu - num
		--�����ٻ���
		for i = 1,num do
			AddItem(6,1,1022,10,0,0,0)
		end
		local szMsg = GetName().."Nh�n ph�n th��ng th�ng c�p bang h�i: L�nh b�i g�i Boss c�p 10"..num.."c�i"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
	elseif nWhich == 2 then
		if (nContributionPie < num)then
			return
		end
		nContributionPie = nContributionPie - num
		--��������֮ӡ(һ������Ч)
		local ntime = GetCurServerTime() + 7 * 24 * 3600;
		local nTimeParam = tonumber(FormatTime2String("%y%m%d",ntime))	
		for i = 1,num do
			local idx = NewItemEx(4,0,0,6,1,1264,1,1,1)
			SetSpecItemParam(idx, 1, ntime);
			SetSpecItemParam(nItemIdx, 2, tonumber(FormatTime2String("%y",ntime)));
			SetSpecItemParam(nItemIdx, 3, tonumber(FormatTime2String("%m",ntime)));
			SetSpecItemParam(nItemIdx, 4, tonumber(FormatTime2String("%d",ntime)));
			if AddItemByIndex(idx) <= 0 then
				print("Can Not AddItem To Player: jitan.lua\n", idx)
				RemoveItemByIndex(idx)
			end
		end
		local szMsg = GetName().."Nh�n ph�n th��ng th�ng c�p bang h�i: V� Th�n �n"..num.."c�i"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)		
	elseif nWhich == 3 then
		if nFruit < num then
			return
		end
		nFruit = nFruit - num
		local ntime = tonumber(date("%y%m%d"));
		--�����߼��Ի�֮��
		for i = 1,num do
			local idx = NewItemEx(4,0,0,6,1,906,1,1,1)
			SetSpecItemParam(idx, 1, ntime);
			if AddItemByIndex(idx) <= 0 then
				print("Can Not AddItem To Player: jitan.lua\n", idx)
				RemoveItemByIndex(idx)
			end
		end
		local szMsg = GetName().."Nh�n ph�n th��ng th�ng c�p bang h�i: qu� Huy Ho�ng cao c�p"..num.."c�i"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
	end	
	TONG_ApplySetTaskValue(nTongID, TONGTSK_LUP_PRICE, 1000 * 1000 * nFruit + 1000 * nContributionPie + nBossFu)
end

function tong_cancel()
end

