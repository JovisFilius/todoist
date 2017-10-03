.PHONY: install
install: prepare
	go install

.PHONY: test
test: prepare
	go test -v

.PHONY: prepare
prepare: filter_parser.y
	dep ensure
	go get -u golang.org/x/tools/cmd/goyacc
	goyacc -o filter_parser.go filter_parser.y

.PHONY: clean
clean:
	rm -f y.output filter_parser.go
