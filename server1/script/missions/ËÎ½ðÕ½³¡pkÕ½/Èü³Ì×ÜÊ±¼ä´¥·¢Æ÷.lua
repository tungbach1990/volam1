Include("\\script\\missions\\�ν�ս��PKս\\�ν�ս��ͷ�ļ�.lua");
function OnTimer()

State = GetMissionV(1) ;
if (State == 0) then
return
end;

--�ڹ涨ʱ���ڣ��������δ��һ��ɱ�������������������
--���� ĳĳ��:��ʿ��!��ͨѶ��ͨ�����о������˺���Ԯ���ӣ����Ǵ����..���ᡣ�����˱�...�ȵ�..
Msg2MSAll(1, "Tr�i �� t�i, t�m th�i thu binh! S�ng mai ��nh ti�p, kh�ng gi�t t��ng ��ch th� kh�ng v�. ");
SetMissionV(MS_STATE,3);
CloseMission(1);
end;