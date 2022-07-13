
require "optparse"
require "ostruct"

real_build_cmd = File.join(Dir.pwd, "src", "tests", "build.cmd")
if not File.exist? real_build_cmd
	puts "#{real_build_cmd} does not exist!"
	return
end

options = OpenStruct.new
options.config = "checked"
options.arch = "x64"
options.skip_managed = ""
options.skip_native = ""

OptionParser.new do |opt|
  opt.on("-c", "--config=config") { |o| options.config = o }
  opt.on("-a", "--arch=arch") { |o| options.arch = o }
  opt.on("--skipmanaged") { |o| options.skip_managed = "skipmanaged" }
  opt.on("--skipnative") { || options.skip_native = "skipnative"}
end.parse!

cmd = "#{real_build_cmd} #{options.config} #{options.arch} #{options.skip_managed} #{options.skip_native}"
puts "Running #{cmd}"
exec(cmd)