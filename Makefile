#######################################################################
#                       By yychi at 2024-03-06                        #
#######################################################################

BLOG_PATH = "${HOME}/Documents/BlogHugo/static"
PYTHON_BIN = `which python`
RM = rm -f
objects := $(wildcard *.md)

all:
	@echo $(BLOG_PATH) is $(PYTHON_BIN)
	@echo $(objects)

install: resume_cn.html
	cp resume_cn.html $(BLOG_PATH)

resume_cn.html: resume_cn.md resume.py
	$(PYTHON_BIN) resume.py resume_cn.md --no-pdf

clean:
	$(RM) *.html *.pdf

.PHONY: install clean all
