function main()
--����һ����ʯ

AddEventItem(351);
Msg2Player("Ch�c m�ng B�n! B�n l�y ���c m�t mi�ng ��a �� s�n h� x� t�c ");
Name = GetName();
str = format("Ch�c m�ng! %s nh�n ���c m�t m�nh b�n �� S�n H� X� T�c!", Name);
AddGlobalNews(str);
WriteLog(date("%m%d%H%M")..str);
DelObject();
end;