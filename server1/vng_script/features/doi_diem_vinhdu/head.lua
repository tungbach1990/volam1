
if not tbVngDoiDiemVD then
	tbVngDoiDiemVD ={}		
end

tbVngDoiDiemVD.KEY_LOG = "LOGEVENT_FEATURE_CTC_DoiVoDanh"
--KS su dung task nay de luu diem vinh du
TASK_WLLS_TASKID_HONOUR	= 2501

NEED_POINT_WLLS = 80000

ITEM_VODANH_HONTHACH = {szName ="V� Danh H�n Thach",tbProp={6,1,30579,1,0,0},}
szGDP_ITEM_VODANH_STONE = "6,1,30579"

tbVngDoiDiemVD.tbItemVoDanhRing = {
	[141]= {szName = "V� Danh Ch� Ho�n",tbProp={0,141},nCount=1,nQuality = 1,},
	[142] = {szName = "V� Danh Gi�i Ch�",tbProp={0,142},nCount=1,nQuality = 1,},
}

