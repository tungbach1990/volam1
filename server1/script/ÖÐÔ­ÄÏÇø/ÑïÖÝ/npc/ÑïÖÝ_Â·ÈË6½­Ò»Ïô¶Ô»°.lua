--中原南区 扬州府 路人6江一萧对话

Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(194) == 1 then
		allbrother_0801_FindNpcTaskDialog(194)
		return 0;
	end
	Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 ~= 0 ) then
		branch_jiangyixiao()
	else
		i = random(0,1)

			if (i == 0) then
			Say("Kh玭g c� c� g竔 n祇 s竛h b籲g c� 蕐, trong m総 ta, ch� c� m閠 m譶h n祅g. Nh璶g v� sao th� ta kh玭g gi秈 th輈h 頲?",0)
			return
			end;
			
			if (i == 1) then
			Say("Ta tuy ngh蘯, nh璶g ta i v韎 Hi觰 Ch﹏ l� th藅 l遪g!",0)
			end;
			
			
	end
end

