--2007��-Խ�����彭������Ƭ
--��������2�������ջ��
--��2007��06��11����2007��07��01��
--by fmz
--����ʹ��,Խ��2007����
--modify by С�˶��

--ACT2YEARS_YN_CELLPAPER_ID = 1436        --����ֽ��ID
--ACT2YEARS_YN_BOWKNOT_ID = 1437          --�������ID
--ACT2YEARS_YN_ROSE_ID =  1438            --õ�廨��ID
--ACT2YEARS_YN_WHITEBOX_ID =  1439        --��ɫ���
--ACT2YEARS_YN_BLUEBOX_ID =   1441        --��ɫ���
--ACT2YEARS_YN_YELLOWBOX_ID = 1440        --��ɫ���
--ACT2YEARS_YN_NORMALCAKE_ID =1442        --�±�
--ACT2YEARS_YN_MIDCAKE_ID = 1443          --�����±�
--ACT2YEARS_YN_SPECIALCAKE_ID = 1444      --�����±�
ACT2YEARS_YN_BEGINTIME = 070825     --���ʼ����
ACT2YEARS_YN_ENDTIME = 070909       --���������
--
--2007Խ�Ϲ���
GUOQING_YN_TASK_DATE = 1831					--��¼��ȡʱ��,1.ʱ��(��%y),2.ʱ��(��)��3.ʱ��(��),4.��ȡ����
GUOQING_YN_TASK_COUNT = 0 				--��¼��ȡ����
GUOQING_YN_WUJIAOXING_ID = 1494			--ʤ�������
GUOQING_YN_LiHe_ID = 1495						--�������ID
--
function Act2Years2007_CheckInTime()
    local nDate = tonumber(GetLocalDate("%y%m%d"))
    if nDate > ACT2YEARS_YN_ENDTIME or nDate < ACT2YEARS_YN_BEGINTIME then
        return 0
    else
        return 1
    end
end
--
function main()
    --if Act2Years2007_CheckInTime() == 1 then
        --Say("����ף�����ִ�������������ա�<enter>��2007��06��11����2007��07��11���ڼ佫���ڽ����ϳ����������ͷҷ���õ�廨����������ռ���һЩ���ҽ��к���������",
        --5,"�һ���ɫ��Ʒ��/WLSZ_ExcWhiteBox","�һ���ɫ��Ʒ��/WLSZ_ExcBlueBox","�һ���ɫ��Ʒ��/WLSZ_ExcYellowBox",
        --"��ϸ˵��/WLSZ_ExcDetail","�����Ի�/WLSZ_End")
    if Act2Years2007_CheckInTime() == 1 then
    		Describe("S� gi� v� l�m: Nhi�t li�t ch�c m�ng ng�y Qu�c Kh�nh. Trong kho�ng th�i gian t� <color=red>25-08-2007<color> ��n <color=red>09-09-2007<color>, ng��i ch�i c� th� �em 10 <color=yellow>Ng�i sao chi�n th�ng<color> v� <color=yellow>15 v�n l��ng<color> �� ��i l�y  <color=yellow>H�p qu� Qu�c Kh�nh<color>.<color=yellow>B�n trong h�p qu� Qu�c Kh�nh<color> c� ch�a Huy ch��ng Qu�c Kh�nh v� c�c m�nh b�n ��. N�u thu th�p �� 12 m�nh b�n �� kh�c nhau s� c� c� h�i <color=yellow>m� r�ng r��ng th� 3<color>.",3,
    				"Ta mu�n ��i h�p qu� Qu�c Kh�nh/GuoQing_Give",
    				"C�ch ��i h�p qu� Qu�c Kh�nh/guoQing_About",
    				"Bi�t r�i/no"
    			)
    else		
        Say("Ta ch�nh l� s� gi� v� l�m.",0)
    end
end
--
function WLSZ_End()    
end
--
function WLSZ_ExcWhiteBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    if nRoseNumber < 10 then
        return Say("C�n 10 hoa h�ng ��",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_WHITEBOX_ID,1,0,0 )
    Msg2Player("��i 10 hoa h�ng �� l�y h�p qu� tr�ng")
    Say("B�n nh�n ���c 1 <color=red>H�p qu� tr�ng<color>, b�n trong c� nh�ng m�n qu� b�t ng�.",2,"Tr� l�i/main","K�t th�c ��i tho�i/WLSZ_End")
end
--
function WLSZ_ExcBlueBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    local nBOWKNOTNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_BOWKNOT_ID, -1 )
    if nRoseNumber < 10 or nBOWKNOTNumber < 1 then
        return Say("C�n 10 hoa h�ng �� v� 1 n� ��.",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    ConsumeEquiproomItem( 1,6,1,ACT2YEARS_YN_BOWKNOT_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_BLUEBOX_ID,1,0,0 )
    Msg2Player("��i 10 hoa h�ng �� v� 1 n� �� l�y h�p qu� xanh.")
    Say("B�n nh�n ���c 1 <color=red>H�p qu� xanh<color>, b�n trong c� nh�ng m�n qu� b�t ng�.",2,"Tr� l�i/main","K�t th�c ��i tho�i/WLSZ_End")
end
--
function WLSZ_ExcYellowBox()
    local nRoseNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_ROSE_ID, -1 )
    local nCellPaperNumber = CalcEquiproomItemCount( 6,1,ACT2YEARS_YN_CELLPAPER_ID, -1 )
    if nRoseNumber < 10 or nCellPaperNumber < 1 then
        return Say("C�n 10 hoa h�ng �� v� 1 gi�y g�i hoa.",0)
    end
    ConsumeEquiproomItem( 10,6,1,ACT2YEARS_YN_ROSE_ID,-1 )
    ConsumeEquiproomItem( 1,6,1,ACT2YEARS_YN_CELLPAPER_ID,-1 )
    AddItem(6,1,ACT2YEARS_YN_YELLOWBOX_ID,1,0,0 )
    Msg2Player("��i 10 hoa h�ng �� v� 1 gi�y g�i hoa l�y H�p qu� v�ng.")
    Say("B�n nh�n ���c 1 <color=red>H�p qu� v�ng<color>, b�n trong c� nh�ng m�n qu� b�t ng�.",2,"Tr� l�i/main","K�t th�c ��i tho�i/WLSZ_End")
end
--
function WLSZ_ExcDetail()
    Say("Nguy�n t�c ��i h�p qu�: <enter>H�p qu� tr�ng: 10 hoa h�ng �� <enter>H�p qu� xanh: 10 hoa h�ng �� v� 1 n� �� <enter> H�p qu� v�ng: 10 hoa h�ng �� v� 1 gi�y g�i hoa.",2,"Tr� l�i/main","K�t th�c ��i tho�i/WLSZ_End")
end

--2007Խ�Ϲ���..
function guoQing_About()
	Describe("S� gi� v� l�m: Trong kho�ng th�i gian t� <color=red>25-08-2007<color> ��n <color=red>09-09-2007<color>, ng��i ch�i c� th� �em 10 <color=yellow>Ng�i sao chi�n th�ng<color> v� <color=yellow>15 v�n l��ng<color> �� ��i l�y 1 <color=yellow>H�p qu� Qu�c Kh�nh<color>. <color=yellow>Ng�i sao chi�n th�ng<color> s� r�i ra � c�c khu v�c c�p t� 50 tr� l�n. <color=yellow>B�n trong h�p qu� Qu�c Kh�nh<color> c� ch�a Huy ch��ng Qu�c Kh�nh v� c�c m�nh b�n ��. N�u thu th�p �� c�c m�nh b�n �� ��nh s� t� 1 ��n 12  s� c� c� h�i <color=yellow>m� r�ng r��ng th� 3<color>.",1,"K�t th�c ��i tho�i/WLSZ_End")
end

function GuoQing_Give()
	local nGuoqingLiHe = CalcEquiproomItemCount( 6,1,GUOQING_YN_WUJIAOXING_ID, -1 )

	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(GUOQING_YN_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCount = GetByte(nLibao,4);
	

	if ( nOlddate == nDate and nCount >= 50) then
			Say("S� gi� v� l�m: Th�t ��ng ti�c, m�i nh�n v�t m�i ng�y ch� c� th� ��i ���c t�i �a 50 <color=yellow>h�p qu� Qu�c Kh�nh<color>, ng�y mai h�y ��n ��i nh�.",0)
			return 1;
	end
	
	if nGuoqingLiHe < 10 then
		Say("S� gi� v� l�m: Th�t ��ng ti�c, kh�ng �� 10 Ng�i sao chi�n th�ng, kh�ng th� ��i h�p qu� Qu�c Kh�nh.",0)
		return 
	end
	
	if GetCash() < 150000 then
		Say("S� gi� v� l�m: Th�t ��ng ti�c, kh�ng mang �� 15 v�n l��ng, kh�ng th� ��i h�p qu� Qu�c Kh�nh.",0)
		return
	end
	if ( CalcFreeItemCellCount() < 2 ) then
		Say("Kh�ng �� ch� tr�ng, h�y s�p x�p l�i h�nh trang.",0);
		return
	end
	if ( nOlddate ~= nDate ) then
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
			SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),4,0));
	end
	Pay(150000)
	nCount = GetByte(GetTask(GUOQING_YN_TASK_DATE),4);
	SetTask(GUOQING_YN_TASK_DATE,SetByte(GetTask(GUOQING_YN_TASK_DATE),4,nCount+1))
	ConsumeEquiproomItem( 10,6,1,GUOQING_YN_WUJIAOXING_ID,-1 )
 	local nidx = AddItem(6,1,GUOQING_YN_LiHe_ID,1,0,0 )
	Msg2Player("Ch�c m�ng b�n nh�n ���c 1 <color=yellow>H�p qu� Qu�c Kh�nh<color>.")
	WriteLog(format("[WuLinShiZhe]Date:%s\t Account:%s\t Name:%s\t Effect:GetItem %s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)))
end
