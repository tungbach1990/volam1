--zero 20070713 ľ���ٻ�
--������� ǰ16bit��ľ�� ǰ8bit�����ڣ���¼�գ���8bit��¼����
--           ��16bit��ͭ�� ǰ8bit���գ���8bit����
--           
--           ʹ��GetByte(TaskValue,1)ȡľ�Ƶ�����
--               GetByte(TaskValue,2)ȡľ��ʹ�ô���
--               GetByte(TaskValue,3)ȡͭ������
--               GetByte(TaskValue,4)ȡͭ��ʹ�ô���
--���������������
--               SetByte(TaskValue,i,n) ����i��ʾ�ڼ��ֽڣ�n��ʾ���ڻ���� 10����
Include( "\\script\\event\\mengjiang2007\\callboss.lua" )
Include("\\script\\lib\\pay.lua");
mupai_Task=1826;
function main( nItemIdx )
	local TaskValue=GetTask(mupai_Task);
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if(nDate>20070820) then
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
	if(nDate ~= GetByte(TaskValue,1) ) then --���ǽ�������ָ�
		TaskValue=SetByte(TaskValue,1,nDate); --����ľ������ ��1�ֽ�
		TaskValue=SetByte(TaskValue,2,40);    --�ָ�ľ�ƴ���40 ��2�ֽ�
		SetTask(mupai_Task,TaskValue); -- ���������������
	end
	local temp_count=GetByte(TaskValue,2);
	if(temp_count > 0 ) then --��������0��
		if( CallBoss(1) == 0) then
			TaskValue=SetByte(TaskValue,2,temp_count-1);
			SetTask(mupai_Task,TaskValue); --�����������
			return 0;
		else
			return 1;
		end			 
	else
		Say("H�m nay �� s� d�ng 40 M�c B�i r�i! H�y ��i ng�y mai m�i c� th� ti�p t�c s� d�ng!",0);
		return 1;
	end
	
end

function GetDesc(nItem)

end