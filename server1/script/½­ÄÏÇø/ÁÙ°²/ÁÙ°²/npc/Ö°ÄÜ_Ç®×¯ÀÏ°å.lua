-- �ٰ���ְ�ܡ�Ǯׯ�ϰ�
-- by��Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-01-06) ��ͳһ�����ƶ�������Ʊ���˶���
-- Update: Fanghao_Wu(2004-9-04) ����Ԫ���һ�ͭǮ����

-- Update: paul zhang(2005-09-06) ΪԽ�ϰ����޸ģ�ֻʹ����Ԫ����û�н�Ԫ������Ԫ���ɳ�ɰ���(7��)����25Сʱ��
--			ͭǮ��ʱ�����ţ�ͬʱ����һ��ͷ�ļ����ڿ��ƹ��ܵĿ�����ر�
-- Update: paul zhang(2005-12-28) ΪԽ�ϰ����޸ģ�����Խ�Ϸ���ԭ���޸ĳ�ֻʹ�ý�Ԫ����û����Ԫ�������ǽ�Ԫ���������޸�Ϊ�ɳ�ɰ���(7��)����25Сʱ��

-- Edited by peres
-- 2005/12/29 ����һ��Ԫ���� 15 ��ͭǮ�Ĺ���
-- end;

Include("\\script\\global\\systemconfig.lua") -- ϵͳ����
Include("\\script\\global\\head_qianzhuang.lua") -- ͷ����
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 

IncludeForRegionVer("\\script\\global\\", "gamebank_proc.lua")

function main()
	if (CheckGlobalTradeFlag() == 0) then		-- ȫ�־���ϵͳ���׿���
		return
	end
	
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 360 ) or ( Uworld1000 == 370 ) then
		education_qianzhuanglaoban()
	else
		Talk(1,"gamebank_proc","Vi�c l�m �n c�a b�n ti�m ng�y c�ng ph�t ��t, ta d� ��nh sang n�m m� th�m v�i chi nh�nh. Nh�ng vi�c n�y c�n ph�i th��ng l��ng l�i v�i H� b� V��ng ��i nh�n, kh�ng c� s� b�o h� c�a �ng ta, c�a ti�m cho vay c�a ta s� ch�ng l�m g� ���c")
	end
end
