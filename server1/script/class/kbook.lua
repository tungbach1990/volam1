--Creator:yfeng
--Date:2004-08-31
--Comm:�鼮����ģ��,��inherit(KBook,VarName="...",Page={})������

KBook = {	--VarName Ϊ��������PageΪ������ݣ���һ��table
	TurnTo = function (self,pageno)
		local pageCount = getn(self.Page)
		if(pageCount < 1) then --û����Чҳ
			return nil
		end
		if(pageno > pageCount) then --��ǰҳ��Ч
			return nil
		end
		local str_NEXT = "Trang k� /#%s:TurnTo(%s)"
		local str_PREVIOUS = "Trang tr��c/#%s:TurnTo(%s)"
		local str_CLOSE = "��ng/#%s:Close()"
		
		if(pageCount == 1 ) then  --ֻ��һҳ
			if(pageno == 1) then
				Say(self.Page[1],1,format(str_CLOSE,self.VarName))
				return 1
			end
			return nil
		end
		--pageCount > 1
		if(pageno == 1) then --��һҳ
			Say(self.Page[1],2,format(str_NEXT,self.VarName,pageno+1),
								format(str_CLOSE,self.VarName))
			return 1
		end
		if(pageno == pageCount) then
			Say(self.Page[pageCount],2,format(str_PREVIOUS,self.VarName,pageno-1),
										format(str_CLOSE,self.VarName))
			return 1
		end
		Say(self.Page[pageno],3,format(str_NEXT,self.VarName,pageno+1),
								format(str_PREVIOUS,self.VarName,pageno-1),
								format(str_CLOSE,self.VarName))
		return 1
	end,
	Close = function(self)
		return 1
	end,
}
