function serve
	python -mSimpleHTTPServer 8080 > /dev/null ^ /dev/null &
    xdg-open http://localhost:8080
end
