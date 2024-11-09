.PHONY: build
build:
	mkdir -p target
	pdflatex -output-directory=target -output-directory=target thesis
	bibtex target/thesis
	pdflatex -output-directory=target -output-directory=target thesis
	pdflatex -output-directory=target -output-directory=target thesis
	makeindex -t target/thesis.glg -s target/thesis.ist -o target/thesis.gls target/thesis.glo
	makeindex -t target/thesis.alg -s target/thesis.ist -o target/thesis.acr target/thesis.acn
	makeindex -t target/thesis.ilg -o target/thesis.ind target/thesis.idx
	pdflatex -output-directory=target -output-directory=target thesis
	pdflatex -output-directory=target -output-directory=target thesis
	mv target/thesis.pdf .

.PHONY: clean
clean:
	rm -rf target
