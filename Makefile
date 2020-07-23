img = aozora-mobi
bindir = ~/bin

build:;
	docker build -t $(img) .

build-no-cache:;
	docker build --no-cache -t $(img) .

install:;
	cp aozora-mobi $(bindir)
	chmod 755 $(bindir)/aozora-mobi
bash:;
	docker run -it -v`pwd`:/work aozora-mobi /bin/bash

run:;
	docker run -it -p5900:5900 -v`pwd`:/work aozora-mobi

clean:;
	rm -f *~ */*~
