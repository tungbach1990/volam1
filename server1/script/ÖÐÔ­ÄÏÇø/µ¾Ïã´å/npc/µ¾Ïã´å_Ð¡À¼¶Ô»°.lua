----description: ���ִ�_С��
--author: wangzg	
--date: 2003/7/18
--Modify:2003/7/21 wangzg
--update 2003/7/28 yuanlan
--Update: 2003-08-07 Dan_Deng
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main(sel) 
  	UTask_world38=GetTask(66)
  	if ((UTask_world38 == 0) and (GetLevel() >= 6)) then		-- ��Ҫ6�����ϲ���������
  		Talk(3, "select", "Ti�u c� n��ng t�i so l�i kh�c l�c th�m th��ng v�y?", "Gia gia m�c b�nh r�i! Nh�ng nh� ta l�i kh�ng c� ti�n mua thu�c.", "Mu�n mua thu�c g�?")
  	elseif (UTask_world38 == 1) then
		Talk(1,"","C�m �n huynh! Thu�c c�a �ng n�i t�i tr��c ��y l� do Ch� d��c �i�m b�c.")
  	elseif (UTask_world38 == 5) then
  		if (HaveItem(186) == 1) then
  			DelItem(186)
  			Talk(1,"","Th�t c�m �n huynh! Ta c� m�t chi�c nh�n, xin huynh nh�n cho!")
  			SetTask(66,10)
  			i = random(0,3)
  			if (i < 3) then 
  				i = 8 
  			else 
  				i = 9 
  			end
  			AddRepute(i)
  			AddNote("Giao X� H��ng H� C�t Cao cho Ti�u Lan, ho�n th�nh nhi�m v�. ")
  			Msg2Player("Giao X� H��ng H� C�t Cao cho Ti�u Lan, ho�n th�nh nhi�m v�. ")
  			if (random(0,3) == 0) then				-- 25%�Ļ��ʵö�����ָ
				p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
  				AddItem(0,3,0,2,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
  				Msg2Player("Nh�n ���c nh�n qu� Tr�m. ")
  			else
				p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
  				AddItem(0,3,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
  				Msg2Player("C� ���cHo�ng Ng�c Gi�i ch�. ")
  			end
  			Msg2Player("Danh v�ng c�a b�n t�ng th�m "..i.."�i�m.")
  		else
  			Say("B�n kh�ng c�n th�n l�m m�t X� H��ng H� C�t Cao, n�u mu�n ho�n th�nh nhi�m v� b�n ph�i c� X� H��ng H� C�t Cao.", 2, "Ta �i ki�m th�m ti�n/find", "T�m ch� ti�m thu�c l�m thu�c m�i /redo")
  		end		
	elseif ((UTask_world38 > 1) and (UTask_world38 < 10)) then			-- �����е���ͨ�Ի�
		Talk(1,"","C�m �n huynh! Thu�c c�a �ng n�i t�i tr��c ��y l� do Ch� d��c �i�m b�c.")
  	elseif (UTask_world38 >= 10) then			-- ��������ĶԻ�
  		Talk(1,"","C�m �n huynh! C� thu�c r�i, b�nh c�a �ng n�i nh�t ��nh s� kh�i.")
	else					-- ������Ի�
  		Talk(1,"","�ng n�i Gia gia tu�i �� cao, s�c kh�e l�i kh�ng t�t! Ta ch� hy v�ng m�nh bi�t y thu�t �� tr� b�nh cho �ng.")
	end
end;

function select()
	Say("Ta c�ng kh�ng bi�t l� thu�c g�, ch�nh l� tr��c ��y Ch� d��c �i�m cho �ng ta.", 2, "Gi�p l�m thu�c /yes", "Kh�ng li�n quan ��n vi�c c�a ta /no")
end;

function yes()
	Talk(1,"","C�m �n huynh! Thu�c c�a �ng n�i t�i tr��c ��y l� do Ch� d��c �i�m b�c.")
	SetTask(66,1)
	AddNote("Nh�n nhi�m v�: Gi�p �ng Ti�u Lan t�m thu�c. ")
	Msg2Player("Nh�n nhi�m v�: Gi�p �ng Ti�u Lan t�m thu�c. ")
end;

function no()
end;

function find()
end;

function redo()
Talk(1,"","��n d��c �i�m l�y thu�c!")
SetTask(66, 2)
SetTask(67, 0)
AddNote("<color=red> B�i v� X� H��ng H� C�t Cao b� m�t, vui l�ng �i t�m �ng ch� ti�m thu�c l�m l�i thu�c. <color> ")
Msg2Player("B�i v� X� H��ng H� C�t Cao b� m�t, vui l�ng �i t�m �ng ch� ti�m thu�c l�m l�i thu�c. ")
end;
