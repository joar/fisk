function machine -d "Set a docker-machine env" -a machine
    if test "$machine" = "" -o "$machine" = "none"
        eval (docker-machine env -u | sed 's/set -x/set -gx/g')
    else
        eval (docker-machine env $machine | sed 's/set -x/set -gx/g')
    end
end

