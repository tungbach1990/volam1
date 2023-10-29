-- �ļ�������translife_4_ex.lua
-- �����ߡ���wangjingjun
-- ���ݡ�����ת��4������� �������ת��4�Σ���ÿ�ζ���200��ת��������Ի�����⼼�ܣ�ս��ǧ��	
-- ����ʱ�䣺2011-09-14 16:20:38

Include("\\script\\task\\metempsychosis\\task_head.lua")

TRANSLIFE_TIME = 4
TRANSLIFE_LEVEL = 200
SKILL_NAME = "Chi�n � Thi�n Thu"
SKILL_ID = 1171 -- ս��ǧ�� id
SKILL_LEVEL = 1 -- ս��ǧ�� �ȼ�

function beidou_learn_specialskill()
	local szTitle = format("Ch� c� nh�ng ��i hi�p n�o ki�n tr�  <color=yellow>%d<color> tr�ng sinh c�p <color=yellow>%d<color> l�n m�i c� th� h�c ���c v� c�ng b� truy�n t�i ch� c�a ta ��y! ",TRANSLIFE_LEVEL,TRANSLIFE_TIME)
	local tbOpt = {}
	
	tinsert(tbOpt, {"X�c ��nh mu�n h�c k� n�ng",sureLearnSpecialSkill,{PlayerIndex}})
	tinsert(tbOpt, {" K�t th�c ��i tho�i!"})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function checkTranslifetime()
	local n_transcount = ST_GetTransLifeCount()
	if n_transcount < TRANSLIFE_TIME then
		Talk(1,"","Ch�a ��t ���c y�u c�u lu�n ki�n tr� c�p 200 tr�ng sinh ��n l�n 4, kh�ng th� nh�n ���c k� n�ng n�y")	
		return 0
	end
	return 1
end

function checkTranslifeLevel()
	local n_taskid = 0
	local n_taskbyte = 0
	local bRet = 1
	
	for n_transcount=1, TRANSLIFE_TIME do
		local n_id = floor(n_transcount / 2) + mod(n_transcount, 2)
		n_taskid = TSK_ZHUANSHENG_GRE[n_id]
		
		if (mod(n_transcount, 2) == 0) then
			n_taskbyte = 3
		else
			n_taskbyte = 1
		end
		local n_taskvalue = GetTask(n_taskid)
		n_taskvalue = GetByte(n_taskvalue, n_taskbyte)
	
--		print(format("��%d��ת���ĵȼ�Ϊ%d",n_transcount, n_taskvalue))
	
		if n_taskvalue ~= TRANSLIFE_LEVEL then
			bRet = 0
			break
		end
	end
	
	if bRet ~= 1 then
		Talk(1,"","Ch�a ��t ���c y�u c�u lu�n ki�n tr� c�p 200 tr�ng sinh ��n l�n 4, kh�ng th� nh�n ���c k� n�ng n�y")	
	end
	
	return bRet
end

function checkIsLearned()
	if HaveMagic(SKILL_ID) == -1 then
		return 1
	end
	Talk(1,"",format("��i hi�p �� h�c ���c <color=yellow>%s<color>, kh�ng th� h�c l�i ���c n�a",SKILL_NAME))
	return 0
end

function sureLearnSpecialSkill(nPlayerIndex)
	
	if checkIsLearned() ~= 1 then
		return 
	end
	
	if checkTranslifetime() ~= 1 then
		return 
	end
	
	if checkTranslifeLevel() ~= 1 then
		return 
	end
	
	-- ѧϰ����
	
	AddMagic(SKILL_ID, SKILL_LEVEL)
	Talk(1,"",format("Ch�c m�ng ng��i h�c ���c <color=yellow>%s<color>",SKILL_NAME))
end

