-- ====================== �ļ���Ϣ ======================

-- ������Ե�����һ������ҩ
-- ʳ�ú�������5��Ǳ�ܵ�
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
	local nTimes = GetByte(nValue, 2);
	
	local str ={
		"Nghi�n c�u m�t h�i tr�n ph�i linh d��c m� v�n kh�ng bi�t c�ch s� d�ng. (ch�a chuy�n m�n ph�i kh�ng th� s� d�ng)",
		"Tr�n ph�i linh d��c v�a ���c nu�t xu�ng, �an �i�n li�n sinh ra m�t d�ng nhi�t kh� ch�y kh�p k� kinh b�t m�ch(T�ng 5 �i�m ti�m n�ng)",
		"Tay c�m l�y tr�n ph�i linh d��c m� ph�t hi�n ra r�ng n� kh�ng c�n t�c d�ng g� n�a (�� s� d�ng ��n s� l�n gi�i h�n cao nh�t)"
	}
	
	if(nTimes >= 15) then 				--ʹ�ó�������
		Msg2Player(str[3])
		return 1;
	elseif (GetTask(TSK_TOUSHI_FLAG) == 0 and GetTask(TSK_TOUSHI_COUNT) <= 0) then     	-- תͶ���ɳɹ��ſ�ʹ��
		Msg2Player(str[1])
		return 1;
	else                            	-- ����5��Ǳ�ܵ�
		AddProp(5);
		SetTask(TSK_ZHENPAILINGDAN_USECNT, SetByte(nValue, 2, nTimes + 1));
		Msg2Player(str[2]);
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tAdd Prop 5 by ZhenPaiLingYao",
						"Tr�n ph�i linh d��c",
						GetLocalDate("%Y-%m-%d %X"),
						GetName(), GetAccount()));
		return 0;
	end
end
