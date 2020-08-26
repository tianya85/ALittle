﻿// ALittleServer.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include "ALittle/LibServer/ServerSystem/ServerSystem.h"
#include "ALittle/LibCommon/Helper/LogHelper.h"
#include "ALittle/LibCommon/Helper/StringHelper.h"
#include "ALittle/LibCommon/Helper/FileHelper.h"
#include "ALittle/LibCommon/Tool/LogSystem.h"

#include <map>
#include <vector>
#include <string>

int main(int argc, char* argv[])
{
	if (argc != 5)
	{
		ALITTLE_ERROR(u8"需要输入4个参数\n参数1:Core模块脚本根路径\n参数2:Std模块脚本根路径\n参数3:SEngine模块脚本根路径\n参数4:逻辑模块列表:模块标题1,模块名1,模块路径1,配置文件路径1;模块标题2,模块名2,模块路径2,配置文件路径2;...");
		return 0;
	}

	std::string core_path = argv[1];
	std::string std_path = argv[2];
	std::string sengine_path = argv[3];
	std::map<std::string, ALittle::ModuleInfo> module_map;

	std::vector<std::string> module_split;
	ALittle::StringHelper::Split(argv[4], ";", module_split);
	for (auto& module : module_split)
	{
		std::vector<std::string> info_split;
		ALittle::StringHelper::Split(module, ",", info_split);
		if (info_split.size() < 2 || info_split.size() > 4)
		{
			ALITTLE_WARN(u8"错误的格式:" << module);
			continue;
		}
		module_map[info_split[0]].module_name = info_split[1];
		module_map[info_split[0]].module_path = ALittle::FileHelper::TryAddFileSeparator(info_split[2]);
		module_map[info_split[0]].config_path = info_split[3];
	}

	ALittle::ServerSystem::Instance().Setup(module_map);
	ALittle::ServerSystem::Instance().Start(core_path, std_path, sengine_path, module_map, true);
	ALittle::ServerSystem::Instance().Shutdown();
	return 0;
}