if (not _H_ITEM_)then
	_H_ITEM_ = 1;

--����һ������ڵ�ǰ��ҵ�ѡ��
function festival_make_option(szFunName)
	local szName = GetName()
	return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
end


end;	--	end of _H_ITEM_