Include("\\script\\event\\shengdan_jieri\\200911\\plant.lua")

TIME_START	= 1800		-- �ʱ���18:00��ʼ
TIME_END	= 2300		-- �ʱ����23:00����
DATE_START	= 091216	-- ���ʼ����
DATE_END	= 100125	-- ���������

function main()
	local CurrentDate = tonumber(GetLocalDate("%y%m%d"))
	local CurrentTime = tonumber(GetLocalDate("%H%M"))
	if (CurrentDate < DATE_START) then
		Msg2Player("Ho�t ��ng trang tr� c�y gi�ng sinh v�n ch�a b�t ��u m�.")
		return 1
	elseif (CurrentDate >= DATE_END) then
		Msg2Player("Ho�t ��ng trang tr� c�y gi�ng sinh �� k�t th�c.")
		return 1
	elseif (CurrentTime < TIME_START or CurrentTime >= TIME_END) then
		Msg2Player("Ho�t ��ng trang tr� c�y gi�ng sinh di�n ra v�o m�i ng�y t� 18:00 ��n 23:00.")
		return 1
	elseif (CheckCondition() == 0 or PlantTree() == 0) then
		return 1
	else
		return 0
	end
end

