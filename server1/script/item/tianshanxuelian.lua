-- ��ɽѩ��
-- By: Feimingzhi(2007-05-08)
-- Content:90���������ʹ����ɽѩ��ֱ������120����

IncludeLib("SETTING");
Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������
Include("\\script\\lib\\pay.lua")


function main( nItemIndex )
    
    local nPLev = GetLevel()
    if nPLev > 90  or nPLev < 50 or IsCharged() < 1 then
        Say("Ch� c� nh�n v�t c�p �� t� 50 ��n 90 (bao g�m c�p 50 v� 90) m�i c� th� s� d�ng.", 0)
        return 1
    end
	
    tl_addPlayerExp(1433042000)	--90��0%����120��0%���ܾ���ֵ
	nPLev = GetLevel()
	Msg2Player(format("Ch�c m�ng b�n, ��ng c�p hi�n t�i c�a b�n l� %d.",nPLev))
	WriteLog(format("[S� d�ng Thi�n S�n Tuy�t Li�n]\t%s\tName:%s\tAccount:%s\t v�a �n ���c 1 Thi�n S�n Tuy�t Li�n.",
			GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
end
--
