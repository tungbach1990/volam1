--zero 20070713 �����ٻ�
--��һ���ֽڼ�¼�� �ڶ����ֽڼ�¼�� �������ֽڼ�¼����Ϊֻ��һ�Σ�ֻ��Ҫ��¼ʱ��

Include( "\\script\\event\\mengjiang2007\\callboss.lua" )
Include("\\script\\lib\\pay.lua");
yinpai_Task=1827;
function main( nItemIdx )
	local TaskValue=GetTask(yinpai_Task);
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if(nDate>20080331) then
		Say("L�nh b�i �� qu� h�n s� d�ng, b� m�t hi�u l�c!",0)
		return 0;
	end
	if( IsCharged() == 0) then
		Say("Th�t ��ng ti�c, ch� c� ng��i ch�i �� n�p th� m�i c� th� s� d�ng.",0);
		return 1; 
	end
	if( GetLevel() <90 ) then
		Say("Th�t ��ng ti�c, ch� c� ng��i ch�i c�p 90 tr� l�n m�i c� th� s� d�ng.",0);
		return 1;
	end
	nDate = tonumber(GetLocalDate("%d"));
	if(nDate ~= GetByte(TaskValue,1) ) then --���ǽ���
		if( CallBoss(3) == 0) then
			TaskValue=SetByte(TaskValue,1,nDate); --������������ ��1�ֽ�
			SetTask(yinpai_Task,TaskValue);
			return 0;
		else
			return 1;
		end	
	else
		Say("H�m nay �� s� d�ng 1 Ng�n B�i r�i! H�y ��i ng�y mai m�i c� th� ti�p t�c s� d�ng!",0);
		return 1;
	end
	
end

function GetDesc(nItem)

end