Include("\\script\\task\\150skilltask\\task.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\task\\150skilltask\\wudu\\wudu.lua")
--M� nhi�m v� nh�n k� n�ng 150 - Modified By NgaVN - 20121207
pTask = TaskClass:New()
pTask.m_szTaskName = "Ng� ��c"
pTask.m_nTaskId = 5
pTask.m_nBase = 1
pTask.tbConfig = tbConfig
pTask.tbMissionDialog = tbMissionDialog
G_TASK:AddTask(pTask)
