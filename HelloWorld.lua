require("memory");
require("protobuf");
require("socket");
require("base64");
require("csv");
require("dump");
require("json");
require("ajson");
require("sqlite3");
require("lfs");
require("md5");
require("net");
require("timer");
require("utf8");
dump.setup("HelloWorld");

require("ALittle/Module/ALittleIDE/Other/GameLibrary/Core/Script/ALittle");
RequireCore("ALittle/Module/ALittleIDE/Other/GameLibrary/Core/Script/");
require("ALittle/Module/ALittleIDE/Other/GameLibrary/Std/Script/ALittle");
RequireStd("ALittle/Module/ALittleIDE/Other/GameLibrary/Std/Script/");
require("ALittle/Module/ALittleIDE/Other/GameLibrary/HelloWorld/Script/Main");
HelloWorld.Main();

-- 最后释放protobuf
protobuf.shutdown();