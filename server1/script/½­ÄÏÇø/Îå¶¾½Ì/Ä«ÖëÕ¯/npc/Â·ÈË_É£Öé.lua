-- �嶾 ·��NPC ī��կ��ɣ�� 10������
-- by��Dan_Deng(2003-08-05)

-- �޸ĺ���а��������ص�ɣ��ű�
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

Include("\\script\\global\\skills_table.lua");

function main()

-- ������ϵͳ��а��������صĽű� --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

		
	if (myTaskValue==150) then
		task_level30_14();
		return
	end


-- ������ϵͳ��а��������صĽű� --


	UTask_wu = GetTask(10)
	if (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 10*256+10) then		--10�����������
			i = GetItemCount(86)
			if (i >= 10) and (HaveItem(220) == 1) then
				Talk(1,"L10_prise","Tang tr�i ch�! ��y l� nh�n nh�n v� t�n th�ch m� ng��i c�n")
			else
				Talk(1,"","�� v�t v�n ch�a c� ��, t�i sao l�i ch�m nh� v�y? Mau l�n! Mau l�n!")
			end
		elseif ((UTask_wu == 10*256) and (GetLevel() >= 10)) then		--10������
			Say("V�t li�u �� cho ta luy�n c�ng v�n c�n thi�u. Ng��i h�y �i l�n Nh�n ��ng s�n b�t th�m cho ta 10 con nh�n v� mua th�m 10 bao t�n th�ch",2,"Tu�n l�nh!/L10_get_yes","Th�t xin l�i! T�i h� c�n c� chuy�n ph�i l�m!/L10_get_no")
		else							-- ����Ի�
			Talk(1,"","C�i t�n b�t c�c con c�a ta v�n c�n s�ng s� s�. N�u nh� ta b�t ���c h�n th� ta s� ph� h�t x��ng c�t c�a h�n, sau �� d�ng th�n th� c�a h�n �� luy�n 'Tri th� ��c'. Ta s� l�m cho h�n �au ��n, mu�n ch�t kh�ng ���c, mu�n s�ng kh�ng xong!")
		end
	else
		Talk(1,"","Kh�ng bi�t con trai ta b�y gi� sao r�i, c� ���c b�nh an v� s� kh�ng�.")
	end

end;

function L10_get_yes()
	Talk(1, "", "Mau �i mau v�! Ta �ang c�n d�ng!")
	SetTask(10,10*256+10)
	AddNote("Gi�p Tang Ch�u t�m 10 con nh�n v� 10 bao T�n th�ch.")
	Msg2Player("Gi�p Tang Ch�u t�m 10 con nh�n v� 10 bao T�n th�ch.")
end;

function L10_get_no()
	Talk(1,"","Hay l�m! Th�t kh�ng th� tin ���c!")
end;

function L10_prise()
	Talk(1,"","T�t l�m! Ng��i lui ra �i! ��ng c� ng�n tr� ta luy�n c�ng!")
	DelItem(220)
	for i = 1, GetItemCount(86) do DelItem(86) end
	SetTask(10,20*256)
	SetRank(50)
--	AddMagic(62)
--	AddMagic(60)
--	AddMagic(67)
	add_wu(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! B�n ���c th�ng l� �o�t H�n T�n Nh�n! H�c ���c v� c�ng Ng� ��c Ch��ng Ph�p, Ng� ��c �ao Ph�p, C�u Thi�n Cu�ng L�i.")
	AddNote("Gi�p Tang Ch�u t�m con nh�n v� T�n th�ch. ���c phong l� �o�t H�n T�n Nh�n.")
end;
