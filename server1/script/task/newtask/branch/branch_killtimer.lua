-- ɱ�ּ����ű�
-- by xiaoyang(2005\1\23)

Include("\\script\\task\\newtask\\newtask_head.lua")

function killwolfone(nPlayerIdx, nTaskID)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIdx
	local Uworld1011 = nt_getTask(1011)
	local Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 == 80 ) and ( Uworld1011 == 10 ) then
		nt_setTask(1011,20)
		Msg2Player("B�n �� l�y ���c X��ng S�i, c� th� tr� v� g�p Ng�o V�n T�ng!")
	end
	PlayerIndex = oldPlayerIndex
end

function killhedgehog(nPlayerIdx, nTaskID)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIdx
	local Uworld1012 = nt_getTask(1012)
	local Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 == 20 ) and ( Uworld1012 == 10 ) then
		nt_setTask(1012,20)
		Msg2Player("B�n �� gi�t ���c Nh�m, c� th� �i D��ng Ch�u t�m Giang Nh�t Ti�u.")
	end
	PlayerIndex = oldPlayerIndex
end

function killmonkey(nPlayerIdx, nTaskID)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIdx
	local Uworld1012 = nt_getTask(1012)
	local Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 == 80 ) and ( Uworld1012 == 10 ) then
		nt_setTask(1012,20)
		Msg2Player("B�n �� c� ���c 50 b� �c kh�, c� th� v� Th�nh �� t�m Ch� Ti�u C�c.")
	end
	PlayerIndex = oldPlayerIndex
end

function killcayman(nPlayerIdx, nTaskID)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIdx
	local Uworld1013 = nt_getTask(1013)
	local Uworld1058 = nt_getTask(1058)
	if ( Uworld1058 == 20 ) and ( Uworld1013 == 10 ) then
		nt_setTask(1013,20)
		Msg2Player("B�n �� gi�t ���c H�c Di�p H�u, c� th� v� Bi�n Kinh t�m Th�c B�t Ho�i Xuy�n.")
	end
	PlayerIndex = oldPlayerIndex
end

function killwolftwo(nPlayerIdx, nTaskID)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIdx
	local Uworld1013 = nt_getTask(1013)
	local Uworld1059 = nt_getTask(1059)
	if ( Uworld1059 == 20 ) and ( Uworld1013 == 10 ) then
		nt_setTask(1013,20)
		Msg2Player("B�n �� gi�t ���c S�i v�ng, c� th� tr� v� Bi�n Kinh t�m Th�c B�t Ho�i Xuy�n.")
	end
	PlayerIndex = oldPlayerIndex
end