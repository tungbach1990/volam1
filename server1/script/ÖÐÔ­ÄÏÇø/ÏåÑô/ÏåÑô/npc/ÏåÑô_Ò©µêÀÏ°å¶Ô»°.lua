--description: ��ԭ���� ������ ҩ���ϰ�Ի� �䵱�ɳ�ʦ����
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

-- ���ƻ�Ԫ��¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main(sel)
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),1)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 2) then 
			Talk(2, "", "Hi�n gi� chi�n tr��ng b�nh d�ch k�o d�i, xin h�i c� c�ch n�o hay kh�ng?", "Mu�n tr� ch�a b�nh d�ch c�n 5 lo�i thu�c: <color=Red> ���ng Quy, H�p Hoan, Huy�n S�m, Ph�ng K�, Chu Sa <color>.H�y ��n <color=Red>��ng Ph�c Ng�u s�n<color> �� t�m!")
			SetTask(17, SetByte(GetTask(17),1,5))
			AddNote("Ch� d��c �i�m (201,202) cho bi�t c�n 5 lo�i d��c li�u: H�p Hoan, Huy�n S�m, ���ng Quy, Ph�ng K�, Chu Sa � ph�a ��ng Ph�c Ng�u S�n �� ch� thu�c")
		elseif (UTask_wd60sub == 5) then
			if ( HaveItem(107) == 1 and HaveItem(134) == 1 and HaveItem(135) == 1 and HaveItem(136) == 1 and HaveItem(137) == 1) then
				Talk(2, "", "Ta �� t�m �� 5 lo�i d��c ph�m, nh� �ng b�o ch� d��c ho�n ��a cho quan ph� chuy�n ��n chi�n tr��ng!", "Qu�c gia l�m nguy, l� con d�n ph�i c� tr�ch nhi�m v�i ��t n��c.Y�n t�m! Ta nh�t ��nh b�o ch� ngay �� k�p chuy�n ra ti�n tuy�n!")
				DelItem(107)
				DelItem(134)
				DelItem(135)
				DelItem(136)
				DelItem(137)
				SetTask(17, SetByte(GetTask(17),1,8))
				AddNote("T�m �� 5 lo�i d��c li�u giao cho �ng ch� d��c �i�m, ng�n ch�n ���c s� l�y lan c�a d�ch b�nh.")
				Msg2Player("T�m �� 5 lo�i d��c li�u giao cho �ng ch� d��c �i�m, ng�n ch�n ���c s� l�y lan c�a d�ch b�nh.")
			else
				Say("Mu�n tr� ch�a b�nh d�ch c�n 5 lo�i thu�c: <color=Red> ���ng Quy, H�p Hoan, Huy�n S�m, Ph�ng K�, Chu Sa <color>.H�y ��n <color=Red>��ng Ph�c Ng�u s�n<color> �� t�m!",
					2,
					"Ta ph�i mua tr��c �t d��c ph�m/yes",
					"ta �i t�m ngay ��y/no")
			end
		else
			Say("C�c lo�i thu�c tr� �� th��ng, tr�t th��ng, tr�ng th��ng, v�t c�t, b�ng ��y �� h�n ch� kh�c, ng��i mu�n mua thu�c g�?",
				3,
				"Giao d�ch/yes",
				--"Ta mu�n ch� t�o H�n Nguy�n Linh L�/refine",
				"Kh�ng giao d�ch/no")
		end
	else
		Say("C�c lo�i thu�c tr� �� th��ng, tr�t th��ng, tr�ng th��ng, v�t c�t, b�ng ��y �� h�n ch� kh�c, ng��i mu�n mua thu�c g�?",
			3,
			"Giao d�ch/yes",
			--"Ta mu�n ch� t�o H�n Nguy�n Linh L�/refine",
			"Kh�ng giao d�ch/no")
	end
end

function yes()
	Sale(12)  			--�������׿�
end

function no()
end
