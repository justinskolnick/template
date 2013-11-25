JS_BASE =	scripts/default.js
JS_ALL =	scripts/default.all.js
JS_MIN =	scripts/default.min.js

JS_FILES =	$(JS_BASE)

all: concat minify

concat: $(JS_FILES)
	cat $^ > $(JS_ALL)

minify:	$(JS_ALL)
	yuicompressor --charset utf-8 --verbose --type js $< > $(JS_MIN)
	@echo

clean:
	rm -f $(JS_ALL)
	rm -f $(JS_MIN)

.PHONY: all