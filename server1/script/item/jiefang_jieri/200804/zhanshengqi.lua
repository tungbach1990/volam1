-- �ļ�������zhanshengqi.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-15 11:51:30

--���ƣ�
--- 50�����ϵĳ�ֵ��Ҳ���ʹ�á�
--- ��ڼ䣬ÿ�����ֻ��ͨ��ʹ��սʤ�������1.200.000.000����ֵ��
---�����Ժ��鲻����
--ʹ��սʤ�����ϻ��2.000.000����ֵ��

--SetSpecItemParam(nItemIndex, 1, tonumber(GetLocalDate("%Y%m%d")) )
--SetSpecItemParam(nItemIndex, 2, tonumber(GetLocalDate("%Y")) )
--SetSpecItemParam(nItemIndex, 3, tonumber(GetLocalDate("%m")) )
--SetSpecItemParam(nItemIndex, 4, tonumber(GetLocalDate("%d")) )

IncludeLib("SETTING");
Include("\\script\\lib\\pay.lua");
Include("\\script\\event\\jiefang_jieri\\200804\\taskctrl.lua")
function main(nItemIndex)
	jiefang_0804_ResetTask()
	local nItemData	= 20080531
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	
	
	if nDate > nItemData then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end
	
	
	
	if IsCharged() == 0 or GetLevel() < 50 then
		Say("Ch� c� ng��i ch�i c�p tr�n 50 �� n�p th� m�i c� th� s� d�ng.", 0)
		return 1;
	end
	
	local nExp = 2000000
	local nCurFlagExp = GetTask(jiefang_0804_TSK_FlagExpLimit)
	if nCurFlagExp >= jiefang_0804_TSKV_FlagExpLimit then
		Say(format("Trong th�i gian ho�t ��ng, th�ng qua vi�c s� d�ng l� c� chi�n th�ng ch� c� th� nh�n ���c t�i �a %d �i�m kinh nghi�m.", jiefang_0804_TSKV_FlagExpLimit), 0)
		return 1
	end
	AddOwnExp(nExp)
	SetTask(jiefang_0804_TSK_FlagExpLimit, nCurFlagExp + nExp)
	
end