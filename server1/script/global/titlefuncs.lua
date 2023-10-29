IL("TITLE");
MAX_TITLE_PERPAGE = 5
TASK_ACTIVE_TITLE = 1122

function change_title()
	Say("B�n mu�n ta gi�p vi�c g�?", 3,  "T�m xem ho�c k�ch ho�t danh hi�u �� c� /#title_ShowTitleList(1)", "Kh�ng k�ch ho�t danh hi�u hi�n th�i/#title_choose(0)", "Kh�ng c�n/OnCancel")
end

function title_ShowTitleList(nPage)
	local tab = Title_GetTitleTab()
	
	if (tab == nil or getn(tab) == 0) then
		Say("Tr��c m�t b�n kh�ng c� danh hi�u n�o h�t!",0)
		return
	end
	
	local titletab = {};
	local iter = 1
	--�ǵ�һҳ����ʾ��һҳ
	if (nPage > 1) then
		titletab[iter] = "Trang tr��c/#title_ShowTitleList("..(nPage - 1)..")"
		iter = iter + 1
	end
	
	--���ҳ������Ļ�
	if (getn(tab) <= MAX_TITLE_PERPAGE * nPage) then
		for i = MAX_TITLE_PERPAGE * (nPage - 1) + 1, getn(tab) do 
			titletab[iter] = Title_GetTitleName(tab[i]).."/#title_choose("..tab[i]..")";
			iter = iter + 1
		end
	else
		for i = 1, MAX_TITLE_PERPAGE do 
			tabiter = i + (nPage - 1)*MAX_TITLE_PERPAGE 
			titletab[iter] = Title_GetTitleName(tab[tabiter]).."/#title_choose("..tab[tabiter]..")";
			iter = iter + 1
		end
		titletab[iter] = "Trang k� /#title_ShowTitleList("..(nPage + 1)..")"
		iter = iter + 1
	end
	
	titletab[iter] = "Gi� l�i ban ��u/OnCancel"
	iter = iter + 1
	Say("Tr��c m�t b�n �ang nh�n danh hi�u l� "..getn(tab)..", b�n mu�n k�ch ho�t danh hi�u n�o?", getn(titletab), titletab);
end

function title_choose(titleid)
	Title_ActiveTitle(titleid)
	SetTask(TASK_ACTIVE_TITLE,titleid)
end

function title_loginactive()
	Title_ActiveTitle(GetTask(TASK_ACTIVE_TITLE))
end;