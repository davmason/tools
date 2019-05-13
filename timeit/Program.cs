using System;
using System.Diagnostics;

namespace timeit
{
    class Program
    {
        static int Main(string[] args)
        {
            Stopwatch sw = new Stopwatch();
            sw.Start();
            int exitCode = RunCommand(args);
            sw.Stop();

            TimeSpan time = sw.Elapsed;
            Console.WriteLine("");
            Console.WriteLine("");
            Console.WriteLine("");
            Console.WriteLine($"Total elapsed time: {(int)time.TotalHours}h {time.Minutes}m {time.Seconds}s {time.Milliseconds}ms ");
            return exitCode;
        }

        private static int RunCommand(string[] args)
        {
            ProcessStartInfo processInfo;
            Process process;

            string execCommand = string.Join(" ", args);
            processInfo = new ProcessStartInfo("cmd.exe", "/c " + execCommand)
            {
                CreateNoWindow = true,
                UseShellExecute = false,
                RedirectStandardError = true,
                RedirectStandardOutput = true
            };

            process = new Process
            {
                StartInfo = processInfo
            };

            process.OutputDataReceived += Process_OutputDataReceived;
            process.ErrorDataReceived += Process_ErrorDataReceived;

            process.Start();
            process.BeginOutputReadLine();
            process.BeginErrorReadLine();
            process.WaitForExit();

            return process.ExitCode;
        }

        private static void Process_ErrorDataReceived(object sender, DataReceivedEventArgs e)
        {
            Console.WriteLine(e.Data);
        }

        private static void Process_OutputDataReceived(object sender, DataReceivedEventArgs e)
        {
            Console.WriteLine(e.Data);
        }
    }
}
