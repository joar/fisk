function cpumhz
	watch -n 1 "cat /proc/cpuinfo | grep -e 'processor' -e 'cpu MHz'" $argv;
end
