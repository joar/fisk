function with-pdb --description 'Run a python binary with the Python debugger'
	if test (count $argv) -eq 0
        echo 'No command specified'
        return 1
    end

    set -l binary $argv[1]

    set -l arguments

    if test (count $argv) -gt 1
        set arguments "$argv[2..-1]"
    end

    eval (/usr/bin/env which python) -mpdb (which $binary) $arguments
end
