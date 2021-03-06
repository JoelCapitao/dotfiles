.PHONY: all
all: dotfiles config

.PHONY: dotfiles
dotfiles: ## Installs the dotfiles.
	# add aliases for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".travis.yml" -not -name ".git" -not -name ".*.swp" -not -name ".gnupg"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \
	gpg --list-keys || true;
	ln -sfn $(CURDIR)/.gnupg/gpg.conf $(HOME)/.gnupg/gpg.conf;
	ln -sfn $(CURDIR)/.gnupg/gpg-agent.conf $(HOME)/.gnupg/gpg-agent.conf;
	ln -fn $(CURDIR)/gitignore $(HOME)/.gitignore;
	ln -sfn $(CURDIR)/tmuxifier_layouts $(HOME)/.tmuxifier_layouts
	#mkdir -p $(HOME)/.local/share;
	#ln -snf $(CURDIR)/.fonts $(HOME)/.local/share/fonts;
	#ln -snf $(CURDIR)/.bash_profile $(HOME)/.profile;
	#if [ -f /usr/local/bin/pinentry ]; then \
	#	sudo ln -snf /usr/bin/pinentry /usr/local/bin/pinentry; \
	#fi;


.PHONY: config
config: ## Installs the configuration files.
	for file in $(shell find $(CURDIR)/config -mindepth 1 -maxdepth 1); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/.config; \
	done; \

.PHONY: test
test: shellcheck ## Runs all the tests on the files in the repository.

# if this session isn't interactive, then we don't want to allocate a
# TTY, which would fail, but if it is interactive, we do want to attach
# so that the user can send e.g. ^C through.
INTERACTIVE := $(shell [ -t 0 ] && echo 1 || echo 0)
ifeq ($(INTERACTIVE), 1)
	DOCKER_FLAGS += -t
endif

.PHONY: shellcheck
shellcheck: ## Runs the shellcheck tests on the scripts.
	docker run --rm -i $(DOCKER_FLAGS) \
		--name df-shellcheck \
		-v $(CURDIR):/usr/src:ro \
		--workdir /usr/src \
		koalaman/shellcheck ./test.sh

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
