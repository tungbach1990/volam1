--donewworldparam.lua

Include("\\script\\lib\\string.lua")
Include("\\script\\maps\\newworldscript_h.lua")

aryChangeWorldExec = {}
function PraseParam(szParam)
	if (szParam == nil) then
		return nil
	end
	if (aryChangeWorldExec[SubWorld] == nil) then	--��û�к���������������
		aryChangeWorldExec[SubWorld] = {}
		local aryFuns = split(szParam, '|')
		for i = 1,getn(aryFuns) do
			local ExecFun = aryFuncStore[aryFuns[i]]
			if (ExecFun == nil)then
				print("Error: (Ne v�n v�norld:%d) Ch�a ��nh ngh� h�m s�%s", SubWorld, aryFuns[i])
			else
				aryChangeWorldExec[SubWorld][i] =  ExecFun;			
			end	
		end
	end
	return 1;
end

function DoNewWorldParam(szParam, bIn)
	if (PraseParam(szParam) == 1) then
		for i = 1,getn(aryChangeWorldExec[SubWorld]) do	--ִ�к�����
			aryChangeWorldExec[SubWorld][i](bIn)
		end
	end
end
