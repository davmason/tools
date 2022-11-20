
require "optparse"
require "ostruct"

real_build_cmd = File.join(Dir.pwd, "build.cmd")
if not File.exist? real_build_cmd
	puts "#{real_build_cmd} does not exist!"
	return
end

options = OpenStruct.new
options.runtime_config = "checked"
options.libraries_config = "release"
options.arch = "x64"
options.subset = "clr"

OptionParser.new do |opt|
  opt.on("--rc=runtime_config") { |o| options.runtime_config = o }
  opt.on("--lc=libraries_config") { |o| options.libraries_config = o }
  opt.on("--arch=arch") { |o| options.arch = o }
  opt.on("--subset=subset") { |o| options.subset = o }
  opt.on("-n", "--native") { || options.subset = "clr.native"}
end.parse!

cmd = "#{real_build_cmd} -rc #{options.runtime_config} -lc #{options.libraries_config} -arch #{options.arch} -subset #{options.subset}"
puts "Running #{cmd}"
exec(cmd)