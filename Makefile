JS_BASE =       public/scripts/default.js
JS_ALL =        public/scripts/default.all.js
JS_MIN =        public/scripts/default.min.js

JS_FILES =      $(JS_BASE)

CSS_BASE =			public/styles/default.scss
CSS_FINAL =			public/styles/default.css

all: concat minify

concat: $(JS_FILES)
	cat $^ > $(JS_ALL)

minify: $(JS_ALL)
	yuicompressor --charset utf-8 --verbose --type js $< > $(JS_MIN)
	@echo

clean:
	rm -f $(JS_ALL)
	rm -f $(JS_MIN)

watch:	$(CSS_BASE)
	sass --watch $(CSS_BASE):$(CSS_FINAL)
	
prefix: $(CSS_FINAL)
	autoprefixer $(CSS_FINAL) -o $(CSS_FINAL)

.PHONY: all