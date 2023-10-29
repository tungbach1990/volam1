-- ��ɽ�� ��ɽС�� �Ի��ű�
-- ���� 2005-01-25

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\xishancun\\xishancun_head.lua")
Include("\\script\\task\\system\\task_string.lua"); 
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main()
--	Uworld1064 = nt_getTask(1064)
--	local name = GetName()
--	if	( Uworld1064 < 2) then  -- �ж�û�������ɽ������
--		Talk(1,"","��ɽС�����⼸�����������޳����Ҷ�û��˼���������ˡ�")
--	elseif ( Uworld1064 == 2 ) then   -- �ж��Ѿ��������ɽ�����񣬵���δȥ��ɽ�죬����δ����ɽС���Ի���
--		-- Say("��ɽС������Ҫȥ��ɽ�죿��ϧ��ɽ�컹û���ţ���ʱ���ܹ�ȥ����������ģ����Ѿ���ס���ˣ���Щ������ֱ�������Һ��ˣ��Ҵ�������ɽ�졣",0)
--		Describe(DescLink_XiShanXiaoEr.."<#>����λ�͹٣������кι�ɣ��ǲ���Ҫ�����أ�<enter>"
--		..name.."<#>�����ǵģ��ǲ�����ʿ����������ġ�<enter>��ɽС������������֪���ˡ���Ҳ��ȥ��ɽ��ɣ��߰ɣ�����ʹ���ȥ��������ɽ������ط���ȥ�ɲ�����ô���㣬���������쳣����Ҫ���С��Ӵ��<enter>",
--		2,"�������̰�/task007","�һ��ǹ�����ȥ��/task006")
--	elseif ( Uworld1064 == 3) then   -- �ж��Ѿ��������ɽ�������Һ���ɽС���Ի���һ�Σ�����δȥ��ɽ��
--		Say("��ɽС�����������Ѿ�׼����ȥ��ɽ������",2,"�������̰�/task007","�һ��ǹ�����ȥ��/task006");
--	 end;
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "T�y S�n ti�u nh�: ��i hi�p mu�n �i ��n Vi S�n ��o? Tr��c ti�n h�y giao n�p 100 m�nh M�t �� Th�n B� m�i c� th� �i ��n Vi S�n ��o ���c."
	

	tbDailog:AddOptEntry("��ng �! Ta s� t�m ngay.", task007, {}); 
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	
	tbDailog:Show();
	
end;
function task006()	
	Uworld1064 = nt_getTask(1064)
	nt_setTask(1064,3)
end;
	
function task007()
	if (GetLevel() < 100) then
		Say("T�y S�n ti�u nh�: D��i c�p 100 kh�ng th� �i Vi S�n ��o ���c!",0);
		return
	end
	
	GiveItemUI("Giao di�n tr� ph�.","Xin h�y b� M�t �� v�o � b�n d��i.", "task008", "no")
--	Uworld1064 = nt_getTask(1064)
--	nt_setTask(1064,0)
--	SetFightState(1);
--	NewWorld(342,1177,2410);
--	DisabledUseTownP(1)	--����������ɽ����ʹ�ûسǷ�
--	SetRevPos(175,1);		--����������
end;

function task008(ncount)
	local scrollarray = {}
	local scrollcount = 0
	local scrollidx = {}
	local y = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype ==196) then	
			y = y + 1
			scrollidx[y] = nItemIdx;
			scrollarray[i] = GetItemStackCount(nItemIdx)
			scrollcount = scrollcount + scrollarray[i]
		end
	end
	if (y ~= ncount) then
		Talk(1,"","M�t �� th�n b� ch�a ��, ng��i h�y ki�m tra l�i xem!")
		return
	end
	if (scrollcount > 100) then
		Talk(1,"","Ta ch� c�n 100 M�t �� Th�n B�, ng��i ��ng ��a cho ta nhi�u nh� v�y")
		return
	end
	if (scrollcount < 100) then
		Talk(1,"","M�t �� th�n b� ng��i giao cho ta kh�ng �� th� ph�i, ki�m tra l�i xem!")
		return
	end
	if (scrollcount == 100) then
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i])
		end
	end;
	--SetFightState(0);
	NewWorld(342,1178,2412)
	SetFightState(1);
end

function no()
end
