CONF_DIR=$(__fish_config_dir)


.PHONY: test-conf-is-set


test-conf-is-set:
	$(info "CONF_DIR is $(CONF_DIR)")
	test -n $(CONF_DIR)


functions/z.fish: test-conf-is-set
	curl https://raw.githubusercontent.com/sjl/z-fish/master/z.fish > $@
