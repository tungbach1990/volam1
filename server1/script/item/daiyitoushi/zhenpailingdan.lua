-- ====================== �ļ���Ϣ ======================

-- ������Ե�����һ�����鵤
-- ʳ�ú����������㼼�ܵ�
-- ��������ҩ���ñ�������һ��Byte��¼�鵤ʹ�ô������ڶ���Byte��¼��ҩʹ�ô���

-- Edited by �ӷ��~
-- 2008/03/03 23:29

-- ======================================================
Include("\\script\\lib\\gb_modulefuncs.lua")


TSK_ZHENPAILINGDAN_USECNT	=	1882;
TSK_TOUSHI_FLAG				=	1881						-- ������Ͷʦ���˳����ɵı��
														--	 0��δ����תͶ���ɻ�תͶ���ɳɹ�����תְ����һ���������1���ɹ�����תͶ���ɣ�
TSK_TOUSHI_COUNT			=	1883						-- ������Ͷʦ��תְ�Ĵ���

function main(nItemIdx)
	if (gb_GetModule("SWITH_DAIYITOUSHI") ~= 1) then
		Say("Xin l�i, c�ng n�ng n�y t�m th�i �� b� ��ng, th�i gian m� l�i s� ��oc th�ng b�o sau ", 0);
		return 1;
	end
	
	local nValue	= GetTask(TSK_ZHENPAILINGDAN_USECNT);
	local nTimes = GetByte(nValue, 1);
	local str={
		"Nghi�n c�u m�t h�i tr�n ph�i linh ��n m� v�n kh�ng bi�t c�ch s� d�ng. (ch�a chuy�n m�n ph�i kh�ng th� s� d�ng)",
		"V�a m�i u�ng xong tr�n ph�i linh ��n c�m th�y m�t lu�ng sinh l�c ch�y quanh ng��i (T�ng 1 �i�m k� n�ng)",
		"Tay c�m l�y tr�n ph�i linh ��n m� ph�t hi�n ra r�ng n� kh�ng c�n t�c d�ng g� n�a (�� s� d�ng ��n s� l�n gi�i h�n cao nh�t)"
		}
	if(nTimes >= 15) then              	-- ʹ�ô����Ѵﵽ����
		Msg2Player(str[3])
		return 1;
	elseif (GetTask(TSK_TOUSHI_FLAG) == 0 and GetTask(TSK_TOUSHI_COUNT) <= 0) then     	-- תͶ���ɳɹ��ſ�ʹ��
		Msg2Player(str[1])
		return 1;
	else                            	-- ����1�㼼�ܵ�
		AddMagicPoint(1);
		SetTask(TSK_ZHENPAILINGDAN_USECNT, SetByte(nValue, 1, nTimes + 1));
		Msg2Player(str[2]);
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tAdd MagicPoint 1 by ZhenPaiLingDan",
						"Tr�n ph�i linh ��n",
						GetLocalDate("%Y-%m-%d %X"),
						GetName(), GetAccount()));
		return 0;
	end
end
