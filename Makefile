SHELL := /usr/bin/env bash

.PHONY: install clean superclean
.DEFAULT_GOAL := install

install: LearningSPARQLExamples.zip tools/jena/bin/arq
	unzip -o $<
	ln -f -s $$(realpath $(word 2,$^)) ~/.local/bin/arq

clean:
	rm -f LearningSPARQLExamples.zip

superclean: clean
	$(MAKE) -s -C tools/jena clean

tools/jena/bin/arq:
	which java || \
	(sudo apt update && sudo apt -y install default-jre)
	$(MAKE) -s -C tools/jena

LearningSPARQLExamples.zip:
	curl http://learningsparql.com/2ndeditionexamples/$@ > $@
