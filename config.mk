# dmenu version
VERSION=	4.5

# paths
PREFIX=		/usr/local
MANPREFIX=	${PREFIX}/share/man

# includes
BASEINC=	-I${.CURDIR}
BASEINC+=	-I/usr/include
BASEINC+=	-I/usr/local/include
X11INC=		-I/usr/include/X11
X11INC+=	-I/usr/local/include/X11
FREETYPEINC=	-I/usr/include/freetype2
FREETYPEINC+=	-I/usr/local/include/freetype2

# libs
BASELIB=	-L/usr/lib
BASELIB+=	-L/usr/local/lib
X11LIB=		-L/usr/lib/X11
X11LIB+=	-L/usr/local/lib/X11

# Xinerama, comment if you don't want it
XINERAMALIBS=	-lXinerama
XINERAMAFLAGS=	-DXINERAMA

# includes and libs
INCS=		${BASEINC} ${X11INC} ${FREETYPEINC}
LIBS=		${BASELIB} ${X11LIB} -lc -lX11 -lXft ${XINERAMALIBS}

# flags
#CPPFLAGS=	-D_BSD_SOURCE -D_POSIX_C_SOURCE=2 -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
CPPFLAGS=	-D_BSD_SOURCE -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
CFLAGS+=	-std=c99 -pedantic -Wall -Wextra -Wformat ${INCS} ${CPPFLAGS}
#CFLAGS=	-std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
LDFLAGS+=	${LIBS}

# compiler and linker
CC?=		cc
