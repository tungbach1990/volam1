--description: �䵱��С��ʿ��硡��ľͰ�����䵱��������
--author: yuanlan
--date: 2003/5/14
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2004-01-12)��������������񣬸�Ϊ������������

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_wd = GetTask(5)
	UTask_world31 = GetByte(GetTask(31),1)
	if (UTask_world31 == 0)	and (GetLevel() >= 10) and (GetFaction() ~= "wudang") then			-- ˮͰ��������
		Say("Khi ta l�y n��c kh�ng c�n th�n �� l�m ��t d�y th�ng, k�t qu� l� <color=Red>th�ng g�<color> r�i xu�ng <color=Red>gi�ng<color>, kh�ng l�y ���c n��c,quay v� nh�t ��nh b� s� huynh qu� tr�ch. Ng��i c� ��ng � gi�p ta l�y th�ng g� l�n kh�ng?", 2, "��ng �!/uworld31_get_yes", "ta kh�ng gi�p ng��i ���c /uworld31_get_no")
	elseif (UTask_world31 == 5) and (HaveItem(65) == 1) then					--��ľͰ
		uworld31_prise()
	elseif (UTask_world31 < 10) then 					--��δ��ɼ�ľͰ����
		Talk(1,"","<color=Red>Th�ng g�<color> c�a ta r�i xu�ng <color=Red>gi�ng<color>, n�u kh�ng t�m ���c <color=Red>th�ng g�<color>, kh�ng l�y ���c n��c s� b� S� huynh tr�ch ph�t.")
	elseif (UTask_world31 == 10) then 					--��ǰ��ɼ�ľͰ����
		UTask_world31 = SetByte(GetTask(31),1,127)
		SetTask(31,UTask_world31)
		Talk(1,"","C�m �n ng��i l�n tr��c �� gi�p ta l�y l�i th�ng g�! Ta s� cho ng��i l�m �� t� k� danh V� �ang ph�i, sau n�y ng��i c� th� mua b�n trang b� v� kh� c�a V� �ang ph�i.")
	elseif (GetFaction() == "wudang") then   				--�Ѿ����ţ���δ��ʦ
		Talk(1,"","H�ng ng�y ��u k�u ta t�i ��y l�y n��c, c�n th�i gian ��u m� tu luy�n n�a! Ng��i c� r�nh th� ��n n�i chuy�n v�i ta ���c kh�ng?")
	elseif (UTask_wd == 70*256) then							--�Ѿ���ʦ
		Talk(1,"","Ng��i th�t c� b�n l�nh! Chao �i! Bao gi� ta m�i c� th� xu�t s� ��y?")
	else
		Talk(1,"","V� �ang s�n b�c th�ng v�i T�n L�nh, ph�a Nam gi�p v�i Ba S�n, li�n mi�n kh�i ph�c, ngang d�c tr�m d�m, 72 ��nh h�ng v� l� k�, h�ng n�m ng��i ta du ngo�n ��n ��y r�t ��ng!")
	end
end;

function uworld31_get_yes()
	Talk(1,"","Hay qu�! <color=Red>Th�ng g�<color> b� r�i xu�ng <color=Red>gi�ng<color> ��.")
--	DelItem(65)									--��ֹ�ؽ��������Ҽ����������
	SetTask(31,SetByte(GetTask(31),1,5))
	AddNote("G�p ti�u ��o s� Thanh Phong � gi�ng Ma ch�m ph�a ��ng tr��c n�i, Ti�p nh�n nhi�m v�: Gi�p �� Thanh Phong xu�ng ��y gi�ng t�m th�ng g�. ")
	Msg2Player("Ti�p nh�n nhi�m v�: Gi�p �� Thanh Phong xu�ng ��y gi�ng t�m th�ng g�. ")
end;

function uworld31_get_no()
	Talk(1,"","V�y ta t�m ng��i kh�c gi�p!")
end;

function uworld31_prise()
	DelItem(65)
	UTask_world31 = SetByte(GetTask(31),1,127)
	i = ReturnRepute(25,24,4)		-- ȱʡ����12���������ĵȼ�24����ÿ���ݼ�8%
	SetTask(31,UTask_world31)
	AddRepute(i)		-- ������
	Talk(1,"","C�m �n ng��i �� gi�p ta l�y l�i th�ng g�! Ta �� ��ng � ��y r�t l�u, ng��i l� trong s� �t ng��i ch�u gi�p ta t�m l�i th�ng g�, ta phong ng��i l� �� t� k� danh V� �ang ph�i,sau n�y ng��i c� th� mua b�n trang b� v� kh� c�a V� �ang ph�i.")
	AddNote("Gi�p �� ti�u ��o s� Thanh Phong t�m l�i th�ng g�, nhi�m v� ho�n th�nh. Tr� th�nh K� danh �� t�. Danh v�ng t�ng th�m ")
	Msg2Player("Gi�p �� ti�u ��o s� Thanh Phong t�m l�i th�ng g�, nhi�m v� ho�n th�nh. Tr� th�nh K� danh �� t�. Danh v�ng t�ng th�m "..i.."�i�m.")
end

function no()
end;
