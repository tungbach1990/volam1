-- �嶾 ·��NPC ���������ɾ� ��ʦ�����ط���������
-- by��Dan_Deng(2003-08-05)
-- Update��Dan_Deng(2003-10-27)��д�ط�ʦ�����񣬲���������ű�

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ����Ͷʦ
--dinhhq: new lunar year 2011
Include("\\script\\vng_event\\LunarYear2011\\npc\\mastergift.lua")

function main()
	if tbVNG_LY2011:isActive() == 1 then
		local tbSay = 
			{
				"T�ng b�nh ng�y xu�n/#tbMasterGift:getGift('wudu')",
				"Mu�n th�nh gi�o vi�c kh�c/oldMain"
			}
		Say("N�m m�i an khang th�nh v��ng", getn(tbSay), tbSay)
		return
	end
	oldMain()
end
function oldMain()
	if allbrother_0801_CheckIsDialog(4) == 1 then
		allbrother_0801_FindNpcTaskDialog(4)
		return 0;
	end
	if (vt06_isactive() ~= 0) then
		Say("T�m ta c� vi�c g�?", 2, "Mu�n th�nh gi�o ��i s�!/oldentence", "M�ng l� �n S�, t�i h� �� t�m �� �Th� �n S�� v� �Th� Cao ��./vt06_prizeenter");
		return
	end;
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 3) then
		Describe("T�m ta c� vi�c g�?", 2,
			"H�c k� n�ng c�p 120./lvl120skill_learn",
			"Mu�n th�nh gi�o vi�c kh�c/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_wu = GetTask(10)
	local nFactID = GetLastFactionNumber();

	if (UTask_wu == 70*256) and (GetFaction() == "wudu") then			-- ��ʦ��������
		SetFaction("")
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_wu == 70*256) and (GetTask(2) >= 5*256) and (GetTask(2) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(2,0)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_wu == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(10,70*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (GetTask(2) == 70*256) and (GetTask(10) == 70*256) then			-- ת���ɴ�������
		SetTask(2,75*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_wu == 80*256 and nFactID == 3 and GetCamp() == 2 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("wudu");
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	elseif (UTask_wu == 70*256 and nFactID == 3 and GetCamp() ~= 4 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	end
	
	local tbDes = {"��i ngh� ��u s�/#daiyitoushi_main(3)", "Mu�n th�nh gi�o vi�c kh�c/common_talk"};
	
	
	Say("G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_wu = GetTask(10)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),10) == 0) then				-- ��������������
		Talk(1,"","��c C� Ki�m mu�n li�n T�ng ch�ng Kim? C� g� hay ho ch�? B�n gi�o v� Kim qu�c v�n l� ch� li�n minh m�t thi�t. C�c ng��is�c y�u th� c� nh� v�y li�u c� ���ng c� n�i kh�ng")
		Uworld40 = SetBit(GetTask(40),10,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 60*256+20) and (HaveItem(222) == 1) then		-- ���������
			Talk(2,"L60_prise","Thu�c h� �� �o�t l�i b�o v�t c�a gi�o ph�i, xin tr�i ch� xem th�!","Gi�i! Hay l�m! C�c k� gi�i Qu� nhi�n ng��i �� kh�ng ph� s� k� v�ng c�a ta. Th�t kh�ng h� danh c�a 'ng� ��c gi�o ph�i',V�y l� ng��i c� th� thu�n l�i xu�t s� r�i! Ng�y sau n�u c� vang danh v� l�m, th� ��ng qu�n nh�c ��n t�n c�a b�n gi�o nh� ")
		elseif (UTask_wu == 60*256) and (GetLevel() >= 50) then		--��ʦ����
			Say("B�n gi�o v� Nh�n ��ng ph�i v�n kh�ng ��i tr�i chung. 10 n�m tr��c b�n gi�o v� Nh�n ��ng ph�i �� ti�n h�nh m�t cu�c �c chi�n. B�n gi�o �� b� �m to�n. T�ch ��c Chu c�a b�n gi�o �� b� Nh�n ��ng ph�i c��p �i. B�n ch�ng �� �em v� ��ng D��ng Gi�c � Nh�n ��ng s�n. Chuy�n n�y ��n n�y v�n c�n l� m�i tr�n tr� c�a ta. Ng�y n�o ch�a l�y ���c n� v� th� ta ch�a th� an l�ng. N�u nh� ng��i mu�n xu�t s� th� l�i �i �o�t l�i T�ch ��c Chu v� ��y cho ta",2,"Thu�c h� s� �em h�t t�m s�c c�a m�nh �� mang ���c b�u v�t c�a b�n m�n v� /L60_get_yes","�� t� t�i m�n s�c k�m. Ch� e kh�ng ho�n th�nh ���c nhi�m v� n�y! /no")
		elseif (UTask_wu == 80*256) then						-- �ط�������ɳ���
			Say("Ng��i �ang mu�n xu�t s� ph�i kh�ng? ��ng l�c! H�y cho gi�i v� l�m � Trung Nguy�n th�y ���c s� l�i h�i c�a �� t� b�n m�n ",2,"D�! �a t� gi�o ch�! /goff_yes","�� t� t� th�y m�nh v� ngh� v�n ch�a ��, e r�ng s� ph� l�ng c�a gi�o ch�! /no")
		else
			Talk(1,"","��ng c� qu� coi tr�ng c�i b�n C�i Bang t� x�ng l� V� L�m �� nh�t bang ph�i kia, Thi�u L�m m�i ch�nh l� thi�n h� �� nh�t m�n ph�i! H�,cho d� l� �� nh�t cao th� c�ng kh� m� ��ch n�i v�i ��c d��c tuy�t ph�m c�a ta")
		end
--	elseif (UTask_wu == 5*256+20) then			-- ת�������
--		Talk(1,"defection_complete","�����ɾ����������������Һúøɣ��ٻ������ٲ�����ģ�")
--	elseif (GetSeries() == 1) and (GetTask(2) == 5*256+10) and (HaveMagic(76) >= 0) then		-- ��ʦ�����ţ�����嶾���ջ�ȫ������
--		Say("�����ɾ����������ţ��ѵ������书������ǿ���㾹Ȼ��Ͷ�����ţ�",2,"����ֻ����͵ѧ���ž�����Ϊ���̹��/defection_yes","�Բ��𣬵���֪����/no")
	elseif (GetSeries() == 1) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_wu == 70*256) and ((GetTask(2) < 5*256) or (GetTask(2) == 75*256)) then		-- �ط�ʦ������
		Say("Ng��i mu�n tr� l�i b�n gi�o? Chuy�n n�y n�i l�n th� l� l�n, m� n�i nh� th� l� nh�. Ch� c�n ng��i n�m r� ���c nh�ng quy lu�t th� c� th� quy�t ��nh. ",2,"Xin gi�o ch� chi�u c� /return_yes","Xin cho ph�p �� t� suy ngh� th�m m�t ch�t /no")
	elseif (GetCamp() == 4) and ((UTask_wu == 70*256+10) or (UTask_wu == 70*256+20)) then			-- �ط������С�����Ϊ70*256+20��������70*256+10��ֵ
		Say("Nh�ng �i�u ng��i �� n�i ��, �� chu�n b� xong ch�a",2,"Chu�n b� xong r�i /return_complete","Xin h�y cho �� t� th�m m�t �t th�i gian n�a /return_uncompleted")
	else							-- ����Ի�
		Talk(1,"","Cho ph�p �� t� trong b�n ph�i t� h� ��c l�n nhau l� n�i ��nh c�a b�n ph�i. K� n�o c��ng l�c h�n th� s� t�n t�i")
	end
end;

---------------------- ���ܵ������ ------------------------
--function check_skill()
--	x = 0
--	skillID = 61					-- �嶾����
--	i = HaveMagic(skillID)
--	if (i >= 0) then
--		x = x + 1
--		DelMagic(skillID)
--		AddMagicPoint(i)
--	end
--	if (x > 0) then		-- ���м��ܷ����仯���������ߣ����򷵻ؼ�������
--		Say("�����ɾ���Ϊʦ��αչؿ�˼���գ���������������һ�����٣����ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	else
--		return
--	end
--end

--------------------- ת������� ------------------------
function defection_complete()
	Msg2Player("Hoan ngh�nh b�n gia nh�p Ng� ��c gi�o, ng��i �� tr� th�nh Ng� ��c ��ng T� r�i ")
	SetRevPos(183,70)		  			--����������
	SetTask(10,10*256)				-- ����
	SetFaction("wudu")       	--��Ҽ�������
	SetCamp(2)
	SetCurCamp(2)
	SetRank(49)
	AddMagic(63)
	Msg2Player("H�c ���c ��c Sa Ch��ng ")
	AddNote("Gia nh�p Ng� ��c gi�o, Tr� th�nh Ng� ��c ��ng t�, h�c ���c ��c Sa Ch��ng ")
	Msg2Faction("wudu",GetName().." t� ���ng M�n ��n gia nh�p Ng� ��c gi�o. L�c l��ng b�n ph�i �� m�nh l�i c�ng m�nh!",GetName())
end

--------------------- �ط�������� ----------------------
function goff_yes()
	Talk(1,"","���c! Xu�t s� r�i ��ng l�m cho danh ti�ng c�a b�n ph�i b� � danh trong v� l�m nh� ")
	SetTask(10,70*256)
	AddNote("R�i Ng� ��c gi�o, ti�p t�c chu du giang h� ")
	Msg2Player("B�n r�i Ng� ��c gi�o, ti�p t�c chu du giang h� ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_yes()
	Talk(3,"","� ��y �� t� c� 50000 l��ng ng�n l��ng. xin gi�o ch� ti�p nh�n","T�t l�m! Ng��i �� c� th�nh � nh� v�y, ta c�ng kh� m� t� ch�i","Xin cho ph�p �� t� �i chu�n b� v�i th�. ")
	SetTask(10,70*256+20)
	AddNote("Giao n�p 50000 ng�n l��ng th� c� th� tr� l�i Ng� ��c Gi�o ")
	Msg2Player("Giao n�p 50000 ng�n l��ng th� c� th� tr� l�i Ng� ��c Gi�o ")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","�y! Ng��i b�y gi� �� l� �� t� c�a b�n gi�o r�i! Ta s� �� b�t ng��i l� U Minh Qu� V��ng ")
		Pay(50000)
		SetTask(10,80*256)
		SetRank(80)
--		if (HaveMagic(75) == -1) then
--			AddMagic(71)
--			AddMagic(74)
--			AddMagic(75)
		add_wu(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("B�n h�c ���c tuy�t h�c tr�n ph�i; Ng� ��c k� Kinh, V� c�ng Thi�n C��ng ��a S�t. Chu C�p Thanh Minh ")
--		end
		SetFaction("wudu")
		SetCamp(2)
		SetCurCamp(2)
		AddNote("�� quay tr� l�i Ng� ��c Gi�o, ti�p t�c t�p luy�n v� ngh� ")
		Msg2Player(GetName().."�� quay tr� l�i Ng� ��c Gi�o, ���c phong l�m U Minh qu� V��ng. ")
	else
		Talk(2,"","�� mu�n xu�t s� r�i, nh�ng r� r�ng l� ng��i ch�a chu�n b� g� c�!","Xin l�i! �� ta ki�m tra l�i.")
	end
end;

function return_uncompleted()
	Talk(1,"","Mau L�n!")
end;

---------------------- ����������� ---------------------
function L60_get_yes()
	SetTask(10,60*256+10)
	AddNote("�o�t l�i T� ��c Chu b�o b�i c�a ch�nh ph�i v�n �� b� Nh�n ��ng ph�i c��p �i ")
	Msg2Player("�o�t l�i T� ��c Chu b�o b�i c�a ch�nh ph�i v�n �� b� Nh�n ��ng ph�i c��p �i ")
end;

function L60_prise()
	Talk(1,"","Thu�c h� kh�c c�t ghi t�m. Tuy�t kh�ng d�m qu�n")
	SetTask(10,70*256)
	DelItem(222)
	SetRank(70)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("�o�t l�i T� ��c Chu t� tay c�a Nh�n ��ng ph�i, tr� l�i cho Ng� ��c Gi�o. Ho�n th�nh nhi�m v� xu�t s�. ���c phong l� U Minh Qu� S�, thu�n l�i xu�t s� ")
	Msg2Player("Ch�c m�ng B�n! �� th�nh c�ng xu�t s�. B�n �� ���c phong l� U Minh Qu� S� ")
end;

function no()
end;
