-- ��ʾ��������Ĺ���
function showworldtaskdesc(nTaskIdx, nTaskGenre)
	local Uworld1066  = GetTask(1066)
	local Uworld1065  = GetTask(1065)
	
	local myWorldText = {
			[0]="B�n nghe ��n T�nh S� (205, 199) �<color=red> T�y S�n th�n<color> r�t am hi�u v� T�y S�n t�.",
			[1]="T�nh S� cho b�n bi�t v�i �i�u v� T�y S�n L�nh, nh�ng �ng b�o b�n �i thu th�p 500 quy�n <color=red>M�t �� th�n b�<color> ",
			[2]="B�n giao 500 quy�n M�t t�ch giao cho T�nh S�, T�nh S� b�o b�n v�o th�n (214, 195) t�m <color=red>T�y S�n Ti�u Nh�<color>, Y s� d�n b�n �i T�y S�n L�nh."
			}
			
	local CollectMeatText = {
			[0]="Nhi�m v� T�n Th� th�n l�y th�t t��i",
			[1]="B�n ��n g�p V� s� ti�p nh�n nhi�m v� ��n T�n Th� th�n ho�c ngo�i th�nh ��nh qu�i l�y th�t t��i, V� s� y�u c�u b�n l�y ���c"..Uworld1066.."mi�ng th�t t��i."
	}
	
	--local myTaskValue = GetTask(1064)

	--if (GetLevel()>=100) then		
	--	if (myTaskValue < 2) then
	--		NewTask_TaskTextOut(nTaskGenre, myWorldText[myTaskValue])
	--	else
	--		NewTask_TaskTextOut(nTaskGenre, myWorldText[2])			
	--	end
	--	NewTask_TaskTextOut(nTaskGenre, "<enter>")
	--end
	
	if ( Uworld1066 ~= 0 ) then
		NewTask_TaskTextOut(nTaskGenre, CollectMeatText[0])
		NewTask_TaskTextOut(nTaskGenre, CollectMeatText[1])
		NewTask_TaskTextOut(nTaskGenre, "<enter>")
	end
	
	NewTask_TaskTextOut(nTaskGenre, "B�n hi�n c� "..Uworld1065.."mi�ng th�t t��i. �em th�t t��i t�m V� s� ti�p nh�n nhi�m v� mua b�n th�t �� nh�n ph�n th��ng.")

	--storm_task(nTaskIdx, nTaskGenre)		--Storm �������
	--zq_mooncake_task(nTaskIdx, nTaskGenre)	--�����±�
end


--Storm ������� ----------------------------------------------------------------------------------------------
function storm_task(nTaskIdx, nTaskGenre)
	--�õ����һ�δ�������ϵͳ������
	local n_date = GetTask(1678)
	local str_date = floor(n_date/10000).."."..floor(mod(n_date,10000)/100).."."..mod(n_date,100)
	str_date = "<color=white>("..str_date..")<color>"
	
	if (GetTask(1661) > 275) then
		NewTask_TaskTextOut(nTaskGenre, "<enter>'<color=red>Phong ba th�ng 9<color>' ho�t ��ng �� k�t th�c!")
	else
		NewTask_TaskTextOut(nTaskGenre, "<enter>'<color=red>Phong ba th�ng 9<color>' t�nh h�nh ho�t ��ng h�m nay"..str_date..":<enter>")
		NewTask_DetailTextOut(nTaskGenre, " t�n ho�t ��ng   s� l�n   tr�ng th�i   �i�m t�ch l�y cao nh�t<enter>")
		storm_gamedetail("Chi�n tr��ng T�ng Kim", 1, 1681, 1682, 1685)
		storm_gamedetail("s�t th� ", 2, 1687, 1688, 1691)
		--storm_gamedetail("��ʹ����", 1, 1693, 1694, 1697)
		storm_gamedetail("Nhi�m v� D� T�u", 1, 1699, 1700, 1703)
	end
	NewTask_TaskTextOut(nTaskGenre, "<enter>'<color=red>Phong ba th�ng 9<color>'   t�nh h�nh �i�m t�ch l�y g�n ��y"..str_date..":<enter>")
	NewTask_DetailTextOut(nTaskGenre, " �i�m t�ch l�y h�m nay:"..point2str(GetTask(1662)).."     �i�m t�ch l�y h�m qua:"..point2str(GetTask(1663)).."<enter>")
	NewTask_DetailTextOut(nTaskGenre, " �i�m t�ch l�y tu�n n�y:"..point2str(GetTask(1667)).."     �i�m t�ch l�y tu�n tr��c:"..point2str(GetTask(1668)).."<enter>")
	NewTask_DetailTextOut(nTaskGenre, " �i�m t�ch l�y th�ng n�y:"..point2str(GetTask(1672)).."     �i�m t�ch l�y th�ng tr��c:"..point2str(GetTask(1673)).."<enter>")
end

--��ʾָ����ķ籩���ֲ������
function storm_gamedetail(nTaskIdx, nTaskGenre, name, max_count, task_start, task_count, task_point)
	local trycount = GetTask(task_count)
	local str = "[<color=green>"..name.."<color>]   "..point2str(trycount,1).."/"..max_count.."   "
	if (GetTask(task_start) > 0) then
		str = str.."<color=red>�ang ti�n h�nh<color>"
	elseif (trycount <= 0) then
		str = str.."<color=blue>Ch�a ti�n h�nh<color>"
	elseif (trycount < max_count) then
		str = str.."<color=green>�� ti�n h�nh<color>"
	else
		str = str.."<color=8947848>�� k�t th�c<color>"
	end
	str = str.."   "..point2str(GetTask(task_point)).."<enter>"
	NewTask_DetailTextOut(nTaskGenre, str)
end


--���� �±���� --------------------------------------------------------------------------------------------------
ZQ_MOONCAKE_TYPE = {"B�nh Trung Thu th�p c�m", "B�nh Trung Thu Qu� Nh�n", "B�nh Trung thu sen tr�ng", "B�nh Trung Thu ��u Tr�ng", "B�nh Trung thu h�t sen ", "B�nh Trung Thu ��u Xanh"}
ZQ_MOONCAKE_LIFE = {10, 5, 3, 3, 3, 3}
ZQ_MOONCAKE_STAT = {{3,"nh�o b�t",98}, {5,"l�m nh�n b�nh",77}, {7,"n��ng b�nh",104}}

function zq_mooncake_task(nTaskIdx, nTaskGenre)
	local n_taskvalue = GetTask(1569)
	local n_cake_type = floor(n_taskvalue/1000)
	local n_cake_stat = mod(n_taskvalue, 1000)
	NewTask_TaskTextOut(nTaskGenre, "<enter>Ho�t ��ng l�m b�nh Trung thu:<enter>")
	if (n_cake_type == 0) then
		NewTask_DetailTextOut(nTaskGenre, "   v�n ch�a b�t ��u!~~~<pic=5><enter>"
			.."     Mau ��n ��y l�m! <pic=59>!<enter>")
	else
		NewTask_DetailTextOut(nTaskGenre, "  <color=green><bclr=dgreen>"..ZQ_MOONCAKE_TYPE[n_cake_type].."<bclr><color>")
		if (n_cake_stat == 1 or n_cake_stat == 2) then
			NewTask_DetailTextOut(nTaskGenre, "   Chao �i! Chi�c b�nh n�y �� b� n��ng kh�t r�i!~~<pic=10><enter>")
		else
			NewTask_DetailTextOut(nTaskGenre, "      <Tr�nh t�>     <Tr�ng th�i><enter>")
			local str = ""
			for _, tb_stat in ZQ_MOONCAKE_STAT do
				if (n_cake_stat == tb_stat[1]-1 or n_cake_stat == tb_stat[1]) then
					str = str.."   <pic=115>"
				else
					str = str.."      "
				end
				str = str.."<color=white><bclr=fire>"..tb_stat[2].."<bclr><color>     "
				if (n_cake_stat < tb_stat[1]) then
					str = str.."<color=hblue>ch�a ti�n h�nh<color>"
				elseif (n_cake_stat == tb_stat[1]) then
					str = str.."<color=yellow>�ang ti�n h�nh<color><pic=99>"
				else
					str = str.."<color=green>�� ho�n th�nh<color><pic="..tb_stat[3]..">"
				end
				str = str.."<enter>"
			end
			if (n_cake_stat == 4 or n_cake_stat == 6 or n_cake_stat == 8) then
				str = str.."<enter>   H�y ��n <color=yellow>Th� b�nh<color>xem sao.<color><enter>"
			end
			NewTask_DetailTextOut(nTaskGenre, str)
		end
	end
end

--����ָ�����ȡ�����ɫ���ַ���
--len��	ָ�����ȣ�nilΪĬ��ֵ
function point2str(point, len, color)
	if not color then
		color = "yellow"
	end
	local str = tostring(point)
	if (len == nil) then
		len = 4
	end
	
	while (strlen(str) < len) do
		str = " "..str
	end
	
	return "<color="..color..">"..str.."<color>"
end