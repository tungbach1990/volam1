IncludeLib("FILESYS")
IncludeLib("PARTNER")

TabFile_Load( "\\settings\\task\\partner\\reward\\index_taskid.txt" , "taskindex");	 --获得同伴修练的表格


function showpartnerdesc(nTaskIdx, nTaskGenre) --同伴任务系统
--------------------------------------------------------------同伴修练任务------------------------------------------------------
	NewTask_TaskTextOut(nTaskGenre, "<color=red>Ch祇 m鮪g b筺 n v韎 giao di謓 nhi謒 v� уng h祅h: <color>")
	if ( GetTask(1237) ~= 0 ) then
		NewTask_TaskTextOut(nTaskGenre, "<color=red>B筺 ti誴 nh薾 nhi謒 v� luy謓 c蕄 уng h祅h: <color>")
		local nRowCount = TabFile_GetRowCount("taskindex")
		for i=2, nRowCount do
			local real_taskid  = tonumber( TabFile_GetCell( "taskindex" ,i,"index_taskid"))
			if ( GetTask(1237) == real_taskid ) then
				local real_content   =	TabFile_GetCell( "taskindex" ,i , "index_content")
				NewTask_TaskTextOut(nTaskGenre, "B筺 c莕 ph秈 ho祅 th祅h"..real_content.."nhi謒 v�. B筺  ti猽 di謙 xong"..GetTask(1236).."Con " )
			end
		end
	else
		--local NpcCount = PARTNER_Count() 
		NewTask_TaskTextOut(nTaskGenre, "Nhi謒 v� luy謓 c蕄 уng h祅h  ho祅 th祅h.")
		--if ( NpcCount ~= 0 ) then
			--for i=1,NpcCount do 
				--if (PARTNER_GetTaskValue(i,2) == 2) then
					--NewTask_TaskTextOut(nTaskGenre, "你已完成了"..GetTask(1241).."个同伴修练任务。可以回去领取奖励，也可以开启另一个修练卷轴了。" )
				--end		
			--end
		--end
	end	
	
-------------------------------------------------------------同伴教育任务---------------------------------------------------------
	if ( GetTask(1226) == 10 ) then
		NewTask_TaskTextOut(nTaskGenre, "<color=red>B筺  ti誴 nh薾 nhi謒 v� s� nh藀 уng h祅h: <color>")
		NewTask_TaskTextOut(nTaskGenre, "<color=yellow>Nhi謒 v� s� nh藀 уng h祅h ti課 h祅h � ch� c馻 L� Thanh, Л阯g 秐h, H綾 B筩h Song S竧, Thu Y Th駓. B筺  t譵 qua ai r錳?<color>")
		
		-------------------------------------------------卢青处-----------------------------------
		if ( GetTask(1227) == 10 ) then
			
			if ( GetTask(1232) == 255 ) and ( GetTask(1227) == 10 ) then
				NewTask_TaskTextOut(nTaskGenre, "B筺  ho祅 th祅h m鋓 nhi謒 v� � ch� V� s�, 甧m Th秓 dc v� cho L� Thanh.")
			else
				if ( GetBit(GetTask(1232),1) == 1 ) and ( GetBit(GetTask(1232),2) == 0 )  then
					NewTask_TaskTextOut(nTaskGenre, "Ho祅 th祅h nhi謒 v� i tho筰 v韎 M筩 Ti誹 Phong l蕐 頲 Dc th秓. T譵 M筩 Ti誹 Phong  nh薾 ph莕 thng.")
				elseif ( GetBit(GetTask(1232),2) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Ho祅 th祅h nhi謒 v� � ch� M筩 Ti誹 Phong, n t譵 V� s� l蕐 Dc th秓.")
				end
				
				if ( GetBit(GetTask(1232),3) == 1 )  and ( GetBit(GetTask(1232),4) == 0 )  then
					NewTask_TaskTextOut(nTaskGenre, "Th緉g cc у phu Ng璾 M穘 M穘 l蕐 頲 Dc th秓. T譵 Ng璾 M穘 M穘 nh薾 ph莕 thng.")
				elseif ( GetBit(GetTask(1232),4) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Ho祅 th祅h nhi謒 v� � ch� Ng璾 M穘 M穘, n t譵 V� s� l蕐 Dc th秓.")
				end
				
				if ( GetBit(GetTask(1232),5) == 1 )  and ( GetBit(GetTask(1232),6) == 0 )  then
					NewTask_TaskTextOut(nTaskGenre, "Ho祅 th祅h nhi謒 v�, i tho筰 v韎 Ti觰 nh l蕐 頲 Th秓 dc, t譵 Ti觰 nh nh薾 ph莕 thng.")
				elseif ( GetBit(GetTask(1232),6) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Ho祅 th祅h nhi謒 v� � ch� Ti觰 nh, n t譵 V� s� l蕐 Dc th秓.")
				end
			
				if ( GetBit(GetTask(1232),7) == 1 )  and ( GetBit(GetTask(1232),8) == 0 )  then
					NewTask_TaskTextOut(nTaskGenre, "Th緉g cc V﹏ Tc Nhi, l蕐 頲 Th秓 dc. T譵 V﹏ Tc Nhi nh薾 ph莕 thng.")
				elseif ( GetBit(GetTask(1232),8) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Ho祅 th祅h nhi謒 v� � ch� V﹏ Tc Nhi, n t譵 V� s� l蕐 Dc th秓.")
				end
			end
			
		elseif ( GetTask(1227) == 20 ) then
			NewTask_TaskTextOut(nTaskGenre, "<color=red>B筺  h鋍 xong � ch� L� Thanh, c� th� 甶 t譵 ngi kh竎.<color>")
		end
		
		------------------------------------------唐影-------------------------------------
		if ( GetTask(1228) == 20 ) then
			NewTask_TaskTextOut(nTaskGenre, "<color=red> ho祅 th祅h nhi謒 v� c馻 Л阯g 秐h.<color>")
		elseif ( GetTask(1228) == 8191 ) then
			NewTask_TaskTextOut(nTaskGenre, "Л阯g 秐h sau khi bi誸 頲 tin t鴆 c馻 Ti觰 Thu Y vui m鮪g kh玭 xi誸, cho b筺 bi誸 nhi襲 b� m藅 li猲 quan уng h祅h. цi tho筰 v韎 y l莕 n鱝  nh薾 ph莕 thng.<color>")
		elseif ( GetBit(GetTask(1228),13) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "Л阯g Thu Y b秓 b筺 v� g苝 cha c� ta. C� ta s� v� sau.")
		elseif ( GetBit(GetTask(1228),12) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "Ti觰 Thu Y n鉯 th骳 th骳 kh玭g ch琲 v韎 c� b�. B筺 ra s鴆 khuy猲 c� b�, cu鑙 c飊g c� b� c騨g theo b筺 v�. цi tho筰 v韎 c� b�  l穘h ph莕 thng.")
		elseif ( GetBit(GetTask(1228),11) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "Tr竎 Phi Ph祄 n鉯 sau n骾 c� m閠 a b� c� kh� n╪g l� Л阯g Thu Y, h穣 qua xem th�!")
		elseif ( GetBit(GetTask(1228),10) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "Tr竎 Phi Ph祄 n鉯 chuy謓 khi課 ngi ta tng h緉 b� 甶猲. цi tho筰 v韎 y, xem y cho b筺 ph莕 thng g�.<color>")
		elseif ( GetTask(1228) == 511 ) then
			NewTask_TaskTextOut(nTaskGenre, "Ho祅 th祅h nhi謒 v� ch� C� Quan nh﹏, 甶 t譵 Tr竎 Phi Ph祄 th� nghi謒 甶!")
		elseif ( GetBit(GetTask(1228),1) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "Л阯g 秐h nh� b筺 v祇 con 阯g th莕 b�  c鴘 con c馻 玭g ta l� Л阯g Thu Y.")
			
			if ( GetBit(GetTask(1228),2) == 1 )  and ( GetBit(GetTask(1228),3) == 0 )  then
				NewTask_TaskTextOut(nTaskGenre, "Ho祅 th祅h nhi謒 v� ch� C� Quan nh﹏ th� 1, nh薾 ph莕 thng")
			elseif ( GetBit(GetTask(1228),3) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "nh薾 ph莕 thng ch� C� Quan nh﹏ th� 1, ti誴 t鬰 t譵 C� Quan nh﹏ th� 2")
			end
				
			if ( GetBit(GetTask(1228),4) == 1 ) and ( GetBit(GetTask(1228),5) == 0 )  then
				NewTask_TaskTextOut(nTaskGenre, "Ho祅 th祅h nhi謒 v� ch� C� Quan nh﹏ th� 2, nh薾 ph莕 thng")
			elseif ( GetBit(GetTask(1228),5) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "nh薾 ph莕 thng ch� C� Quan nh﹏ th� 2, ti誴 t鬰 t譵 C� Quan nh﹏ th� 3")
			end
				
			if ( GetBit(GetTask(1228),6) == 1 ) and ( GetBit(GetTask(1228),7) == 0 )  then
				NewTask_TaskTextOut(nTaskGenre, "Ho祅 th祅h nhi謒 v� ch� C� Quan nh﹏ th� 3, nh薾 ph莕 thng")
			elseif ( GetBit(GetTask(1228),7) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "nh薾 ph莕 thng ch� C� Quan nh﹏ th� 3, ti誴 t鬰 t譵 C� Quan nh﹏ th� 4")
			end
				
			if ( GetBit(GetTask(1228),8) == 1 ) and ( GetBit(GetTask(1228),9) == 0 )  then
				NewTask_TaskTextOut(nTaskGenre, "Ho祅 th祅h nhi謒 v� ch� C� Quan nh﹏ th� 4, nh薾 ph莕 thng")
			elseif ( GetBit(GetTask(1228),9) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "nh薾 ph莕 thng ch� C� Quan nh﹏ th� 4, ti誴 t鬰 t譵 C� Quan nh﹏ th� 5")
			end
		end
		
		------------------------------------------------白煞-------------------------------------------
			if ( GetTask(1229) == 20 ) then
				NewTask_TaskTextOut(nTaskGenre, "<color=red>Ho祅 th祅h nhi謒 v� c馻 B筩h S竧.<color>")
			elseif ( GetTask(1229) == 31 ) then
				NewTask_TaskTextOut(nTaskGenre, "quay v� t譵 B筩h S竧 i tho筰.")
			elseif (  GetBit(GetTask(1229),1) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "B筩h S竧 nh� b筺 甶 v祇 th竝 Tam Чo S� v� mi誹 th� T� qu� ph� � ph輆 nam V﹏ Trung Tr蕁  c鴘 2  t� c馻 玭g ta")
				
				if (  GetBit(GetTask(1229),2) == 1 ) and  (  GetBit(GetTask(1229),3) == 0 ) then
					NewTask_TaskTextOut(nTaskGenre, "Kh骳 V筺 cho b筺 bi誸 nhi襲 甶襲 li猲 quan n уng h祅h. цi tho筰 v韎 y  nh薾 ph莕 thng.")
				elseif (  GetBit(GetTask(1229),3) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Sau khi i tho筰 v韎 Kh骳 V筺, n t譵 1 v�  t� kh竎 c馻 B筩h S竧 l� T� Thanh Nhi. C� ta � mi誹 th阨 T� qu� ph�.")
				end
				
				if (  GetBit(GetTask(1229),4) == 1 ) and  (  GetBit(GetTask(1229),5) == 0 ) then
					NewTask_TaskTextOut(nTaskGenre, "T� Thanh Nhi l� m閠 c� g竔 ki猲 cng, kh玭g khu蕋 ph鬰 trc s� m謓h. Tin r籲g ngi c騨g nh� th�, i tho筰 v韎 c� ta  l穘h ph莕 thng.")
				elseif (  GetBit(GetTask(1229),5) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Ho祅 th祅h nhi謒 v� � ch� T� Thanh Nhi, n t譵 1 v�  t� kh竎 c馻 B筩h S竧 l� Kh骳 V筺. Y i b筺 � th竝 Tam Чo s�.")
				end
			end
			
			-------------------------------------------黑煞----------------------------------
			if ( GetTask(1230) == 20 ) then
				NewTask_TaskTextOut(nTaskGenre, "<color=red>Ho祅 th祅h nhi謒 v� � ch� H綾 S竧.<color>")
			elseif ( GetTask(1230) == 16 ) then
				NewTask_TaskTextOut(nTaskGenre, "H綾 S竧 tuy nghi猰 kh綾 c鵦 畂an nh璶g thng ph箃 ph﹏ minh. цi tho筰 v韎 H綾 S竧  nh薾 ph莕 thng.")
			elseif ( GetTask(1230) == 15 ) then
				NewTask_TaskTextOut(nTaskGenre, " nh xong bao c竧, c� th� quay l筰 g苝 l穙 gia ta th豱h gi竜")
			elseif ( GetTask(1230) == 14 ) then
				NewTask_TaskTextOut(nTaskGenre, "L穙 Gia T� b秓 b筺 甶 v祇 hi謚 v� trng nh bao c竧. Xem ra kh玭g nh  s� l莕 th� kh玭g th� giao nhi謒 v�.")	
			elseif ( GetTask(1230) == 13 ) then
				NewTask_TaskTextOut(nTaskGenre, "B筺 nh薾 頲 1 quy觧 M藅  th莕 b�#Nam Minh Tam 筺 K輈h. цi tho筰 v韎 玭g ta, xem 玭g ta c遪 ki觤 tra g� n鱝")			
			elseif ( GetTask(1230) == 12 ) then
				NewTask_TaskTextOut(nTaskGenre, "L蕐 頲 M藅 t辌h, v� g苝 H綾 S竧 ph鬰 m謓h.")	
			elseif ( GetTask(1230) == 10 ) then
				NewTask_TaskTextOut(nTaskGenre, "L穙 Gia T� b秓 b筺 d総 ngi  t� b� m藅 trong hi謚 v� trng c馻 玭g.")	
			end
			
			
			------------------------------------------秋衣水-----------------------------------------
			if ( GetTask(1231) == 20 ) then
				NewTask_TaskTextOut(nTaskGenre, "<color=red>Nhi謒 v� Thu Y Th駓  ho祅 th祅h.<color>")
			elseif ( GetTask(1231) == 18 ) then
				NewTask_TaskTextOut(nTaskGenre, "Ho祅 th祅h nhi謒 v� � ch� Long B竧, quay v� t譵 Thu i t�!")
			elseif ( GetTask(1231) == 17 ) then
				NewTask_TaskTextOut(nTaskGenre, "Tr� l阨 ng c﹗ h醝 c馻 Long B竧 quay v� t譵 y nh薾 thng.")
			elseif ( GetTask(1231) == 16 ) then
				NewTask_TaskTextOut(nTaskGenre, "Nh薾 ph莕 thng t� Long B竧, xem y c遪 l阨 g� mu鑞 n鉯?")	
			elseif ( GetTask(1231) == 15 ) then
				NewTask_TaskTextOut(nTaskGenre, "Х ho祅 th祅h nhi謒 v�, h穣 甶 i tho筰 v韎 Long B竧.")			
			elseif ( GetTask(1231) == 10 ) then
				NewTask_TaskTextOut(nTaskGenre, "Thu Y Th駓 b秓 b筺 n Long Vng i t譵 Long B竧 l蕐 M藅 t辌h, m� ra xem v� nh c鋍 g�  luy謓 c玭g.<color>")	
			end
		elseif ( GetTask(1226) == 20 ) and (  GetBit(GetTask(1232),20) == 0 ) then		
			NewTask_TaskTextOut(nTaskGenre, "цi tho筰 v韎 Ki誱 Ho祅g  t�.")	
		elseif  ( GetTask(1226) == 20 ) and (  GetBit(GetTask(1232),20) == 1 ) then		
			NewTask_TaskTextOut(nTaskGenre, "tr� l阨 th祅h c玭g c﹗ h醝 c馻 Ki誱 Ho祅g  t�, quay v� t譵 y l穘h thng.")	
	end

end