IncludeLib("FILESYS")


KILLER = "\\settings\\task\\tollgate\\killer\\killer.txt"


function showkillertaskdesc(nTaskIdx, nTaskGenre)
	local Uworld1082  = GetTask(1082)
	local killernews = {"<color=yellow>NhiÕp ThÝ TrÇn<color> hiÖn ®ang chiªu mé mét nhãm s¸t thñ míi.<enter>. H·y mau ®Õn ®ã t×m ®­êng tiÕn th©n",
						"Thµnh §« (401,310)<enter>",
						"Ph­îng T­êng (188,199)<enter>",
						"BiÖn Kinh (205,190)<enter>",
						"L©m An (171,188)<enter>",
						"§¹i Lý (196,201)<enter>",
						"T­¬ng D­¬ng (189,200)<enter>",
						"D­¬ng Ch©u (212,185)<enter>",
						}
	if (TabFile_Load(KILLER, KILLER) == 0) then
		print("Load TabFile Error!"..KILLER)
		return
	end
	if( Uworld1082 == 0 ) then
		NewTask_TaskTextOut(nTaskGenre, killernews[1]..killernews[2]..killernews[3]..killernews[4]..killernews[5]..killernews[6]..killernews[7]..killernews[8])
	end
	if( Uworld1082 > 0 ) then
		NewTask_TaskTextOut(nTaskGenre, TabFile_GetCell(KILLER,Uworld1082+1,"BossName")..TabFile_GetCell(KILLER,Uworld1082+1,"BossInfo"))
	end
end