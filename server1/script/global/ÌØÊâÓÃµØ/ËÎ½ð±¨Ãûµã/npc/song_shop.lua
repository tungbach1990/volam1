
-- �ν�����	�ξ������
-- lixin 2004-12-13
IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\weeklyrank.lua")
Include("\\script\\task\\system\\task_string.lua");

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\global\\�����õ�\\�ν�����\\npc\\head.lua")
Include("\\script\\global\\�����õ�\\�ν�����\\npc\\songjin_shophead.lua")

Include("\\script\\global\\global_tiejiang.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\battles\\vngbattlesign.lua")

--�i�u ch�nh �i�m kinh nghi�m gi�i h�n khi ��i �i�m t�ch lu� - Modified by DinhHQ - 20110810
--Limit_Exp = 550000
--Limit_Exp = 700000
tbLimit_Exp = {
						[0] = 1000000,
						[3] = 1500000,
						[4] = 2000000, 
						[5] = 2000000,
						[6] = 2000000, 
					};
YUEWANGHUN_STONECOUNT = 100
nState = 0;

function main(sel)
	local nWorld, _, _ = GetWorldPos()
	-- if nWorld ~= 162 then
	-- 	Talk(1, "", "Ch�c n�ng �� ��ng.")
	-- 	return
	-- end
	nOldSW = SubWorld
	SubWorld = SubWorldID2Idx(325)
	if (nState == 0) then
		bt_setnormaltask2type()
		nState = 1;
	end
	battlemapid = BT_GetGameData(GAME_MAPID);
	
	--��ǰû���κ�ս�۴���
	if (battlemapid <= 0) then
			maintalk()
			return 
	end
	SyncTaskValue(747);--ͬ����ҵ��ܻ��ָ��ͻ��ˣ����ڻ��ֹ�����
	battlemap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	if (battlemap < 0) then
		Msg2Player("error"..battlemap)
		return
	end
	
	tempSubWorld = SubWorld;
	SubWorld = battlemap
	state = GetMissionV(MS_STATE);
	
	if (state == 0 or state == 1) then
		maintalk()
		SubWorld = tempSubWorld;
		return
	else
		Talk(1,"","Qu�n Nhu quan: Chi�n tranh �ang di�n ra �c li�t ph�a tr��c, c�c v� n�n t�m l�nh m�t ch�t!")
		SubWorld = tempSubWorld;
		return
	end;
	SubWorld = nOldSW;	
end;

function no()
end;

function songshop_sell()
		Sale(98, 4);			
end;

--str1 = "�ξ�����٣����ͬΪ�����������Ȼ������Ч���ң�������ܣ�����������������ν����<color=yellow>��ȡ���顢������֮ʯ<color>�������Թ���<color=yellow>�ν�ר�õ���<color>��"
--str2 = "���������������֮ʯ�Ļ�������������������������Ŷ��"
function maintalk()
	
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	--�����Ի���
	tbDailog.szTitleMsg = format("Qu�n Nhu Quan: Hi�n t�i ng��i c� <color=yellow>%d<color> �i�m t�ch l�y, c� mu�n mua g� kh�ng?", GetTask(747))
	tbDailog:AddOptEntry("Ta mu�n mua ��o c�", songshop_sell)
	--tbDailog:AddOptEntry("Ta mu�n ��i �i�m kinh nghi�m", exp_exchange)
	tbDailog:AddOptEntry("S� d�ng Nh�c V��ng H�n Th�ch �� ��c luy�n Nh�c V��ng Ki�m", yuewang_want)
	--tbDailog:AddOptEntry("Chi�n tr��ng v� song m�nh t��ng",wushuangmengjiang)--��˫�ͽ�
	--tbDailog:AddOptEntry("C�a h�ng tinh l�c", energy_sale)
	--tbDailog:AddOptEntry("��i B� B�o", duihuangmibao)
	--T�m ��ng ki�m gia m� cung - Modified by DinhHQ - 20110810
	--tbDailog:AddOptEntry("D�ng Nh�c V��ng H�n Th�ch ��i l�y Ng�c Long Anh H�ng Thi�p", talk_yulongtie)
	--tbDailog:AddOptEntry("B�ng T�ng Kim Long H�", sj_GetRankTop10)
	
	tbDailog:Show()
end

function xunzhang_exchange()
	if( GetLevel() < 40 ) then
		Talk( 1, "", "Qu�n Nhu Quan: Ch� c� ng��i ch�i c�p t� 50 tr� l�n m�i c� th� nh�n Huy ch��ng .");
		return 0
	elseif ( GetExtPoint(0)==0 ) then
		Talk( 1, "", "Qu�n Nhu Quan: Ch� c� ng��i ch�i �� n�p th� m�i c� th� nh�n Huy ch��ng .");
		return 0
	elseif ( CalcFreeItemCellCount() < 1 ) then
		Talk( 1, "", "H�y chu�n b� 1 � tr�ng �� ��t v�o 1 Huy ch��ng");
		return 0;
	else
		Say("Qu�n Nhu Quan: Ng��i c� mu�n d�ng 500 �i�m t�ch l�y �� ��i l�y Huy ch��ng kh�ng?", 2,"��i l�y Huy ch��ng/xunzhang_do", "Hi�n t�i kh�ng mu�n ��i/no");
	end
end

function xunzhang_do()
	if nt_getTask(747) < 500 then
		Say("�i�m t�ch l�y kh�ng �� 500, kh�ng th� nh�n Huy ch��ng",0);
		return 0;
	end
	nt_setTask(747, floor(nt_getTask(747) - 500));
	local nidx = AddItem(6,1,1412,1,0,0) --����ν�ѫ��
	WriteLog(format("[GetZhanGongXunZhang]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s Del:500SongJinJiFen\t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	Say("�� nh�n th�nh c�ng 1 Huy ch��ng",0);
end

function exp_exchange()
	--Say("�������ݲ����ţ������ڴ���", 0 )
	if( GetLevel() < 40 ) then
		Talk( 1, "", "Qu�n Nhu quan: B�n ch�a ��t ���c c�p 40, kh�ng th� tham gia chi�n tr��ng, sao c� th� l�y �i�m t�ch l�y ��i �i�m kinh nghi�m?");
	else
		if (GetTiredDegree() == 2) then
			Say("Qu�n Nhu Quan: �ang � tr�ng th�i m�t m�i, kh�ng th� ��i �i�m kinh nghi�m.",0);
		else
			local tbOpt = 
			{
				"500 �i�m t�ch l�y/#wantpay(500)", 
				"1000 �i�m t�ch l�y/#wantpay(1000)",
				 "2000 �i�m t�ch l�y/#wantpay(2000)",
				  "5000 �i�m t�ch l�y/#wantpay(5000)",
				   "T�t c� �i�m t�ch l�y/#wantpay(9999)",
				   "Hi�n t�i kh�ng mu�n ��i/no"
			}
			local nDate = tonumber(GetLocalDate("%Y%m%d"))
			local nHM	= tonumber(GetLocalDate("%%H%M"))
			
			
			if  20090925 <= nDate and  nDate <= 20091101 then
			--	tinsert(tbOpt, 5, format("%d�����/#wantpayex(%d,%d)",80000,80000,0))
			end
			--��ڼ�(2009/09/25��2009/11/01)��12h30 �� 23h30
			
			Say("Qu�n Nhu quan: B�n mu�n t�n bao nhi�u �i�m t�ch l�y �� ��i �i�m kinh nghi�m?", getn(tbOpt), tbOpt);
		end;
	end
end;

function wantpayex(mark, nStep)
	
	if GetLevel() < 120 then
		Talk(1, "", format("Y�u c�u c�n %d c�p tr� l�n m�i c� th� ��i.", 120))
		return 
	end
	
	if PlayerFunLib:CheckTaskDaily(2645, 1, "Ph�n th��ng n�y m�i ng�y ch� c� th� nh�n 1 l�n.", "<") ~= 1 then
		return
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
				
	if gb_GetTask("songjin butianshi2009", 1) ~= nDate then
		gb_SetTask("songjin butianshi2009", 1, nDate)
		gb_SetTask("songjin butianshi2009", 2, 0)
	end
	
	if gb_GetTask("songjin butianshi2009", 2) >= 10 then
		Talk(1, "", "M�i ng�y m�i server, 10 ng��i nhanh nh�t m�i c� th� ��i ph�n th��ng n�y.")
		return 
	end
	
	if( mark > nt_getTask(747) ) then
		Say("Qu�n Nhu quan: �i�m t�ch l�y c�a b�n kh�ng ��, mu�n nh�n ���c �i�m kinh nghi�m", 1, "��ng/no");
	elseif (mark == 0) then
		Say("Qu�n Nhu quan: Kh�ng c� �i�m t�ch l�y m� mu�n ��i �i�m kinh nghi�m �h, ��ng l� chuy�n hoang ���ng.", 1, "��ng/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		
		local tbItem = {szName="M�nh B� Thi�n Th�ch (trung)", tbProp={6, 1, 1309, 1, 0, 0}}
		if nStep == 1 then
			if (expchange_limit(mark) == 1) then
				nt_setTask(747, floor(nt_getTask(747) - mark))
				AddOwnExp( bonus);
				--Add120SkillExp(bonus);
				
				tbAwardTemplet:GiveAwardByList(tbItem, "MidAutumn,GetItemFromSongjin")
				gb_AppendTask("songjin butianshi2009", 2, 1)
				PlayerFunLib:AddTaskDaily(2645, 1)	
				Msg2Player("<#>B�n �� t�n"..mark.."<#>�i�m t�ch l�y, ��i l�y"..bonus .."<#>�i�m kinh nghi�m.");
				WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: �� t�n"..mark.."�i�m t�ch l�y, ��i l�y"..bonus.."�i�m kinh nghi�m.");
			end
			
			
			
		elseif nStep == 0 then
			Say("Qu�n Nhu quan: B�n c� th� ��i ���c"..bonus.."�i�m kinh nghi�m, x�c ��nh ��i ph�i kh�ng?", 2, "��ng, ta c�n ��i/#wantpayex("..mark..",1"..")", "Uhm, �� ta suy ngh� l�i!/no")	
		end
		
	end	
end
function wantpay(mark)
	if (mark == 9999) then		--��ȡ���л���
		mark = nt_getTask(747)
	end
	
	if( mark > nt_getTask(747) ) then
		Say("Qu�n Nhu quan: �i�m t�ch l�y c�a b�n kh�ng ��, mu�n nh�n ���c �i�m kinh nghi�m", 1, "��ng/no");
	elseif (mark == 0) then
		Say("Qu�n Nhu quan: Kh�ng c� �i�m t�ch l�y m� mu�n ��i �i�m kinh nghi�m �h, ��ng l� chuy�n hoang ���ng.", 1, "��ng/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		Say("Qu�n Nhu quan: B�n c� th� ��i ���c"..bonus.."�i�m kinh nghi�m, x�c ��nh ��i ph�i kh�ng?", 2, "��ng, ta c�n ��i/#paymark("..mark..")", "Uhm, �� ta suy ngh� l�i!/no")
	end	
end

function paymark(mark)
	if (mark == 9999) then		--��ȡ���л���
		mark = nt_getTask(747)
	end
	
	if( mark > nt_getTask(747) ) then
		Say("Qu�n Nhu quan: �i�m t�ch l�y c�a b�n kh�ng ��, mu�n nh�n ���c �i�m kinh nghi�m", 1, "��ng/no");
	elseif (mark == 0) then
		Say("Qu�n Nhu quan: Kh�ng c� �i�m t�ch l�y m� mu�n ��i �i�m kinh nghi�m �h, ��ng l� chuy�n hoang ���ng.", 1, "��ng/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		if (expchange_limit(mark) == 1) then
			nt_setTask(747, floor(nt_getTask(747) - mark))
			AddOwnExp( bonus);
		--	Add120SkillExp(bonus);
			Msg2Player("<#>B�n �� t�n"..mark.."<#>�i�m t�ch l�y, ��i l�y"..bonus .."<#>�i�m kinh nghi�m.");
			WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: �� t�n"..mark.."�i�m t�ch l�y, ��i l�y"..bonus.."�i�m kinh nghi�m.");
		end
	end
end


function expchange_limit(cost)
	--local ww = tonumber(date("%W"))
	--local yy = tonumber(date("%Y")) - 2000
	local nNumber = tbVNG2011_ChangeSign:GetTransLife()	
	local Limit_Exp = tbLimit_Exp[nNumber]
	if((nt_getTask(1017) + cost) <= Limit_Exp) then
		nt_setTask(1017, nt_getTask(1017) + cost)
		return 1
	else
		Say("Qu�n Nhu quan: ��ng tham lam nh� v�y, trong m�t tu�n kh�ng th� ��i qu�<color=red>"..Limit_Exp.."<color>�i�m kinh nghi�m c�a t�ch l�y", 0)
		return -1
	end
end

function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- ͬ�����ͻ���
end

-- ��ȡ����״̬
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

function person_change()
	Say("Qu�n Nhu quan: T�i<color=yellow> b�ng b�nh ph�m x�p h�ng <color>x�p h�ng<color=yellow> 5 t�n<color> ng��i ch�i ��u ti�n s� nh�n ���c danh hi�u ��c bi�t v� h�nh t��ng oai phong", 3, "Xem h�nh t��ng nh�n v�t nam T�ng Kim/title_male","Xem h�nh t��ng nh�n v�t n� T�ng Kim/title_female","Kh�ng mu�n xem ��u!/no" )
end;

function title_male()
	Describe("<link=image:\\spr\\npcres\\enemy\\enemy208\\enemy208_at.spr>H�nh t��ng nh�n v�t nam T�ng Kim<link>B�nh ph�m nh�n v�t nam c� t�n 5 ng��i trong b�ng x�p h�ng s� nh�n ���c h�nh t��ng t��ng �ng", 1, "��ng/no" );
end

function title_female()
	Describe("<link=image:\\spr\\npcres\\enemy\\enemy207\\enemy207_at.spr>H�nh t��ng nh�n v�t n� T�ng Kim<link>B�nh ph�m nh�n v�t n� c� t�n 5 ng��i trong b�ng x�p h�ng s� nh�n ���c h�nh t��ng t��ng �ng", 1, "��ng/no" );
end

function effect_aura()
	Say("Qu�n Nhu quan: T�i<color=yellow> b�ng b�nh ph�m x�p h�ng <color>x�p h�ng <color=yellow>5 t�n<color> nh�n v�t ��u ti�n s� nh�n ���c ��c hi�u v�ng tr�n ��c bi�t", 6, "Xem ��nh Qu�c Nguy�n So�i ��c Hi�u/aura_dingguo","Xem An Bang ��i T��ng Qu�n ��c Hi�u/aura_anbang","Xem Phi�u K� T��ng Qu�n ��c Hi�u/aura_biaoji","Xem V� L�m Trung Lang ��c Hi�u/aura_yulin","Xem Chi�u V� Hi�u �y ��c Hi�u/aura_zhaowu","Kh�ng mu�n xem ��u!/no" );
end

function aura_dingguo()
	Describe("<link=image:\\spr\\skill\\others\\title_dg.spr>��nh Qu�c Nguy�n So�i ��c Hi�u<link>B�nh ph�m nh�n v�t x�p h�ng 1 trong b�ng x�p h�ng s� nh�n ���c ��c hi�u c�a v�ng tr�n", 1, "��ng/no" );
end

function aura_anbang()
	Describe("<link=image:\\spr\\skill\\others\\title_ab.spr>An Bang ��i T��ng Qu�n ��c Hi�u<link>B�nh ph�m nh�n v�t x�p h�ng 2 trong b�ng x�p h�ng s� nh�n ���c ��c hi�u c�a v�ng tr�n", 1, "��ng/no" );
end

function aura_biaoji()
	Describe("<link=image:\\spr\\skill\\others\\title_bj.spr>Phi�u K� T��ng Qu�n ��c Hi�u<link>B�nh ph�m nh�n v�t x�p h�ng 3 trong b�ng x�p h�ng s� nh�n ���c ��c hi�u c�a v�ng tr�n", 1, "��ng/no" );
end

function aura_yulin()
	Describe("<link=image:\\spr\\skill\\others\\title_yl.spr>V� L�m Trung Lang ��c Hi�u<link>B�nh ph�m nh�n v�t x�p h�ng 4 trong b�ng x�p h�ng s� nh�n ���c ��c hi�u c�a v�ng tr�n", 1, "��ng/no" );
end

function aura_zhaowu()
	Describe("<link=image:\\spr\\skill\\others\\title_zw.spr>Chi�u V� Hi�u �y ��c Hi�u<link>B�nh ph�m nh�n v�t x�p h�ng 5 trong b�ng x�p h�ng s� nh�n ���c ��c hi�u c�a v�ng tr�n", 1, "��ng/no" );
end

function yuewang_want()
	Say("Qu�n Nhu quan: T� nh�ng tinh hoa c� ���c trong Nh�c V��ng H�n Th�ch ta ch� t�o ra Nh�c V��ng Ki�m, c�n ph�i t�n"..YUEWANGHUN_STONECOUNT.."Vi�n Nh�c V��ng H�n Th�ch n�y x�c ��nh ��i ph�i kh�ng?", 2, "Mu�n/yuewang_change", "�� ta xem l�i/no")
end

function yuewang_change()
	Say("Qu�n Nhu quan: Nh�c V��ng Ki�m chi�m kh�ng gian trong h�nh trang l� <color=yellow>6 (2 X 3)<color>�, ng��i x�c ��nh c�n ch� tr�ng trong h�nh trang ch�a?", 2, "Mu�n/yuewang_sure", "�� ta x�p g�n h�nh trang ��/no")
end

function yuewang_sure()
	if (CalcEquiproomItemCount(4, 507, 1, -1) >= YUEWANGHUN_STONECOUNT) then
		ConsumeEquiproomItem(YUEWANGHUN_STONECOUNT, 4, 507, 1, -1)
		AddEventItem(195)
		Say("Qu�n Nhu quan: Thanh Nh�c V��ng Ki�m n�y r�t qu� b�u, ng��i ph�i bi�t t�n d�ng t�t ��y!", 0)
		Msg2Player("B�n nh�n ���c Nh�c V��ng Ki�m")
	else
		Say("Qu�n Nhu quan: Ng��i kh�ng c� nhi�u Nh�c V��ng H�n Th�ch, h�y ki�m tra l�i �i! Thanh Nh�c V��ng Ki�m kh�ng ph�i ng��i n�o c�ng c� ���c ��u.", 0)
	end
end

function ore()
	Sale( 102, 4);
end

function goldenitem_menu()
	Sale( 103, 4);
end
