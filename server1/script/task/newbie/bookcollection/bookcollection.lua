

TKID_NEWBIE = 600 			--������������ڴ�����������Ƿ��ڽ�����
TKID_NEWBIE_LEVEL = 601		--������������ڴ����������ȼ�
TKID_NEWBIE_SUCCED = 602 	--������������ڴ����������������ɹ���
TKID_NEWBIE_CIRCLE = 603		--������������ڴ����������ɹ���ɵ�����
TKID_NEWBIE_BOOK_NUM = 606	--������������ڴ�ű�����Ҫ�ҵ��鼮����
TK_NEWBIE_BUSYTIME = 60		--����ȡ������֮����һ����Ҫ�����ô��ʱ����ܼ�����
TKID_NEWBIE_BONUS = 610		--�Ƿ񷢽���־
TK_NEWBIE_BOOK=1			--TK_NEWBIE_BOOK=1,��ʾ�鼮�ռ�����

ITEM_NUM_INVALIDATIOM = -1	--������Ʒ������Ҫ����������
ITEM_ID_REPETITION = -2		--��Ʒ�����ͬ

BOOK_INVALIDATION = -100	--�鼮����

SUCCEND = 0 				--�ɹ�

BookCollection = {
	IsContain = function(self,tasklvl,bookid) --�ж��鼮����Ƿ������������
		for i=1 , getn(self.Books[tasklvl]["Detail"]) do
			if(bookid == self.Books[tasklvl]["Detail"][i][2]) then return 1 end
		end
		return nil
	end,
	GetBookNum = function(self)
		return GetTask(TKID_NEWBIE_BOOK_NUM)
	end,
	GiveTask = function(self,tasklvl) --����ĳ���ȼ����鼮�ռ�����
		SetTask(TKID_NEWBIE,TK_NEWBIE_BOOK)
		SetTask(TKID_NEWBIE_LEVEL,tasklvl)
		local lspan,rspan = self.Books[tasklvl]["Span"][1],self.Books[tasklvl]["Span"][2]
		if(not rspan) then rspan = getn(Book[tasklvl]["Detail"]) end
		SetTask(TKID_NEWBIE_BOOK_NUM,random(lspan,rspan))
		return
	end,
	GetBooks = function(self,books)
		local bookNum = getn(books)
		if(bookNum ~= self:GetBookNum()) then --��Ʒ��������
			return ITEM_NUM_INVALIDATION
		end
		for i=2 , bookNum do --�鼮�ظ�
			if(books[i]==books[i-1]) then return ITEM_ID_REPETITION end
		end
		for i=1 , bookNum do --�鼮�Ƿ�����ռ�Ŀ��
			if(not self:IsContain(books[i])) then return BOOK_INVALIDATION end
		end
		for i=1, bookNum do --ɾ����Ʒ
			DeleteOverlapping(6,1,books[i],-1) --�ӵ�����Ʒ��ɾ��һ����Ʒ
		end
		return SUCCED
	end,
	FinishTask = function(self) --�������
		SetTask(TKID_NEWBIE,0) --��������ʶ
		SetTask(TKID_NEWBIE_LEVEL,0) --�������ȼ���ʶ
		SetTask(TKID_NEWBIE_BOOK_NUM,0) --����ռ��鼮����Ŀ
		SetTask(TKID_NEWBIE_SUCCED,GetTask(TKID_NEWBIE_SUCCED)+1) --����������+1
		--��������ɹ��������20�Σ����¼���֡���ʶ,���������ɹ���
		if(GetTask(TKID_NEWBIESUCCED) > 19) then
			SetTask(TKID_NEWBIECIRCLE,GetTask(TKID_NEWBIE_CIRCLE)+1)
			SetTask(TKID_NEWBIE_CANCLE,0) --�������ȡ������
			SetTask(TKID_NEWBIE_SUCCED,0)
		end
		SetTask(TKID_NEWBIE_BONUS,0) --���������ʶ
	end,

}
