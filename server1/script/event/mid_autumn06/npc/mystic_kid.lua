--by ��־ɽ [2006-09-12]
--2006����֮���Ի�����,���ִ�С���Ի�����
--Illustration: ���� -- lightcage au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);

--�콱���
function main()
	if (au06_is_inperiod() == 0) then --
		Say("Ho�t ��ng �� k�t th�c.", 0);
		return 1;
	end;
	if (au06_IsPayed_player() == 0) then
		Say("Ch� c� ng��i ch�i n�p th� m�i c� th� tham gia ho�t ��ng Trung thu", 0);
		return
	end;
	local str_Content = {
		"T�ng l�ng ��n b��m b��m ��c bi�t./#determine_get( 1 )",
		"T�ng l�ng ��n ng�i sao ��c bi�t./#determine_get( 2 )",
		"T�ng l�ng ��n �ng ��c bi�t./#determine_get( 3 )",
		"T�ng l�ng ��n tr�n ��c bi�t./#determine_get( 4 )",
		"T�ng l�ng ��n c� ch�p ��c bi�t./#determine_get( 5 )",
		"T�ng l�ng ��n k�o qu�n ��c bi�t./#determine_get( 6 )",
		"Hi�n t�i ta �ang r�t b�n!/oncancel"
	};
	Say("<color=yellow>L�ng ��n<color> n�y ��p qu�! C� th� t�ng cho mu�i l�m qu� cho c�c em nh�  kh�ng? Mu�i s� t�ng l�i ��i hi�p b�nh Trung Thu do ch�nh tay mu�i l�m.", getn(str_Content), str_Content);
end;

--ȷ���콱
function determine_get(nIndex)
	if (nIndex < 1 or nIndex > 6) then
		return
	end;
	tab_Index = {1, 2, 3, 4, 5, 6};
	Say("��i hi�p mu�n t�ng l�ng ��n n�y cho c�c em nh� sao?", 2, "Uhm! Hy v�ng mu�i kh�ng ch�!/#getaward("..tab_Index[nIndex]..")", "Ch�a ���c! L�ng ��n n�y ta c�n �ang d�ng/oncancel");
end;

--���յý�
function getaward(nIndex)
	if (nIndex < 1 or nIndex > 6) then
		return
	end;
	local szCageName = tab_Lightcage[nIndex][3];
	
	--���û����Ʒ
	if (CalcEquiproomItemCount(6, 1, tab_Lightcage[nIndex][1], -1) < 1) then
		Say("Sao h�a l� t�ng mu�i l�ng ��n m� v�n ch�a th�y v�y!?", 1, "Ah! Ta �� qu�n � r��ng ch�a ��./oncancel");
		return
	end;
	
	--�������ﵽ����
	if (GetTask(AU06_TK_EXP) >= EXP_AWARD_LIMIT) then
		Say("�a t�! Nh�ng mu�i �� c� �� l�ng ��n r�i.", 1, "H� h�! �i ch�i h�i nh� c�n th�n nh�!/oncancel");
		return
	end;
	
	--�۳�����
	if (ConsumeEquiproomItem(1, 6, 1, tab_Lightcage[nIndex][1], -1) ~= 1) then
		return
	end;
	--������Ʒ
	AddItem(6, 1, tab_Lightcage[nIndex][7], 1, 0, 0, 0);
	--����
	Say("C�m �n! ��y l� b�nh trung thu do mu�i l�m, xin h�y nh�n l�y.", 0);
	Msg2Player("B�n nh�n ���c <color=yellow>"..tab_Lightcage[nIndex][8].."<color>.");
end;
