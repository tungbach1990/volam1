IncludeLib("FILESYS")
IncludeLib("PARTNER")

TabFile_Load( "\\settings\\task\\partner\\reward\\index_taskid.txt" , "taskindex");	 --���ͬ�������ı��


function showpartnerdesc(nTaskIdx, nTaskGenre) --ͬ������ϵͳ
--------------------------------------------------------------ͬ����������------------------------------------------------------
	NewTask_TaskTextOut(nTaskGenre, "<color=red>Ch�o m�ng b�n ��n v�i giao di�n nhi�m v� ��ng h�nh: <color>")
	if ( GetTask(1237) ~= 0 ) then
		NewTask_TaskTextOut(nTaskGenre, "<color=red>B�n ti�p nh�n nhi�m v� luy�n c�p ��ng h�nh: <color>")
		local nRowCount = TabFile_GetRowCount("taskindex")
		for i=2, nRowCount do
			local real_taskid  = tonumber( TabFile_GetCell( "taskindex" ,i,"index_taskid"))
			if ( GetTask(1237) == real_taskid ) then
				local real_content   =	TabFile_GetCell( "taskindex" ,i , "index_content")
				NewTask_TaskTextOut(nTaskGenre, "B�n c�n ph�i ho�n th�nh"..real_content.."nhi�m v�. B�n �� ti�u di�t xong"..GetTask(1236).."Con " )
			end
		end
	else
		--local NpcCount = PARTNER_Count() 
		NewTask_TaskTextOut(nTaskGenre, "Nhi�m v� luy�n c�p ��ng h�nh �� ho�n th�nh.")
		--if ( NpcCount ~= 0 ) then
			--for i=1,NpcCount do 
				--if (PARTNER_GetTaskValue(i,2) == 2) then
					--NewTask_TaskTextOut(nTaskGenre, "���������"..GetTask(1241).."��ͬ���������񡣿��Ի�ȥ��ȡ������Ҳ���Կ�����һ�����������ˡ�" )
				--end		
			--end
		--end
	end	
	
-------------------------------------------------------------ͬ���������---------------------------------------------------------
	if ( GetTask(1226) == 10 ) then
		NewTask_TaskTextOut(nTaskGenre, "<color=red>B�n �� ti�p nh�n nhi�m v� s� nh�p ��ng h�nh: <color>")
		NewTask_TaskTextOut(nTaskGenre, "<color=yellow>Nhi�m v� s� nh�p ��ng h�nh ti�n h�nh � ch� c�a L� Thanh, ���ng �nh, H�c B�ch Song S�t, Thu Y Th�y. B�n �� t�m qua ai r�i?<color>")
		
		-------------------------------------------------¬�ദ-----------------------------------
		if ( GetTask(1227) == 10 ) then
			
			if ( GetTask(1232) == 255 ) and ( GetTask(1227) == 10 ) then
				NewTask_TaskTextOut(nTaskGenre, "B�n �� ho�n th�nh m�i nhi�m v� � ch� V� s�, �em Th�o d��c v� cho L� Thanh.")
			else
				if ( GetBit(GetTask(1232),1) == 1 ) and ( GetBit(GetTask(1232),2) == 0 )  then
					NewTask_TaskTextOut(nTaskGenre, "Ho�n th�nh nhi�m v� ��i tho�i v�i M�c Ti�u Phong l�y ���c D��c th�o. T�m M�c Ti�u Phong �� nh�n ph�n th��ng.")
				elseif ( GetBit(GetTask(1232),2) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Ho�n th�nh nhi�m v� � ch� M�c Ti�u Phong, ��n t�m V� s� l�y D��c th�o.")
				end
				
				if ( GetBit(GetTask(1232),3) == 1 )  and ( GetBit(GetTask(1232),4) == 0 )  then
					NewTask_TaskTextOut(nTaskGenre, "Th�ng c��c �� phu Ng�u M�n M�n l�y ���c D��c th�o. T�m Ng�u M�n M�n nh�n ph�n th��ng.")
				elseif ( GetBit(GetTask(1232),4) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Ho�n th�nh nhi�m v� � ch� Ng�u M�n M�n, ��n t�m V� s� l�y D��c th�o.")
				end
				
				if ( GetBit(GetTask(1232),5) == 1 )  and ( GetBit(GetTask(1232),6) == 0 )  then
					NewTask_TaskTextOut(nTaskGenre, "Ho�n th�nh nhi�m v�, ��i tho�i v�i Ti�u �inh l�y ���c Th�o d��c, t�m Ti�u �inh nh�n ph�n th��ng.")
				elseif ( GetBit(GetTask(1232),6) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Ho�n th�nh nhi�m v� � ch� Ti�u �inh, ��n t�m V� s� l�y D��c th�o.")
				end
			
				if ( GetBit(GetTask(1232),7) == 1 )  and ( GetBit(GetTask(1232),8) == 0 )  then
					NewTask_TaskTextOut(nTaskGenre, "Th�ng c��c V�n T��c Nhi, l�y ���c Th�o d��c. T�m V�n T��c Nhi nh�n ph�n th��ng.")
				elseif ( GetBit(GetTask(1232),8) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Ho�n th�nh nhi�m v� � ch� V�n T��c Nhi, ��n t�m V� s� l�y D��c th�o.")
				end
			end
			
		elseif ( GetTask(1227) == 20 ) then
			NewTask_TaskTextOut(nTaskGenre, "<color=red>B�n �� h�c xong � ch� L� Thanh, c� th� �i t�m ng��i kh�c.<color>")
		end
		
		------------------------------------------��Ӱ-------------------------------------
		if ( GetTask(1228) == 20 ) then
			NewTask_TaskTextOut(nTaskGenre, "<color=red>�� ho�n th�nh nhi�m v� c�a ���ng �nh.<color>")
		elseif ( GetTask(1228) == 8191 ) then
			NewTask_TaskTextOut(nTaskGenre, "���ng �nh sau khi bi�t ���c tin t�c c�a Ti�u Thu Y vui m�ng kh�n xi�t, cho b�n bi�t nhi�u b� m�t li�n quan ��ng h�nh. ��i tho�i v�i y l�n n�a �� nh�n ph�n th��ng.<color>")
		elseif ( GetBit(GetTask(1228),13) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "���ng Thu Y b�o b�n v� g�p cha c� ta. C� ta s� v� sau.")
		elseif ( GetBit(GetTask(1228),12) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "Ti�u Thu Y n�i th�c th�c kh�ng ch�i v�i c� b�. B�n ra s�c khuy�n c� b�, cu�i c�ng c� b� c�ng theo b�n v�. ��i tho�i v�i c� b� �� l�nh ph�n th��ng.")
		elseif ( GetBit(GetTask(1228),11) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "Tr�c Phi Ph�m n�i sau n�i c� m�t ��a b� c� kh� n�ng l� ���ng Thu Y, h�y qua xem th�!")
		elseif ( GetBit(GetTask(1228),10) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "Tr�c Phi Ph�m n�i chuy�n khi�n ng��i ta t��ng h�n b� �i�n. ��i tho�i v�i y, xem y cho b�n ph�n th��ng g�.<color>")
		elseif ( GetTask(1228) == 511 ) then
			NewTask_TaskTextOut(nTaskGenre, "Ho�n th�nh nhi�m v� ch� C� Quan nh�n, �i t�m Tr�c Phi Ph�m th� nghi�m �i!")
		elseif ( GetBit(GetTask(1228),1) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "���ng �nh nh� b�n v�o con ���ng th�n b� �� c�u con c�a �ng ta l� ���ng Thu Y.")
			
			if ( GetBit(GetTask(1228),2) == 1 )  and ( GetBit(GetTask(1228),3) == 0 )  then
				NewTask_TaskTextOut(nTaskGenre, "Ho�n th�nh nhi�m v� ch� C� Quan nh�n th� 1, nh�n ph�n th��ng")
			elseif ( GetBit(GetTask(1228),3) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "nh�n ph�n th��ng ch� C� Quan nh�n th� 1, ti�p t�c t�m C� Quan nh�n th� 2")
			end
				
			if ( GetBit(GetTask(1228),4) == 1 ) and ( GetBit(GetTask(1228),5) == 0 )  then
				NewTask_TaskTextOut(nTaskGenre, "Ho�n th�nh nhi�m v� ch� C� Quan nh�n th� 2, nh�n ph�n th��ng")
			elseif ( GetBit(GetTask(1228),5) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "nh�n ph�n th��ng ch� C� Quan nh�n th� 2, ti�p t�c t�m C� Quan nh�n th� 3")
			end
				
			if ( GetBit(GetTask(1228),6) == 1 ) and ( GetBit(GetTask(1228),7) == 0 )  then
				NewTask_TaskTextOut(nTaskGenre, "Ho�n th�nh nhi�m v� ch� C� Quan nh�n th� 3, nh�n ph�n th��ng")
			elseif ( GetBit(GetTask(1228),7) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "nh�n ph�n th��ng ch� C� Quan nh�n th� 3, ti�p t�c t�m C� Quan nh�n th� 4")
			end
				
			if ( GetBit(GetTask(1228),8) == 1 ) and ( GetBit(GetTask(1228),9) == 0 )  then
				NewTask_TaskTextOut(nTaskGenre, "Ho�n th�nh nhi�m v� ch� C� Quan nh�n th� 4, nh�n ph�n th��ng")
			elseif ( GetBit(GetTask(1228),9) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "nh�n ph�n th��ng ch� C� Quan nh�n th� 4, ti�p t�c t�m C� Quan nh�n th� 5")
			end
		end
		
		------------------------------------------------��ɷ-------------------------------------------
			if ( GetTask(1229) == 20 ) then
				NewTask_TaskTextOut(nTaskGenre, "<color=red>Ho�n th�nh nhi�m v� c�a B�ch S�t.<color>")
			elseif ( GetTask(1229) == 31 ) then
				NewTask_TaskTextOut(nTaskGenre, "quay v� t�m B�ch S�t ��i tho�i.")
			elseif (  GetBit(GetTask(1229),1) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "B�ch S�t nh� b�n �i v�o th�p Tam ��o S� v� mi�u th� T� qu� ph� � ph�a nam V�n Trung Tr�n �� c�u 2 �� t� c�a �ng ta")
				
				if (  GetBit(GetTask(1229),2) == 1 ) and  (  GetBit(GetTask(1229),3) == 0 ) then
					NewTask_TaskTextOut(nTaskGenre, "Kh�c V�n cho b�n bi�t nhi�u �i�u li�n quan ��n ��ng h�nh. ��i tho�i v�i y �� nh�n ph�n th��ng.")
				elseif (  GetBit(GetTask(1229),3) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Sau khi ��i tho�i v�i Kh�c V�n, ��n t�m 1 v� �� t� kh�c c�a B�ch S�t l� T� Thanh Nhi. C� ta � mi�u th�i T� qu� ph�.")
				end
				
				if (  GetBit(GetTask(1229),4) == 1 ) and  (  GetBit(GetTask(1229),5) == 0 ) then
					NewTask_TaskTextOut(nTaskGenre, "T� Thanh Nhi l� m�t c� g�i ki�n c��ng, kh�ng khu�t ph�c tr��c s� m�nh. Tin r�ng ng��i c�ng nh� th�, ��i tho�i v�i c� ta �� l�nh ph�n th��ng.")
				elseif (  GetBit(GetTask(1229),5) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Ho�n th�nh nhi�m v� � ch� T� Thanh Nhi, ��n t�m 1 v� �� t� kh�c c�a B�ch S�t l� Kh�c V�n. Y ��i b�n � th�p Tam ��o s�.")
				end
			end
			
			-------------------------------------------��ɷ----------------------------------
			if ( GetTask(1230) == 20 ) then
				NewTask_TaskTextOut(nTaskGenre, "<color=red>Ho�n th�nh nhi�m v� � ch� H�c S�t.<color>")
			elseif ( GetTask(1230) == 16 ) then
				NewTask_TaskTextOut(nTaskGenre, "H�c S�t tuy nghi�m kh�c c�c �oan nh�ng th��ng ph�t ph�n minh. ��i tho�i v�i H�c S�t �� nh�n ph�n th��ng.")
			elseif ( GetTask(1230) == 15 ) then
				NewTask_TaskTextOut(nTaskGenre, " ��nh xong bao c�t, c� th� quay l�i g�p l�o gia ta th�nh gi�o")
			elseif ( GetTask(1230) == 14 ) then
				NewTask_TaskTextOut(nTaskGenre, "L�o Gia T� b�o b�n �i v�o hi�u v� tr��ng ��nh bao c�t. Xem ra kh�ng ��nh �� s� l�n th� kh�ng th� giao nhi�m v�.")	
			elseif ( GetTask(1230) == 13 ) then
				NewTask_TaskTextOut(nTaskGenre, "B�n nh�n ���c 1 quy�n M�t �� th�n b�#Nam Minh Tam �o�n K�ch. ��i tho�i v�i �ng ta, xem �ng ta c�n ki�m tra g� n�a")			
			elseif ( GetTask(1230) == 12 ) then
				NewTask_TaskTextOut(nTaskGenre, "L�y ���c M�t t�ch, v� g�p H�c S�t ph�c m�nh.")	
			elseif ( GetTask(1230) == 10 ) then
				NewTask_TaskTextOut(nTaskGenre, "L�o Gia T� b�o b�n d�t ng��i �� t� b� m�t trong hi�u v� tr��ng c�a �ng.")	
			end
			
			
			------------------------------------------����ˮ-----------------------------------------
			if ( GetTask(1231) == 20 ) then
				NewTask_TaskTextOut(nTaskGenre, "<color=red>Nhi�m v� Thu Y Th�y �� ho�n th�nh.<color>")
			elseif ( GetTask(1231) == 18 ) then
				NewTask_TaskTextOut(nTaskGenre, "Ho�n th�nh nhi�m v� � ch� Long B�t, quay v� t�m Thu ��i t�!")
			elseif ( GetTask(1231) == 17 ) then
				NewTask_TaskTextOut(nTaskGenre, "Tr� l�i ��ng c�u h�i c�a Long B�t quay v� t�m y nh�n th��ng.")
			elseif ( GetTask(1231) == 16 ) then
				NewTask_TaskTextOut(nTaskGenre, "Nh�n ph�n th��ng t� Long B�t, xem y c�n l�i g� mu�n n�i?")	
			elseif ( GetTask(1231) == 15 ) then
				NewTask_TaskTextOut(nTaskGenre, "�� ho�n th�nh nhi�m v�, h�y �i ��i tho�i v�i Long B�t.")			
			elseif ( GetTask(1231) == 10 ) then
				NewTask_TaskTextOut(nTaskGenre, "Thu Y Th�y b�o b�n ��n Long V��ng ��i t�m Long B�t l�y M�t t�ch, m� ra xem v� ��nh c�c g� �� luy�n c�ng.<color>")	
			end
		elseif ( GetTask(1226) == 20 ) and (  GetBit(GetTask(1232),20) == 0 ) then		
			NewTask_TaskTextOut(nTaskGenre, "��i tho�i v�i Ki�m Ho�ng �� t�.")	
		elseif  ( GetTask(1226) == 20 ) and (  GetBit(GetTask(1232),20) == 1 ) then		
			NewTask_TaskTextOut(nTaskGenre, "tr� l�i th�nh c�ng c�u h�i c�a Ki�m Ho�ng �� t�, quay v� t�m y l�nh th��ng.")	
	end

end