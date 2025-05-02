
push:
	@git add .
	@git commit -am "Update!" || true
	@git push



## =====
## Tests
## =====

bare:
	@bash tests/bare/$(test)-test.sh
