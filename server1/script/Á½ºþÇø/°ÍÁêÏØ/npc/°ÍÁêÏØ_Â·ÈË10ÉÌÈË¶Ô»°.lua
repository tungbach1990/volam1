--������ ������ ·��10��ŶԻ�
--�������������񣺰����ļ�ױ
--suyu
-- Update: Dan_Deng(2003-08-10)
--ע�⣺Խ��ֻ��һ��Ԫ�����൱�����ǵ���Ԫ�������ƽн�Ԫ����ǧ��ע�⣬����� 343

function main()
	UTask_world20 = GetTask(48)
	if (CheckStoreBoxState(1) == 0 and  UTask_world20 == 1) then			-- ���������ӵ������������򸽼Ӵ�����
		Say("Ta c� 1 r��ng th�n k�, kh�ng nh�ng gi� ���c nhi�u v�t m� c�n c� th� kh�a l�i an to�n. C� Trung Nguy�n ch� m�nh ta c�. C� mu�n xem th� kh�ng?   ",4,"�� ta xem th� /buy_addibox", "H�i th�m m�t ch�t/task_ring","V� vi�c r��ng m� r�ng/box_help", "Kh�ng h�ng th� /no")
	elseif (UTask_world20 == 1) then
		task_ring()
	elseif (CheckStoreBoxState(1) == 0) then
		Say("Ta c� 1 r��ng th�n k�, kh�ng nh�ng gi� ���c nhi�u v�t m� c�n c� th� kh�a l�i an to�n. C� Trung Nguy�n ch� m�nh ta c�. C� mu�n xem th� kh�ng?   ",3,"�� ta xem th� /buy_addibox", "V� vi�c r��ng m� r�ng/box_help", "Kh�ng h�ng th� /no")
	else
		other_chat()
	end
end;

function task_ring()
	UTask_world20 = GetTask(48);
	if (UTask_world20 == 1) then
		Say("Mu�n mua gi�m c� n��ng �y c�a h�i m�n �? H�ng h�a c�n l�i c�a ta kh�ng nhi�u, ch� c�n l�i ��i b�ng tai v�ng n�y l� kh� r�, ch� c� 200 l��ng",2,"Mua/yes", "T�n g�u/other_chat","Kh�ng mua/no")
	end
end

function other_chat()
	Talk(3,"", "Ta t� T� Xuy�n ��n, tr�n ���ng c� r�t nhi�u th� ph�,th�t l� nguy hi�m!", "Th�t kh�ng th� ng� ���c ta c� th� ��n khu v�c h� ��ng ��nh n�y m� kh�ng h� b� c��p! Ng��i th�y c� l� kh�ng?", "ta nghe ng��i ta n�i m�i bi�t, � ��y kh�ng ch�u s� qu�n l� c�a quan ph�, m� t� m�t ph�i t�n Thi�n V��ng Bang g� ��, h�n g� � ��y th�t y�n b�nh!")
end

function yes()
	if(GetCash() >= 200)then
		Talk(1,"","Khuy�n tai �� g�i l�i r�i! Xin gi� l�y!")
		Pay(200);
		AddEventItem(181);
		Msg2Player("B�n ���c m�t ��i b�ng tai");
		AddNote("B�n mua ���c m�t ��i b�ng tai � ch� th��ng nh�n �em v� giao cho A Ph��ng")
--		SetTask(48, 2);
	else
		Talk(1,"","Kh�ch quan ch�a �� ti�n! Khi n�o c� �� ti�n h�y quay l�i. ")
	end
end;

function buy_addibox()
		local szMsg = 
		{
				"Th�m C�u: ��y l� chi�c r��ng ���c l�m t� �� san h� xanh, c� th� cho ng��i b� th�m v�t ph�m, c�n c� th� kh�a l�i m�t c�ch an to�n.",	--1
				"D�ng 40 ti�n ��ng �� mua./#buy_addibox_yes(40)",	--2
				"D�ng 20 ti�n ��ng �� mua./#buy_addibox_yes(20)",	--3
				"��t qu�! L�n sau s� mua! /no",			--4
		};
		
		local nDate = tonumber(GetLocalDate("%Y%m%d"));
		
		if (nDate >= 20080202 and nDate <= 20080302) then	--���ڻ�ڼ���
			Say(szMsg[1], 2, szMsg[3], szMsg[4]);
		else
			--tinhpn 20100803: Patch Request
			--Say(szMsg[1], 2, szMsg[2], szMsg[4]);
			Say(szMsg[1], 2, szMsg[3], szMsg[4]);
		end;
				
end

function buy_addibox_yes(nNedCount)
	if (nNedCount < 1 or nNedCount == nil) then
		print("Fail!!!!");
		return
	end;
	
	local nCount = CalcEquiproomItemCount(4, 417, 1, 1)
	
	if (nCount < nNedCount) then
		Talk(1,"","Kh�ch quan ch�a �� ti�n! Khi n�o c� �� ti�n h�y quay l�i.")
		return 1;
	end
	ConsumeEquiproomItem(nNedCount, 4, 417, 1, 1)
	
	WriteGoldLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName()..format("]: T�n %d Ti�n ��ng, nh�n ���c 1 r��ng m� r�ng.",nNedCount),-2,0,0,0);
	OpenStoreBox(1)
	
	UseSilver(1, 2, nNedCount); -- ��Ԫ���һ�ΪͭǮ������ͳ��(ֱ�����ĵ�Ԫ����Ʊ����ͭǮ�һ���ͬ����)
	SaveNow(); -- ��������
	  	
	Talk(1,"","T�t qu�! �� ti�n r�i! Ta s� l�p t�c l�p ��t r��ng! V� sau kh�ch quan ch� c�n ��n n�i c� r��ng ch�a �� c�a m�nh m� <color=yellow>r��ng m� r�ng<color> l� c� th� d�ng ���c. ")
	Msg2Player("B�n �� mua ch�c n�ng m� r�ng r��ng, kh�ng gian l�u tr� �� t�ng l�n! M� r��ng ra b�n s� s� d�ng ���c ch�c n�ng n�y. ")
end


function box_help()
	str=
	{
	"<#> M�i nh�n v�t ch� mua ���c m�t ch�c n�ng m� r�ng r��ng th�i. N� s� theo b�n su�t, g�m c� 60 �, ch�c n�ng v� nguy�n l� s� d�ng gi�ng nh� r��ng ban ��u ch� kh�ng th� c�t gi� ti�n b�c.",
	"<#> Sau khi mua ch�c n�ng m� r�ng r��ng, b�n nh�n ���c m�t m�t m� d�ng �� b�o v� c�c trang b� tr�n ng��i c�ng nh� trong r��ng.",
	"<#> Sau khi nh�n v�o m�t m� s� kh�a l�i, c�n trong t�nh tr�ng th�i kh�a, trang b� tr�n ng��i kh�ng ���c m�c l�n c�ng nh� c�i b�, nh�ng n� s� kh�ng �nh h��ng ��n ch�c n�ng s�n c� (Nh� �i�m s� PK qu� cao th� s� r�t c�c trang b� tr�n ng��i) .",
	"<#> Vi�c thi�t l�p m�t m�: nh�n v�o giao di�n r��ng ch�a �� n�i <color=yellow>thi�t l�p m�t m�<color>, s� hi�n ra m�t � nh�, tr�n �� c� t� 0-9 s� �� nh�p v�o.",
	"<#> L�n ��u ti�n thi�t l�p m�t m� ta nh�n v�o h�ng ��, c�n n�u b�n �� thi�t l�p qua khi nh�n v�o s� l� ch�nh s�a m�t m�.",
	"<#> Khi ch�nh s�a m�t m� tr��c ti�n ta nh�p m�t m� c� v�o sau �� nh�n hai l�n m�t m� m�i, x�c nh�n ch�nh s�a th�nh c�ng. �� d�i m�t m� �t nh�t m�t k� t� s� d�i nh�t l� 9 k� t� s�.",
	};
	Talk(6,"",str[1],str[2], str[3], str[4], str[5], str[6]);
end
	
	
function no()
end;
