-------------------------------------------------------------------------
-- FileName		:	NewWorldScript_H.lua
-- Author		:	LuoBaohang
-- CreateTime	:	2005-09-02
-- Desc			:  	��ͼ�л������ű�
-------------------------------------------------------------------------
Include("\\script\\lib\\string.lua")
Include("\\script\\maps\\newworldscript_h.lua")
Include("\\script\\maps\\maplimit.lua")
Include("\\script\\item\\tianziyuxi.lua");	-- ��������

Include("\\script\\misc\\eventsys\\type\\map.lua")
aryChangeWorldExec = {}
W,X,Y =0

function PraseParam(szParam)
	if (szParam == nil) then
		return nil
	end
	if (aryChangeWorldExec[SubWorld] == nil) then	--��û�к���������������
		aryChangeWorldExec[SubWorld] = {}
		local aryFuns = split(szParam, '|')
		local j=1;
		for i = 1,getn(aryFuns) do
			local ExecFun = aryFuncStore[aryFuns[i]]
			if (ExecFun == nil)then
				print("Error: (Ne v�n v�norld:%d) Ch�a ��nh ngh� h�m s�%s", SubWorld, aryFuns[i])
			else
				aryChangeWorldExec[SubWorld][j] =  ExecFun;
				j = j+1;
			end	
		end
	end
	return 1;
end

function OnNewWorldDefault(szParam)
	-- nW,nX,nY = GetWorldPos()

	-- if CheckMapEnter() < 1 then
	-- 	print("Map enter Vuot cap !!!!!")
	-- 	if (W == nil or X == nil or Y ==nil )then
	-- 		print("Map enter is Nil Value")
	-- 		--NewWorld(53, 1626, 3179)--ph� ba l�ng huy�n
	-- 	elseif (nW == W) then
	-- 		print("Gia tri map bang nhau")
	-- 		--NewWorld(53, 1626, 3179)--ph� ba l�ng huy�n
	-- 	else
	-- 		print("Ok,Phu ve noi truoc do")
	-- 		print(W)
	-- 		print(X)
	-- 		print(Y)
	-- 		--NewWorld(W, X, Y)--ph� v� n�i tr��c ��
	-- 	end
	-- 	Talk(1,"","N�i ��i hi�p v�a b��c ch�n t�i c�c k� nguy hi�m. Ta �� may m�n ��a ���c ��i hi�p v� ��y !")
	-- 	Msg2Player("N�i ��i hi�p v�a b��c ch�n t�i c�c k� nguy hi�m. Ta �� may m�n ��a ���c ��i hi�p v� ��y !")
	-- end


	-- if CheckMapEnter() < 1 then
	-- 	NewWorld(53, 1626, 3179)--ph� ba l�ng huy�n
	-- 	Talk(1,"","N�i ��i hi�p v�a b��c ch�n t�i c�c k� nguy hi�m. Ta �� may m�n ��a ���c ��i hi�p v� ��y !")
	--     Msg2Player("N�i ��i hi�p v�a b��c ch�n t�i c�c k� nguy hi�m. Ta �� may m�n ��a ���c ��i hi�p v� ��y !")
	-- end

	--print("OnNewWorldDefault invoked!!!")
	if (PraseParam(szParam) == 1) then
		for i = 1,getn(aryChangeWorldExec[SubWorld]) do	--ִ�к�����
			aryChangeWorldExec[SubWorld][i](1)
		end
	end
	
	YuXiChangeMapMsg();
	EventSys:GetType("EnterMap"):OnPlayerEvent(SubWorldIdx2ID(SubWorld), PlayerIndex)
	EventSys:GetType("EnterMap"):OnPlayerEvent("ALL", PlayerIndex)
end

function OnLeaveWorldDefault(szParam)
	 W,X,Y = GetWorldPos(); --l�u l�i v� tr� tr��c khi tr�i map

	print("OnLeaveWorldDefault invoked!!!")
	if (PraseParam(szParam) == 1) then
		for i = 1,getn(aryChangeWorldExec[SubWorld]) do	--ִ�к�����
			aryChangeWorldExec[SubWorld][i](0)
		end
	end
	EventSys:GetType("LeaveMap"):OnPlayerEvent(SubWorldIdx2ID(SubWorld), PlayerIndex)
	EventSys:GetType("LeaveMap"):OnPlayerEvent("ALL", PlayerIndex)
end