Include("\\script\\activitysys\\config\\30\\head.lua")
Include("\\script\\activitysys\\config\\30\\config.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

szEventName = "Event_NhaGiaoVN"

tbItem = {
	[1]={szName="C�y B�t",tbProp={6,1,3040,1,0,0},nExpiredTime=20111201},
}

tbBaizhi = {
	[1]={szName="Gi�y Tr�ng",tbProp={6,1,3039,1,0,0},nExpiredTime=20111201,nRate=5,}, 
}

	
-- nKind �������ͣ�1Ϊ����1000��С��3000��2Ϊ����3000
function pActivity:GiveSongjinAward(nKind)
	--print("�ν������nKind = " .. nKind)
	local tbSongjin = {
		[1] = {10, "TongKim1000NhanCayBut"},	
		[2] = {30, "TongKim3000NhanCayBut"}
		}

	if tbSongjin[nKind] then
		tbAwardTemplet:Give(tbItem, tbSongjin[nKind][1], {szEventName,tbSongjin[nKind][2]})
	end
end

-- nKind �������ͣ�1Ϊ����17��2Ϊ����28��
function pActivity:GiveChuangguanAward(nGuan)
--	print("ʱ�����ս���سɹ���nguan = " .. nGuan)
	local tbChuangguan = {
		[17] = {10, "VuotAi17NhanCayBut"},	
		[28] = {10, "VuotAi28NhanCayBut"}
		}

	if tbChuangguan[nGuan] then
		tbAwardTemplet:Give(tbItem, tbChuangguan[nGuan][1], {szEventName,tbChuangguan[nGuan][2]})
	end
end

-- ɱ��
function pActivity:GiveShashouAward()
--	print("ɱ��ɱ��boss�ɹ�")
	local tbShashou = {2, "TieuDietBossSatThuNhanCayBut"}
	tbAwardTemplet:Give(tbItem, tbShashou[1], {szEventName,tbShashou[2]})
end

-- �׵۱��� ����10��
function pActivity:GiveYDBZAward(nGuan)
--	print("�׵۱��ش���10��")
	local tbYDBZ = {
		[10] = {15, "VuotAiViemDe10NhanCayBut"},
	}
	if tbYDBZ[nGuan] then
		tbAwardTemplet:Give(tbItem, tbYDBZ[nGuan][1], {szEventName,tbYDBZ[nGuan][2]})
	end
end

-- �����
-- nKind 1 Ϊɱ��ˮ��ͷ�죬2Ϊɱ��ˮ����ͷ��
function pActivity:GiveFenglinduAward(nKind)
--	print("ɱ��ˮ��ͷ��ɹ�, nKind = " .. nKind)
	local tbFenglingdu = {
		[1] = {5, "TieuDietThuyTacDauLinhNhanCayBut"},	
		[2] = {10, "TieuDietThuyTacDaiDauLinhNhanCayBut"}
		}

	if tbFenglingdu[nKind] then
		tbAwardTemplet:Give(tbItem, tbFenglingdu[nKind][1], {szEventName,tbFenglingdu[nKind][2]})
	end
end

-- �ƽ�boss
function pActivity:GiveGoldBossAward()
--	print("ɱ���ƽ�boss�ɹ�")
	local tbGoldBoss = {20, "TieuDietBossTheGioiNhanCayBut"}
	tbAwardTemplet:Give(tbItem, tbGoldBoss[1], {szEventName, tbGoldBoss[2]})
end

-- ָ����ͼҰ���ֵ����ֽ����
function pActivity:GiveYewaiguaiAward()
--	print("Ұ���ֳɹ�")
	local tbMonster = {1, "killedmonstergetpaper"}
	tbAwardTemplet:Give(tbBaizhi, tbMonster[1], {szEventName, tbMonster[2]})
end

pActivity.nPak = curpack()