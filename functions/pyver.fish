function pyver
	pip freeze | grep -iE (echo $argv | tr ' ' '|')
end
