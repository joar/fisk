function docker-clean-containers
    set containers (docker ps -a --format '{{ .ID }} {{ .Names }}')

    if test (count $containers) -eq 0
        echo "No containers"
        return 0
    end

    echo "Containers:"
    for container in $containers
        set info (__docker-clean-containers-split-container-info $container)
        echo " -" $info[2]
    end


    if confirm "Do you want to delete ALL containers?"
        for container in $containers
            set info (__docker-clean-containers-split-container-info $container)
            set container_ids $container_ids $info[1]
        end

        docker rm -f $container_ids
    end
end


function __docker-clean-containers-split-container-info --argument-names info
    string split ' ' $info
end
