F4::
	global  time1 := 500 ;短暂等待时间
	global  time2 := 1000 ;较长等待时间
	global  time3 := 2000 ;较长等待时间
	global  ydsd := 190 ;移动速度
	global  pyly := 30 ; 便宜量 Y 轴
	global  je := 2000 ;总经理条件设置金额数值
	global  je1 := 5000 ;品牌总经理条件设置金额数值
	global  sjcs	:= 5 ; 双击次数
	global  zdx := 0 ;条件设置-字段选择开始x坐标
	global  zdy := 0  ;条件设置-字段选择开始y坐标
	global  glx := 0 ;过滤分组开始X坐标
	global  gly := 0  ;过滤分组开始Y坐标
	global  je4 := "0"  ;被修改金额
	global  je3 := 0 ;修改后金额
	global  jc := 0 ;检测条件是否成立
	array  := [2431062,2415230,2392704,2354547,2347350,2311281,2284912,2274301,2271308,2211689,2167028,2185083,2101333,1793356,1766235,1206066]
	array1 := ["没有检索到数据","已结束"]

	for index, element in array
	{
		点击("输入流水号",63,10)
		Send ^a
		Send %element%
		点击("查询按钮",10,10)
		for index, element in array1
		{
			检测(element)
			if  ( jc = 1 )  ;检测到指定对象就跳过下面的语句
			{
				goto ,Label1
			}
		}

		点击("选择流程",10,10)
		Send {tab 2} {Enter}
		点击("确定按钮",10,10)
Label1:
	}


检测(wjm)
{
	i := 0
	loop
	{
		Sleep %time1%
		i := i + 1
		if (i > 10)
		{
			jc = 0
			break
		}
		fn := wjm ".PNG"
		ImageSearch, FoundX, FoundY, 0,0, 2300, 2300, d:\mjs\png\%fn%
		if ErrorLevel  <> 0
		{
			ToolTip, 未找到: %fn%,600,30
		}
		else
		{
			jc = 1
			break
		}
	}
}

点击(wjm,pyx,pyy)
{
	i := 0
	loop
	{
		fn := wjm ".PNG"
		ImageSearch, FoundX, FoundY, 0,0, 2300, 2300, d:\mjs\png\%fn%
		if ErrorLevel  <> 0
		{
			ToolTip, 未找到: %fn%,600,30
		}

		else
		{
			Sleep %time1%
			FoundX := FoundX + pyx
			FoundY := FoundY + pyy
			Click  %FoundX%,%FoundY%,1
			Sleep %time2%
			break
		}
	}
}

;F12::Pause