--description: 唐门30级任务 青城山白云洞宝箱
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2);
	if (UTask_tm == 30*256+30) and (HaveItem(98) == 1) then					--得到钥匙一
		DelItem(98)
		AddEventItem(42) 
		Msg2Player("L蕐 頲 H醓 Kh� Ph� ")
		SetTask(2, 30*256+50)
		AddNote("M� rng l蕐 頲 Ho� Kh� Ph� ")
	elseif (UTask_tm >= 30*256+50) and (UTask_tm <= 30*256+60) and (HaveItem(42) == 0) then			-- 道具丢了
		AddEventItem(42) 
		Talk(1,"","H鉧 ra 'H醓 Kh� Ph�' ngi  b� qu猲 trong rng b竨!")
	elseif (UTask_tm > 30*256+30) then 
		Talk(1,"","B秓 rng  r鏽g")
	else
		Talk(1,"","Kh玭g c� ch譨 kh鉧, kh玭g m� 頲 rng b竨!.")
	end
end;
