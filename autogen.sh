#! /bin/sh

if glibtoolize --version > /dev/null 2>&1; then
  LIBTOOLIZE='glibtoolize'
else
  LIBTOOLIZE='libtoolize'
fi

command -v command >/dev/null 2>&1 || {
  echo "command is required, but wasn't found on this system"
  exit 1
}

command -v $LIBTOOLIZE >/dev/null 2>&1 || {
  echo "libtool is required, but wasn't found on this system"
  exit 1
}

command -v autoconf >/dev/null 2>&1 || {
  echo "autoconf is required, but wasn't found on this system"
  exit 1
}

command -v automake >/dev/null 2>&1 || {
  echo "automake is required, but wasn't found on this system"
  exit 1
}

if [ ! -x "`which pkg-config 2>/dev/null`" ] ; then
  echo "pkg-config is required, but wasn't found on this system"
  exit 1
fi

if [ -x "`which autoreconf 2>/dev/null`" ] ; then
  exec autoreconf -ivf
fi

$LIBTOOLIZE && \
aclocal && \
automake --add-missing --force-missing --include-deps && \
autoconf
