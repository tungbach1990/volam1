--���ϱ������������
--������������񣺻��ӵĵ���
--suyu
-- Update: Dan_Deng(2003-08-11)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Gian h�ng c�a ta binh kh� tinh x�o m� gi� c� l�i v�a ph�i, ��i hi�p h�nh t�u giang h� m� kh�ng c� m�t m�n binh kh� cho v�a tay sao? Mua m�t m�n �i n�o?"

function main(sel)
--	UTask_world18 = GetTask(46);
	UTask_world45 = GetTask(45)
	Uworld1000 = nt_getTask(1000)	
	if(UTask_world45 == 10) then
		Talk(1,"","Ng��i ��n h�i chi�c n� cho ti�u H� T� �? Ta ch�a ��ng tay t�i! �� c�n thi�t ta c�n ch�a �i t�m.Ta l�i kh�ng th� r�i ti�m. Th� n�y nh�! Ng��i gi�p ta �i t�m ch�c c�y v� da tr�u.C� �� r�i ta s� l�p t�c l�m ngay!")
		SetTask(45, 20)
		AddNote("Th� r�n c�n nguy�n li�u m�i c� th� b�t ��u l�m gi�n n�! B�n gi�p anh ta t�m m�t ch�c v�y v� m�t mi�ng da tr�u.")
		Msg2Player("Th� r�n c�n nguy�n li�u m�i c� th� b�t ��u l�m gi�n n�! B�n gi�p anh ta t�m m�t ch�c v�y v� m�t mi�ng da tr�u.")
	elseif(UTask_world45 == 20) then
		if((HaveItem(177) ==1 ) and (HaveItem(178) == 1)) then	--�ж��Ƿ��е���
			Talk(2,"","Sao nhanh th�? ��a ch�c c�y v� da tr�u ��a cho ta! Ta l�m ngay!","�� l�m xong. Thay ta ��a c�y n� cho Ti�u H� T�!")
			DelItem(177)		--ɾ�����
			DelItem(178)		--ɾ��ţƤ
			AddEventItem(176)		--����ҵ���
			Msg2Player("���c m�t gi�n n�.")
			AddNote("Th� r�n �� l�m xong gi�n n� nh� b�n �em �i cho H� T�.")
			Msg2Player("Th� r�n �� l�m xong gi�n n� nh� b�n �em �i cho H� T�.")
--			SetTask(46, 3)
		else
			tiejiang_village("<dec><npc>Ch� c�n mang ch�c v� da tr�u ��n cho ta th� s� c� ngay c�y n� cho Ti�u H�, ch� c�n ��i m�t l�c l� xong. Ng��i mu�n lo�i v� kh� n�o kh�c kh�ng?")
		end
	else
		tiejiang_village();
	end
end;

function yes()
	Sale(22);  				--�������׿�
end;
