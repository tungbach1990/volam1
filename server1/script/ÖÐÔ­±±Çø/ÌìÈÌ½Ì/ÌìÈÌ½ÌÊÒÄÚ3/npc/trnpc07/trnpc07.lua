--description: ���̽��һ���Ү�ɱ��롡����40������
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-24), �����ط���������
-- Update: Dan_Deng(2003-08-14)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ��أ�ȡ����˽ű���ز��ݣ�

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tr = GetTask(4)
	if (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 40*256) and (GetLevel() >= 40) then		-- 40����������
			Say("Theo tin b�o v�, tr�ng th�n Th�i U� c�a Tri�u ��nh <color=Red>Li�u K�<color> v�n l� gi�n �i�p c�a T�ng tri�u, tuy �ng ta �� c�o l�o h�i h��ng, nh�ng c�ng kh�ng th� �� �ng ta r�i kh�i Kim qu�c. Tin t�c cho bi�t, Li�u K� chu�n b� theo ���ng <color=Red>Ki�m C�c<color> v� T� Xuy�n, ta ph�i ng��i �i ti�u di�t h�n, nh�t ��nh ph�i bi�n Ki�m C�c Th�c ��o th�nh m� ch�n th�y h�n!", 2, "Thu�c h� tu�n m�nh/L40_get_yes", "Thu�c h� e r�ng kh�ng ��m nhi�m n�i/L40_get_no")
		elseif (UTask_tr == 40*256+20) and (HaveItem(159) == 1) then
			Talk(1,"L40_prise", "��y l� b�c m�t th� thu�c h� l�y ���c tr�n ng��i Li�u K�.")
		elseif (UTask_tr >= 10*256) and (UTask_tr < 40*256) then					--��δ��40������
			Talk(1,"","Luy�n binh ngh�n ng�y, d�ng trong m�t tr�n, ch� c�n to�n t�m to�n � ph�ng m�nh b�n gi�o, b�n gi�o s� kh�ng b�c ��i ng��i!")
		elseif (UTask_tr > 40*256) and (UTask_tr < 50*256) then					--�Ѿ��ӵ�40��������δ���
			Talk(1,"","Tin b�o <color=Red>Li�u K�<color> �� ��n <color=Red>T�a V�n ��ng<color> � Ki�m C�c Th�c ��o, ��a h�nh � �� r�t ph�c t�p, ng��i c� th� ��a �t ti�n �� <color=Red>� ��n Ch�<color> ��a ng��i �i, h�y �i nhanh �i!")
		else							--�Ѿ����40��������δ��ʦ
			Talk(1,"","Nh�ng k� ph�n b�i b�n gi�o, ha ha�Ta quy�t cho b�n ch�ng s�ng kh�ng ���c!ch�t c�ng kh�ng xong!")
		end
	elseif (UTask_tr >= 70) then							--�Ѿ���ʦ
		Talk(1,"","Ngh� k� ch�a? Mu�n � l�i ��y, hay Nam h� Trung Nguy�n?")
	else
		Talk(1,"","Ng��i l� ai? Ch�ng l� l� gi�n �i�p c�a Trung Nguy�n?")
	end
end;

function L40_get_yes()
	Talk(1,"","Tin b�o <color=Red>Li�u K�<color> �� ��n <color=Red>T�a V�n ��ng<color> � Ki�m C�c Th�c ��o, ��a h�nh � �� r�t ph�c t�p, ng��i c� th� ��a �t ti�n �� <color=Red>� ��n Ch�<color> ��a ng��i �i, h�y �i nhanh �i!")
	SetTask(4, 40*256+20)
	AddNote("T�i t�ng th� ba Thi�n Nh�n gi�o g�p H�u H� Ph�p Gia Lu�t T� Li, nh�n nhi�m v� h�nh th�ch, ��n T�a V�n ��ng th�ch s�t gian t� Li�u K� ")
	Msg2Player("T�i t�ng th� ba Thi�n Nh�n gi�o g�p H�u H� Ph�p Gia Lu�t T� Li, nh�n nhi�m v� h�nh th�ch, ��n T�a V�n ��ng th�ch s�t gian t� Li�u K� ")
end;

function L40_get_no()
	Talk(1,"","Chuy�n nh� n�y m� ng��i c�ng l�m kh�ng xong, b�n gi�o nu�i ng��i �� l�m g�?")
end;

function L40_prise()
	Talk(1, "", "L�m th�t t�t! L�n n�y ng��i �� l�p c�ng l�n, ta nh�t ��nh s� n�i t�t ng��i v�i Gi�o ch�!")
	SetRank(59)
	DelItem(159)
	SetTask(4, 50*256)
--	AddMagic(364)
--	AddMagic(146)				-- ������
	add_tr(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! ���c phong l�: Ch��ng K� s�! H�c ���c v� c�ng Bi T� Thanh Phong. ")
	AddNote("Quay l�i Thi�n Nh�n Gi�o, ��a b�c m�t th� cho H�u H� Ph�p Gia Lu�t T� Li, ho�n th�nh nhi�m v� h�nh th�ch. Th�ng c�p Ch��ng K� S�. ")
end;
