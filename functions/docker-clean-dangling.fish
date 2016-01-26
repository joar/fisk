function docker-clean-dangling
    set dangling (docker images --quiet --filter "dangling=true")

    if test (count $dangling) -eq 0
        echo "No dangling images"
        return 0
    end

    echo "Dangling images:"
    for image in $dangling
        echo " - " $image
    end

    if confirm "Do you want to remove ALL dangling images?"
        docker rmi $dangling
    end
end

