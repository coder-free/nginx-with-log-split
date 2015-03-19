
default:	build

clean:
	rm -rf Makefile objs

build:
	$(MAKE) -f objs/Makefile
	$(MAKE) -f objs/Makefile manpage

install:
	$(MAKE) -f objs/Makefile install

upgrade:
	/mnt/share/nginx-1.5.9/sbin/nginx -t

	kill -USR2 `cat /mnt/share/nginx-1.5.9/logs/nginx.pid`
	sleep 1
	test -f /mnt/share/nginx-1.5.9/logs/nginx.pid.oldbin

	kill -QUIT `cat /mnt/share/nginx-1.5.9/logs/nginx.pid.oldbin`
