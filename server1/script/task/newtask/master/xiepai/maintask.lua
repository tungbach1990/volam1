
Include("\\script\\task\\newtask\\newtask_head.lua");
-- Include("\\script\\task\\newtask\\master\\xiepai\\giveaward.lua");
Include("\\script\\task\\newtask\\master\\clearskillpoint.lua");
Include("\\script\\task\\newtask\\master\\newtaskprize.lua")

--   ////////////////////////////
--  //  а����������ģ��ʵ��  //
-- ////////////////////////////

-- Edited by peres
-- 2004/12/23

-- ���̺�����������ʽ��task_ + level(����ȼ�)_ + ���̻���ID


--   ///////////////////////////////
--  //  20 ����������Ĵ������  //
-- ///////////////////////////////

-- ���������ƶ��ĶԻ�
function task_level20_00()

		-- �ж���ҵ��Ա�˵��ͬ�Ļ�
		if (GetSex()==0) then
			Talk(10,"task_level20_01","�!Ch�o hi�p kh�ch! T�m ta c� vi�c g�?","�......Nghe n�i mu�i bi�t 'Thi�n Ho�ng Long Kh�'?","Ai da! ��ng nh�c ��n Long kh� H� kh�, n�i ch�t chuy�n vui v�i n� gia ���c kh�ng?","Vi�c n�y...... N�u mu�i bi�t tin t�c 'Thi�n Ho�ng Long Kh�'......c� th� n�i v�i ta ���c kh�ng......","H�m! Mu�n moi tin c�a ta ��u c� d�!","Mu�i mu�n th� n�o m�i ch�u n�i ra tung t�ch c�a Long Kh�?","�� xem ng��i c� th� l�m l�o n��ng vui kh�ng?","Chuy�n n�y......","Chuy�n n�y c�i g�? Ta ch� mu�n b�o ng��i ��n L�m An t�m <color=yellow>Th�i C�ng C�ng<color> l�y 1 b�nh Thi�n H��ng Ng�c Chi Cao."," Ta t��ng......��n gi�n th�i, t�m <color=yellow> Th�i C�ng C�ng<color> l�y Thi�n H��ng Ng�c Chi Cao ��ng kh�ng? H�y ch� tin ta!");
		else
			Talk(8,"task_level20_01","Ti�u mu�i t�m t� t� c� vi�c g�?","�......T� t� bi�t tung t�ch 'Thi�n Ho�ng Long Kh�'?","Thi�n Ho�ng Long Kh�? Nghe ra h�nh nh� l� th� ��t ti�n �......Ti�u mu�i h�i vi�c n�y �� l�m g�?","Ta r�t hi�u k�, mu�n xem th� n� l� c�i g� m� ai c�ng mu�n c� v�y?","�......G�n ��y ta g�p m�t chuy�n kh� kh�n, kh�ng bi�t mu�i mu�i c� th� gi�p ta ���c kh�ng?","���c! T� t� c� chuy�n g� xin c� n�i th�ng","G�n ��y kh� tr�i se l�nh, Th�i C�ng C�ng <color=yellow>� L�m An<color> c� 1 lo�i Thi�n H��ng Ng�c Chi Cao c� th� ch�ng phong h�n. Mu�i mu�i c� th� gi�p ta ��n g�p Th�i C�ng C�ng l�y 1 b�nh v� kh�ng?","R�t ��n gi�n, T� t� h�y ��i ta.");
		end
end

-- ���ƶ��ĶԻ���������ʽ��ʼа�����ߣ������������
function task_level20_01()
	nt_setTask(1003,20)
	DelItem(506)
end

-- ���ٰ��Ĳ̹����Ի�
function task_level20_02()
	Talk(8,"task_level20_03","Nghe n�i Th�i C�ng C�ng c� 1 lo�i Thi�n H��ng Ng�c Chi Cao?","C� th� c� ��y, nh�ng ng��i mu�n l�m gi?","Xem ra Th�i C�ng C�ng h�m nay t�m tr�ng kh�ng t�t l�m?","H�m tr��c b� 1 t�n Ti�u Th�i gi�m l�y tr�m c�a ta 1 pho t��ng Kim Ph�t, �� l� T�c Kim X�ch Ph�t, th�t l� t�c qu�!","Trong cung c�ng c� chuy�n m�t tr�m sao? T�n Th�i gi�m �� hi�n gi� � ��u?","H�m! T�n s�c sinh �� �� tr�n l�n <color=yellow>Ph�c Ng�u s�n<color>.","T�m ng��i l� tr� m� ta th�ch nh�t, n�u ta �em t��ng Ph�t tr� v� C�ng C�ng c� th� cho ta 1 b�nh Thi�n H��ng Ng�c Chi Cao kh�ng?","Ch� c�n ng��i �em t��ng Kim Ph�t v� ��ng n�i 1 b�nh c� r��ng ta c�ng cho ng��i!");	
end

-- ���꾩�Ĳ̹����Ի��������ı���������������������
function task_level20_03()
	nt_setTask(1003,30)
end

-- ɱ��С̫�����ʾ�Ѿ��õ�����������Ϊ 35�����ı���������������������
function task_level20_04()
	Msg2Player("B�n nh�n ���c 1 T�c Kim Ph�t T��ng!")
end

-- �õ����󣬻ص��꾩��̹����ĶԻ�
function task_level20_05()
	Talk(3,"task_level20_06","Th�i C�ng C�ng! ��y c� ph�i t��ng Kim Ph�t c�a �ng b� c��p �i?","A! Kh�ng ng� ng��i c� th� l�y v� cho ta!","B�n tr� l�m t�t l�m! ��y Thi�n H��ng Ng�c Chi Cao c�a ng��i.");
end

-- ���꾩�Ĳ̹����Ի��������õ�������֬�࣬�ı���������������������
function task_level20_06()
	nt_setTask(1003,50)
	Msg2Player("B�n nh�n ���c 1 b�nh Thi�n H��ng Ng�c Chi Cao!")
end



--   ///////////////////////////////
--  //  30 ����������Ĵ������  //
-- ///////////////////////////////

-- �õ�������֬������ƶ��ĶԻ�
function task_level30_01()
	Talk(8,"task_level30_02","Sao d�o n�y nhi�u ng��i ��n t�m ta h�i v� vi�c n�y v�y nh�?","T� c� bi�t l�m vi�c n�y kh� kh�n l�m kh�ng, h�y cho ta bi�t t� th�y 'Tr�n Minh Chi Li�n' � ��u?","Ng��i n�i s�i d�y chuy�n n�y �......Th�t ra m�y n�m tr��c ta c� nghe m�t ng��i ��n �ng t�ng n�i......","Ho�c l� m�y n�m tr��c nghe qua...","��ng v�y! Cho n�n tr��c ti�n b�o ng��i gi�p ta t�m b�nh g� �� m� th�i, n�u nh� ta c� ta �� b�o ng��i �i l�y vi�n minh ch�u tr�n ��u Ho�ng Th��ng v� r�i.","Ng��i ch�i:......Th� c� g�p qua ng��i ��n �ng c� s�i d�y chuy�n �� kh�ng?","L� m�t v� Ti�u s� ��n t� <color=yellow>D��ng Ch�u<color>, ngo�i ra ta c�ng kh�ng ���c r�.","Ti�u S� � <color=yellow>D��ng Ch�u<color>? ���c! Ta �i t�m h�n!");
end

-- ���ƶ��ĶԻ��������ı��������������������棬�ڴ˷��轱��
function task_level30_02()

local myText1, myText2, myText3 = "", "", ""
local curCamp = nt_getCamp()

	nt_setTask(1003,100)
	
	myText1 = "B�n nh�n ���c 30.000 �i�m kinh nghi�m"
	myText2 = "1 con ng�a c�p 20"
	myText3 = "M�t ��i gi�y"
	
	
	if (curCamp==2) then
		AddOwnExp(30000)
		AddItem(0,10,2,1,1,1)  --����20����
		AddGoldItem(0,184) --����һ˫20�ܵ�Ь��
		ex_add_xp_level20();
		
		Msg2Player("B�n nh�n ���c"..myText1);
		Msg2Player("B�n nh�n ���c"..myText2);
		Msg2Player("B�n nh�n ���c"..myText3);
		
		Say("Th�y ng��i c�c kh� v� ta, ta t�ng ng��i v�t n�y: <enter><enter><color=yellow>"..myText1.."<color><enter><color=yellow>"..myText2.."<color><enter><color=yellow>"..myText3.."<color>",0);		
	else
		AddOwnExp(30000)
		
		Msg2Player("B�n nh�n ���c"..myText1);
		
		Say("Th�y ng��i c�c kh� v� ta, ta t�ng ng��i v�t n�y: <enter><enter><color=yellow>"..myText1.."<color>",0);
	end
	
end


-- ��������ʦ�ĶԻ�
function task_level30_03()
	Talk(3,"task_level30_03_01"," Xin h�i v� ��i ca c� bi�t tung t�ch c�a 'Tr�n Minh Chi Li�n' kh�ng?","B�n tr�, ng��i nghe tin n�y t� ��u v�y? Tr��c ��y c� nghe Ti�u ��u H� H�u Ph�c c� m�t s�i d�y chuy�n ��c bi�t, nh�ng kh�ng bi�t l� 'Tr�n Minh Chi Li�n' g� ��.","Th� b�y gi� H� H�u Ph�c � ��u?");
end

-- �ж�����Ƿ��Ѿ��ﵽ�� 30 ��
function task_level30_03_01()
	if (GetLevel() >= 30) then
		nt_setTask(1003,109)
		task_level30_03_04()
	else
		task_level30_03_02()
	end
end


-- ���û�дﵽ 30 ��ʱ�ĶԻ���ı��������
function task_level30_03_02()
	nt_setTask(1003,108)
	Talk(2,"","Hai ngay n�a ta c� m�t chuy�n ti�u, ���ng r�t xa, kh�ng bi�t bao gi� m�i v�.","Ng��i hi�n nay c�n y�u qu�, hay l� ��i ��n c�p <color=yellow>c�p 30<color> h�y ��n t�m h�n.");
end

-- ����һ�εȼ�δ�� 30 �����ܾ�����δﵽ����ʱ�ٻ�������ʦ�Ի�
function task_level30_03_03()
	Talk(2,"task_level30_04","L�n tr��c h�i H� H�u Ph�c � ��u, b�y gi� c� th� tr� l�i ta r�i ch�?","H�n hi�n �ang chuy�n ti�u � <color=yellow>Thanh Th�nh s�n<color>, kh�ng bi�t l�c n�o m�i v�.");
end

-- �����ҵȼ��ﵽ�� 30 ��
function task_level30_03_04()
	Talk(1,"task_level30_04","H�n hi�n �ang chuy�n ti�u � <color=yellow>Thanh Th�nh s�n<color>, kh�ng bi�t l�c n�o m�i v�.");
end

-- ��������ʦ�Ի��������ı���������������������
function task_level30_04()
	nt_setTask(1003,110)
end

-- ���ĺս������ʤ��������Ի�
function task_level30_05()
	Talk(6,"task_level30_06","Nghe n�i huynh �ang gi� 'Tr�n Minh Chi Li�n'?","H�......Th� ra ng��i mu�n t�m m�n ��......Nh�ng m��i m�y n�m tr��c �� b� ng��i ��n b� �� l�y �i!","Ng��i ��n b� n�o? �ng h�y n�i r� h�n!","Ch�nh l� Th�i Ngh� v� ta......Nh�ng Thi�n h� r�ng l�n, ng��i mu�n t�m b� ta th� h�i kh�, ha ha ha......","Th�i Ngh�......?","Kh�ng bi�t l� ai, hay l� �i h�i <color=yellow>V�n Nhi<color>, c� th� c� ta bi�t.")
end

-- ���ĺ�ĶԻ������󣬸ı���������������������
function task_level30_06()
--	nt_setTask(1003,130)
	Msg2Player("B�n �� ��nh b�i H� H�u Ph�c, quay v� t�m V�n Nhi!");
end

-- �ص����������ƶ��ĶԻ�
function task_level30_07()
	Talk(9,"task_level30_08","Ng��i v�i v� quay l�i t�m ta c� vi�c g�?","Ta ��n h�i th�m h�nh tung 1 ng��i con g�i.","C� g�i n�o khi�n ng��i �i�n ��o th�?","Hi�u l�m r�i! Ng��i �� l� Th�i Ngh� v� tr��c c�a Ti�u s� H� H�u Ph�c.","Ng��i mu�n bi�t chuy�n g�?",".....�.","Ng��i h�y ��n Long Tuy�n th�n t�m <color=yellow>Ph� L�i Th�<color>, Y t� x�ng l� Giang Nam V�n S� Th�ng, c� v�ng Giang Nam chuy�n g� c�ng bi�t.","C� ng��i nh� th� �? �� ta �i xem th�.","L�n sau ��ng �i tay kh�ng ��n!");
end

-- ���ƶ��ĶԻ������󣬸ı�����������ҵ����������
function task_level30_08()
	nt_setTask(1003,140)
end

-- ������Ȫ���븵����ĶԻ�
function task_level30_09()
	Talk(17,"task_level30_10","Kh�! Kh�! Ai da! Ngh�o th�t l� kh�!..","L�o b� b�......","��n m�i l�o gi� n�y u�ng ru�u ch�ng?","L�o tr��ng phu......","B� ta gi� l�m r�i �?","L�o ti�n sinh...","�...... B�n tr� c� chuy�n g�?","Nghe n�i Ti�n sinh am hi�u v�ng Giang Nam, ta mu�n h�i th�m m�t ng��i?","Ha ha ha! B�n tr� h�i ��ng r�i ng��i r�i! Ta �� c� bi�t hi�u l� Giang Nam V�n S� Th�ng th� kh�ng c� chuy�n g� kh�ng bi�t.","Ha ha! Th� th� c�m �n l�o ti�n sinh.","V�y th� ��a ti�n ��y.","H�?!","H� c�i g�? Ch�ng l� mu�n bi�t chuy�n m� kh�ng ph�i tr� ti�n sao?","Vi�c n�y......Ta mu�n bi�t Th�i Ngh� v� c�a D��ng Ch�u Ti�u S� H� H�u Ph�c hi�n �ang � ��u m�t bao nhi�u ti�n?","T�m ng��i �......Th�n ph�n ng��i mu�n t�m c�ng cao th� ph�i tr� c�ng nhi�u ti�n, cho n�n mu�n bi�t Th�i Ngh� v� c�a H� H�u Ph�c......","Ng��i n�y lai l�ch kh�ng ��n gi�n, v�y ph�i m�t 1 v�n l��ng.","C�i g�! ��ng l�......#??%%?%");
end

-- �����ж�������������еĽ�Ǯ�Ƿ�ﵽҪ��
function task_level30_10()

local n

n = Pay(10000)

	if (n == 1) then -- ����ɹ��Ŀ۳������һ��������
		nt_setTask(1003,150)
		-- �ڴ�����ı���������ѡ�������������
		Talk(6,"task_level30_11","V�a ��ng 1 v�n l��ng. Th�i Ngh� v�n l� v� c�a H� H�u Ph�c, nh�ng do H� H�u Ph�c �am m� t�u s�c, ph� r�y Th�i Ngh�. Cu�i c�ng Th�i Ngh� quy�t ��nh chon con ���ng c�a m�nh","Th�i Ngh� quy�t t�m kh� luy�n ��c thu�t, trong 10 n�m ng�n ng�i �� luy�n th�nh......","Th� c� ta �ang � ��u?","Th�i Ngh� b�y gi� l� 1 trong Ng� ��i H��ng ch� <color=yellow>Ng� ��c gi�o<color> <color=yellow> M�c Th� H��ng ch�<color>!","Th� ra l� v�y....Th� t�m bi�t � ��y v�y.","L�n sau nh� �em nhi�u ti�n qua..");
	else
		Talk(2,"task_level30_12","Th�......�ng xem nhi�u ��y ti�n c� �� kh�ng?","B�n tr�, l�o tuy gi� nh�ng m�t v�n s�ng l�m, �� ti�n r�i quay l�i.");
	end
	
end

-- �ɹ��Ŀ۳�����ҵ�����֮�󣬸ı���������������������
function task_level30_11()
	nt_setTask(1003,150)
end

-- ���ϵ�Ǯ��������¼�����������������Ĺ���
function task_level30_12()
	nt_setTask(1003,151)
end

-- ֮ǰû��Ǯ�������������㹻�����Ӹ��������ĶԻ�
function task_level30_13()
	Talk(10,"task_level30_11","Th� n�o? �em ti�n �i h�i ng��i kh�c �?","......�ng ��m th� xem.?�au l�ng?","B�n tr�? Ng��i l�m sao th�? T�i sao l�i r�i n��c m�t?","Kh�ng sao......b� c�t v� m�t th�i......","V�a ��ng 1 v�n l��ng. Th�i Ngh� v�n l� v� c�a H� H�u Ph�c, nh�ng do H� H�u Ph�c �am m� t�u s�c, ph� r�y Th�i Ngh�. Cu�i c�ng Th�i Ngh� quy�t ��nh chon con ���ng c�a m�nh","Th�i Ngh� quy�t t�m kh� luy�n ��c thu�t, trong 10 n�m ng�n ng�i �� luy�n th�nh......","Th� c� ta �ang � ��u?","Th�i Ngh� l� m�t trong Ng� ��i H��ng ch� Ng� ��c gi�o M�c Th� H��ng ch�!","Th� ra l� v�y....Th� t�m bi�t � ��y v�y.","L�n sau nh� �em nhi�u ti�n qua..");
end

-- �����嶾�̺���ɣ��ĶԻ�
function task_level30_14()
	Talk(10,"task_level30_14_01","Sao ng��i d�m t� ti�m x�ng v�o ��y?","M�c H��ng ch� th� l�i! T�i h� m�o mu�i ��n h�i th�m tung t�ch  'Tr�n Minh Chi Li�n'.","Tr�n Minh Chi Li�n? Ta ch�a t�ng nghe qua m�n n�y.","Ta nghe..... ch�ng tr��c c�a b� n�i, l�c b� b� �ng ta c� �em theo s�i d�y chuy�n ��.","H�! Th� ra l� th�! Ta c�ng mu�n bi�t tung t�ch c�a n�, n� � tr�n m�nh ��a con �� b� th�t l�c c�a ta!","M�c H��ng ch� c�n c� m�t ��a con?","H�......N�m �� sau khi r�i kh�i t�n ph� b�c �� ta �� mang thai..L�c ��a con ch�a �� tu�i trong m�t l�n chi�n lo�n ta �� th�t l�c n�. Bao n�m tr�i qua c� ngh� ��n chuy�n n�y th� ta..","Th� ra l� th�......Ta c� th� gi�p b� t�m tung t�ch c�a ��a con g�i.","N�u ng��i c� th� gi�p ta t�m ���c ��a con th� qu� t�t!","V�y M�c H��ng ch� c� ��i tin t�c c�a ta.");
end


function task_level30_14_01()
	Talk(1,"task_level30_15","Ng��i ch�i:?Th�m r�i! Thi�n h� l�n nh� v�y bi�t ��n ��u m� t�m ��a con th�t l�c nhi�u n�m hay l� quay v� g�p �ng gi� gi� �� h�i xem.?");
end

-- ��ɣ��Ի������󣬸ı���������������������
function task_level30_15()
	nt_setTask(1003,160)
end

-- �ص���Ȫ���븵����ĶԻ�
function task_level30_16()
	Talk(9,"task_level30_17","L�o......ti�n sinh.?l�i t�n ti�n r�i!?","B�n tr�, l�n n�y l�i mu�n h�i g�?","Ta mu�n bi�t con g�i c�a Tang Chu �ang � ��u? Mu�n bao nhi�u ti�n c� n�i!","�......C�i n�y......ta kh�ng l�y ti�n.","�i! V�n l�n c�m �n!","B�i v� ta c�ng kh�ng bi�t.","L�o...","Ta ��a th�i! Ng��i h�y ��n <color=yellow>V� �ang ph�i<color>, kh�ng ch�ng c� ch�t manh m�i.","C�m �n l�o ti�n sinh!");
end

-- �ص���Ȫ���븵����ĶԻ������󣬸ı��������������������棬�ڴ˷��轱��
function task_level30_17()

local myText1, myText2, myText3 = "", "", ""
local curCamp = nt_getCamp()

	nt_setTask(1003,170)
	
	myText1 = "80.000 �i�m kinh nghi�m"
	myText2 = "B�n nh�n ���c 1 kh�i m�o"
	
	if (curCamp==2) then
	
		AddOwnExp(80000)	
		AddGoldItem(0,177)
		ex_add_xp_level30();
		
		Msg2Player("B�n nh�n ���c"..myText1);
		Msg2Player("B�n nh�n ���c"..myText2);
		
		Say("B�n tr�! Giang h� r�t nguy hi�m! Ta c� v�t n�y c� th� gi�p ���c ng��i.<enter><enter><color=yellow>"..myText1.."<color><enter><color=yellow>"..myText2.."<color>",0);
	else
	
		AddOwnExp(80000)
		Msg2Player("B�n nh�n ���c"..myText1);
		
		Say("B�n tr�! Giang h� r�t nguy hi�m! Ta c� v�t n�y c� th� gi�p ���c ng��i.<enter><enter><color=yellow>"..myText1.."<color>",0);
	
	end
	
end


--   ///////////////////////////////
--  //  40 ����������Ĵ������  //
-- ///////////////////////////////



-- �����䵱�ɺ���Ҧʯ�ŵĶԻ�
function task_level40_01()
	Talk(9,"task_level40_01_01"," (Tr�n c� h�n �eo s�i d�y chuy�n g� l� qu�??","S�i d�y chuy�n n�y huynh t� ��u m� c�?","S�i d�y chuy�n n�y? Ta c�ng kh�ng r�......S� ph� n�i l�c nh�t ta v� tr�n ng��i �� c� n� "," (��ng l� huynh r�i! V�y s�i n�y nh�t ��nh l� Tr�n Minh Chi Li�n r�i!?","Th� Thi�u hi�p c� t�ng ngh� s� �i t�m m� kh�ng?","Chuy�n n�y ta tr��c gi� ch�a ngh� t�i, S� ph� hi�n nay Qu�c gia l�m n�n, ch�ng ta nh�ng ng��i t�p v� n�n g�p m�t ph�n s�c l�c.","Nh�ng c� th� m� ng��i �ang ch� ng��i? Ta t��ng c� th� gi�p huynh t�m l�i m� m�nh.","Th�t �? Ng��i �� g�p qua m� ta?","C� l� c� m�t ng��i ��ng th�t l� m� ng��i......ta c�ng kh�ng ch�c l�m, hay l� c�ng ta �i th�m b� ta m�t chuy�n?");
end

-- �Ի���չ
function task_level40_01_01()
	Talk(3,"task_level40_02","Nh�ng b�y gi� kh�ng ���c! V� �ang ph�i ta hi�n c� m�t t�n ph�n ��, y �� l�y l��c �� qu�n s� c� v�ng Giang Nam ��a cho Kim qu�c! Hi�n V� l�m Trung nguy�n t�t c� ��u truy b�t t�n n�y. Ng�y n�o ch�a l�y l�i Chi�n l��c �� ta �n ng� kh�ng y�n!"," (��y ��u ph�i l� vi�c c�a m�t m�nh ng��i!) ","Chi b�ng th� n�y, ta gi�p ng��i x� l� t�n b�i ho�i c�a V� �ang, sau �� c� th� c�ng ta �i t�m m� ng��i?");
end

-- �ж���ҵ�ǰ�ȼ��Ƿ�ﵽ�� 40 ��
function task_level40_02()

	if (GetLevel() >= 40) then
		nt_setTask(1003,209)
		Talk(3,"task_level40_04","N�u ng��i t�m ���c t�n ph�n �� �� th�t s� l� ph�c l�n c�a V� l�m! Ta ngh� ng��i c�ng n�n g�p ch�t s�c cho ��i T�ng!","��ng v�y!?Ch� c�n l�y ���c s�i d�y chuy�n c�a huynh c�i g� c�ng d� n�i?","Ph�n �� �� t�n <color=yellow>Ti�u V� Th��ng<color>, �ang tr�n tr�n <color=yellow>Th�c C��ng S�n<color>.",0);
	else
		Talk(1,"task_level40_03","Nh�ng m� ng��i kh�ng r�nh v� ngh�, ta ngh� ng��i ��ch kh�ng l�i h�n ��u, ��i ng��i ��t ��n <color=yellow>c�p 40<color> r�i t�nh.",0);
	end
	
end

-- ��ҵȼ����� 40 ���������ݴ����
function task_level40_03()
	nt_setTask(1003,208)
end

-- ��ҵȼ��Ѿ��ﵽ�� 40 ������������������ҵ����������
function task_level40_04()
	nt_setTask(1003,210)
end

-- ���սʤ��Ф�޳��󣬱�������������ҵ����������
function task_level40_05()
--	nt_setTask(1003,220)
	Msg2Player("B�n nh�n ���c B�n �� chi�n l��c c�a Trung nguy�n t� Ti�u V� Th��ng!");
-- ���������Ф�޳�����ֱ�Ӹı䣬�˴��������������
end

-- ���սʤ��Ф�޳���ص��䵱ɽ��Ҧʯ�ŶԻ�
function task_level40_06()
	Talk(10,"task_level40_06_01","A! �� do�t l�i Chi�n l��c ��! Ng��i �� gi�p V� l�m thanh tr� t�n b�i lo�i ��! Th�t s� ��ng ch�c m�ng!","Ha ha! Chuy�n nh� th�i m�! Ch�ng ta �i t�m m� c�a huynh �i!","B� ta hi�n �ang � ��u?","Ch�nh l� M�c Th� Ng� ��c gi�o Tang Chu.","C�i g�?","�? Sao v�y?"," Ng��i b�o ta �i g�p ng��i c�a Ng� ��c gi�o!? Kh�ng bao gi�!","?......Kh�ng c�n thay ��i nhanh v�y??","Nh�ng......b� ta l� m� c�a huynh! D�y chuy�n tr�n c� huynh ch�nh l� l�c b� sinh huynh �� �� l�i","X�a nay Ch�nh T� b�t ph�n l��ng l�p, ta th� kh�ng c� ng��i m� n�y!");
end

-- �Ի��ĵڶ���
function task_level40_06_01()
	Talk(2,"task_level40_07","S�i d�y chuy�n n�y ��a ng��i, n�i v�i b� ta sau n�y s� g�p l�i � tr�n chi�n tr��ng!","C�ng T� �� quy�t nh�......v�y ta kh�ng l�m phi�n n�a. (Ha ha! Th�t kh�ng ph� c�ng, V� �ang l�i c� nh�n t�i nh� th�??");
end

-- ����õ�����ڤ֮���󣬱������������
function task_level40_07()

local myText1, myText2, myText3 = "", "", ""
local curCamp = nt_getCamp()

	nt_setTask(1003,230)
	
	myText1 = "280.000 �i�m kinh nghi�m"
	myText2 = "B�n �� ���c t�y to�n b� �i�m k� n�ng!"	
	
	Msg2Player("B�n nh�n ���c Tr�n Minh Chi Li�n!");
	
	if (curCamp==2) then
		AddOwnExp(280000)
		ex_add_xp_level40();
		ClearMagicPoint()  --����40��ʱϴ��Ĺ���
		Talk(1,"task_level40_08","L�n n�y may nh� ng��i gi�p, nh�ng th� n�y ta t�ng ng��i <enter><enter><color=yellow>"..myText1.."<color><enter><color=yellow>"..myText2.."<color>");
	else
		AddOwnExp(280000)
		Talk(1,"task_level40_08","L�n n�y may nh� ng��i gi�p, nh�ng th� n�y ta t�ng ng��i <enter><enter><color=yellow>"..myText1.."<color>");
	
	end
	
-- �����ﵯ���������

end

-- ���������һ��Ӧ������
function task_level40_08()
	Talk(2,0,".....�.","S�i d�y chuy�n c� b� m�t g� ��...... Hay l� t�m <color=yellow>�ng gi� gi� ��<color> h�i th�m lai l�ch c�a 'Thi�n Ho�ng Long Kh�'.");
end


--   ///////////////////////////////
--  //  50 ����������Ĵ������  //
-- ///////////////////////////////

-- ����Ȫ���븵����ĶԻ�
function task_level50_01()
	Talk(5,"task_level50_01_01","Ti�n sinh! �ng bi�t lai l�ch c�a d�y chuy�n n�y?","V�t n�y......kh�ng ph�i l� 'Tr�n Minh Chi Li�n' trong 'Thi�n Ho�ng Long Kh�' sao?","V�y cu�i c�ng Long Kh� c� b� m�t g�?","Ng��i c� bi�t  'Thi�n Ho�ng Long Kh�' t�ng c�ng c� 8 c�i, ���c ch� t�o t�i H�m D��ng. Sau �� T�n Th�y Ho�ng qua ��i n� c�ng m�t t�ch theo. N�u t�p h�p �� 8 m�n s� bi�t ���c 1 b� m�t kinh ng��i.","M�t b� m�t kinh ng��i? V�y cu�i c�ng l� th� n�o?");
end


function task_level50_01_01()
	Talk(9,"task_level50_02","Vi�c n�y...... Ng��i ch� c� t�m �� 8 m�n Long Kh� m�i c� th� bi�t.","�ng bi�t tung t�ch c�c m�n Long Kh� c�n l�i kh�ng?","N�u nh� ta bi�t ta c�n c� m�ng tr�n ��i sao? Trong V� l�m g�n ��y s� ng��i ch�t v� m�y m�n �� n�y kh�ng �t......","L� n�o th�t s� hi�m nguy ��n v�y sao?","B�n tr� nghe n�i ng��i r�t c� ch�? Tin t�c Long Kh� h�u nh� ai c�ng bi�t ch�t �t......","Nh�ng ph�i n�p ti�n ��ng kh�ng?","Kh�! Kh�! Ch� l� �� u�ng r��u th�i m�! Tin t�c kh�ng ��ng ta kh�ng l�y ti�n.","Kim  qu�c �ang ph�t sinh kh�ng �t chuy�n, h�nh nh� c� li�n quan ��n 'B�n Long C�i'!","Kim qu�c?.....ta s� ��n <color=yellow>Bi�n Kinh<color> t�m ch�t manh m�i! C�m �n ti�n sinh!");
end


-- �븵����Ի��󣬱�������������ҵ����������
function task_level50_02()
	nt_setTask(1003,300)
end

-- ���꾩������ĶԻ�
function task_level50_03()
	Talk(5,"task_level50_04","G�n ��y Kim binh kh�ng bi�t �ang l�m g�, c� ng�y tri�u t�p binh m� trong th�nh, h�nh nh� �ang t�m th� g�......","C� bi�t b�n ta �ang t�m g� �?","Chuy�n c�a ng��i Kim ta n�o d�m h�i! N�u nhi�u chuy�n s� b� �i t� n�a n�m, ta c�n ph�i lo vi�c nh� n�a!","Th�i nay ch� c� nh�ng k� ch�u lu�n c�i Kim qu�c m�i ���c s�ng an nh�n, ng��i h�y nh�n <color=yellow>Tr�n Tam B�o<color> xem, h�n ���c bao nhi�u ng��i ng��ng m�.","Th� �......xem ra <color=yellow>Tr�n Tam B�o<color> ti�p x�c v�i ng��i Kim kh�ng �t.");
end

-- ������Ի������󣬱�������������ҵ����������
function task_level50_04()
	nt_setTask(1003,310)
end

-- ���꾩��������Ի�
function task_level50_05()
	Talk(8,"task_level50_06"," Ai......","V� ��i ca n�y sao l�i � ��y than ng�n th� d�i?","Xem ra t�nh m�ng c� gia ��nh m�t trong tay ta......","Chuy�n g� m� nghi�m tr�ng th�?","�� ��n ��i nh�n trong tri�u mu�n m�t b�nh Lam Hoa, ai ng� ta nh� ng��i v�n chuy�n t� C�nh ��c tr�n b� gi�c c��p �i!","L�n nay e r�ng t�nh m�ng c� gia ��nh kh� b�o to�n......","Xem ra l�n n�y t�nh m�ng c� nh� �ngth�t s� mong manh! Kh�ng sao ��u, ta s� gi�p �ng.","Th�t �......?");
end

-- �ж���ҵȼ��Ƿ�ﵽ 50 ����֮���ٽ���������
function task_level50_06()
	if (GetLevel() >= 50) then
		nt_setTask(1003,329)
		Talk(3,"task_level50_08","���ng nhi�n, c�i b�nh �ng n�i b� c��p � ��u?","C� m�t t�n ��o t�c t�n <color=yellow>L�c Phi<color=> � g�n <color=yellow>Nh�n ��ng S�n<color>......","���c r�i! H�y ch� � ��y ta gi�p �ng l�y l�i!");
	else
		Talk(1,"task_level50_07","Ng��i......th�t s� c� th� gi�p ta? Th�y ng��i nh� th� ta c�ng kh�ng nh�n t�m nh�n ng��i ch�u ch�t. Hay l� ng��i luy�n ��n c�p 50 h�y t�nh.");
	end
end

-- �����ҵȼ�û�дﵽ 50 ���ĶԻ����������������
function task_level50_07()
	nt_setTask(1003,328)
end

-- ��ҵȼ����� 50 ���������˳����������񣬵����������
function task_level50_08()
	nt_setTask(1003,330)
end

-- ���սʤ��½�Ǻ󱣴���������������������
function task_level50_09()
--	nt_setTask(1003,340)
	Msg2Player("B�n ��nh th�ng L�c Phi l�y ���c b�nh Lam Hoa!");
-- ���������½������ֱ�Ӹı䣬�˴��������������
end

-- ����õ���������ƿ�������������ĶԻ�
function task_level50_10()
	Talk(8,"task_level50_11","��y l� b�nh Lam Hoa �ng ��t mua kh�ng? Ta �� �em v� r�i.","A! ��ng l� b�nh �� ��n ��i nh�n th�ch! Ta th�t kh�ng d�m tin v�o m�t m�nh!","Ng��i �� c�u t�nh m�ng c� nh� ta, kh�ng bi�t ��n �n ng��i th� n�o?","Ch� l� chuy�n nh�! Ta ch� mu�n bi�t g�n ��y �� ��n ��i nh�n �ang l�m g�?","�� ��n ��i nh�n g�n ��y nh�n ���c 1 b�o v�t, nh�ng h�nh nh� �ng ta kh�ng mu�n ai bi�t chuy�n n�y.","A? Ch�ng l� �� l� 'B�n Long C�i'? V�y �� ��n ��i nh�n th��ng �i ��u?","�ng ta g�n ��y hay �i <color=yellow>Thi�t Th�p<color>, ng��i ��n �� c� th� g�p","���c! C�m �n ti�n sinh!");
end

-- �������������Ի������󣬸ı���������������������
function task_level50_11()
	nt_setTask(1003,350)
end

-- �����սʤ��ͽ�����˺󣬸ı��������
function task_level50_12()

local curCamp = nt_getCamp()

--	nt_setTask(1003,360)
	Msg2Player("B�n chi�n th�ng �� ��n ��i nh�n!");
	-- �������ͽ�����˶Ի������󣬵����������
	if (curCamp==2) then
		AddOwnExp(350000)
		AddExp_Skill_Extend(350000)
		AddItem(6,1,71,1,1,1)  --����һ���ɲ�¶
		ex_add_xp_level50();
	
		Msg2Player("B�n nh�n ���c 350.000 �i�m kinh nghi�m");
		Msg2Player("B�n nh�n ���c m�t b�nh Ti�n Th�o L� ");
	else
		AddOwnExp(350000)
		AddExp_Skill_Extend(350000)
		Msg2Player("B�n nh�n ���c 350.000 �i�m kinh nghi�m");
	end
	
	Talk(8,"","Ng��i......T�i sao ng��i l�i truy s�t ta?","R�t ��n gi�n! Ta mu�n l�y 'B�n Long C�i' c�a �ng","H�......Th� ra l� v� th� n�y.","R�t ti�c m�t th�ng tr��c �� b� Ho�n Nhan H�ng Khang c��p �i......","Ho�n Nhan H�ng Khang?","L� Qu�c s� ��i Kim Ho�n Nhan H�ng Khang! C� b�n l�nh th� h�y ��n t�m h�n!",".....�.","S� g� ch�! Ta s� ��n <color=yellow>Thi�n Nh�n Gi�o<color> xem th�!");
end


--   ///////////////////////////////
--  //  60 ����������Ĵ������  //
-- ///////////////////////////////

-- ��������̴̽������ľĶԻ�
function task_level60_01()
	Talk(6,"task_level60_02","Ng��i t�m Ho�n Nhan H�ng Khang l�m g�?","V� mu�n m�t m�n ��.","Ha ha ha...... L�n ��u ti�n th�y m�t ng��i nh� ng��i.","T�i sao?","D�m tr��c m�t Qu�c s� ��i Kim ��i v�t, tr�n th� gian n�y e l� ch� c� m�nh ng��i.","Nh�ng ta th�ch t�nh c�ch c�a ng��i,  ng��i ��n <color=yellow>Long M�n Tr�n<color> t�m mu�i mu�i c�a ta <color=yellow> �oan M�c Thanh<color>, ch� c� c� ta m�i bi�t Ho�n Nhan H�ng Khang � ��u.");
end

-- ���ľĶԻ��������ı���������������������
function task_level60_02()
	nt_setTask(1003,400)
end

-- �����������ľ��ĶԻ�
function task_level60_03()
	Talk(10,"task_level60_03_01","C� l� T� H� s� c�a Thi�n Nh�n Gi�o mu�i mu�i c�a �oan M�c Du�?","H�, ch�c l� anh ta b�o ng��i ��n ph�i kh�ng? Ng��i v� n�i v�i huynh �y, ta kh�ng bao gi� tr� v�!",".....�.","Tuy anh c� b�o ta ��n, nh�ng y kh�ng c� b�o c� quay v�.","V�y ng��i ��n ��y l�m g�?","Ta mu�n bi�t tung t�ch c�a Ho�n Nhan H�ng Khang.","Ng��i t�m H�ng Khang �� l�m g�?","V� trong tay h�n c� m�n �� ta c�n.","H�? Vi�c �� c�n ph�i xem ng��i c� kh� n�ng l�y m�n �� trong tay h�n kh�ng.","Ta ph�i l�m th� n�o m�i c� th� g�p y?");
end

-- �Ի���չ
function task_level60_03_01()
	Talk(4,"task_level60_04","Vi�c n�y......��  ta ngh� xem,  T��ng l�nh Li�u ��nh n��c T�ng �ang ch�ng l�i ��i Kim ta, n�u ng��i c� th� ��nh th�ng h�n c� l� ta s� cho ng��i g�p H�ng Khang.","T�i sao ta ph�i nghe l�i c�?","Ha ha! Ch� s� tr�n th� gian n�y ngo�i ta ra kh�ng c� ai bi�t h�nh tung c�a H�ng Khang.","V�y ���c, cho ta bi�t Li�u ��nh �ang � ��u?");
end

-- �ж���ҵȼ��Ƿ�ﵽ 60 ��
function task_level60_04()
	if (GetLevel() >= 60) then
		nt_setTask(1003,409)
		Talk(2,"task_level60_05","T�n kh�ng bi�t tr�i cao ��t r�ng �ang � <color=yellow> Linh C�c ��ng<color>, ng��i ��n l�y th� c�p h�n v� cho ta.",".....�.");
	else
		nt_setTask(1003,408)
		Talk(1,"","H�! Ng��i d�a v�o c�i g� m� mu�n gi�t Li�u ��nh? ��ng v�ng t��ng! ��n <color=yellow> c�p 60<color> h�y quay l�i ��y!");
	end
end

-- �����ҵȼ��ﵽ 60 ����������������������������
function task_level60_05()
	nt_setTask(1003,410)
end


-- ������սʤ���ζ�
function task_level60_06()

--	nt_setTask(1003,420)
	Msg2Player("B�n �� ��nh th�ng Li�u ��nh!");
	
	AddOwnExp(800000)
	AddExp_Skill_Extend(800000)
	Msg2Player("B�n nh�n ���c 800.000 �i�m kinh nghi�m!");
	
	Talk(10,"",":......",".....Ch�ng ng� Li�u ��nh ta......cu�i c�ng ch�t d��i tay ng��i T�ng!","Li�u t��ng qu�n, ta v�i ng��i v�n kh�ng th� kh�ng o�n, nh�ng v� th� c�p ng��i c� th� gi�p ta c� ���c m�n �� �ang c�n.","Ha ha......Ta ch�ng ng� ��u c�a Li�u ��nh ta ch� ��ng ��i m�t v�t g� th�i sao?","B�n Long C�i trong Thi�n Ho�ng Long Kh�.",":......","B�n tr�......L�i c�a b�n Kim kh�ng ��ng tin......","Thi�n Ho�ng Long Kh� m� ng��i mu�n t�m...m�t khi t�p h�p �� c� th� gi�p ��i T�ng �o�t l�i giang s�n, c�ng c� th� gi�p ��i Kim x�m chi�m ��i giang nam b�c, b� t�nh sinh linh �� th�n!"," T� ch�nh x�a nay v�n kh�ng ��i tr�i chung! Th�t u�ng cho ng��i.....",".....�.");
end

-- ���սʤ���ζ�֮��ص����������ľ��ĶԻ�
function task_level60_07()
	Talk(11,"task_level60_08","?n�m ��u Li�u ��nh xu�ng ��t?","��y l� ��u c�a Li�u ��nh.","R�t t�t! Qu� nhi�n kh�ng ph� l�ng ta.","��ng nhi�u l�i! Ho�n Nhan H�ng Khang hi�n �ang � ��u?","H�ng Khang �ang b�n, t�m th�i kh�ng th� g�p h�n ���c.","Ng��i gi�n v�i ta h�?","Ha ha...... Ng��i t��ng b�n c� n��ng l� k� hai l�i sao? Th�t ra H�ng Khang �� s�m bi�t ng��i mu�n g�.","V�y l� � g�?","Y bi�t ���c ng��i l� ng��i d�m b�n m�ng v� ��i Kim, cho n�n d�n ta t�ng ng��i m�n �� n�y.","Nh� l�y! Sau n�y l�m vi�c cho ��i Kim s� kh�ng thi�t th�i ��u. Ha! Ha! Ha!",".....�.");
end

-- ��ҵõ������壬а��������ʽ����
function task_level60_08()
	nt_setTask(1003,430)
	ex_add_xp_level60();
	Msg2Player("B�n nh�n ���c B�n Long C�i!");
	AddSkillState( 509, 1, 0, 180);
end