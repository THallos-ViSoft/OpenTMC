
# (C) ViSoft@email.cz, 2015
# Designed for gcc / CLang
# makefile v1.3

#-----------------------------------------------------------------------------

#SUFFIX = dll
#SUFFIX = so
SUFFIX = exe

#Jmeno souboru zavislosti:
DEPNAME = dep.list

# NAME bude jmeno prikladu, PRJNAME bude jmeno objektu.
# Obe budou predana zvenku:
#PRJNAME = 
#NAME = 

CC     = gcc
#CC     = CLang

# Prizpusobeni znakove sady editoru se znakovou sadou operacniho systemu:
# Je vyzadovano, kdyz je pouzito makro TEXT().
# Plati jen pro gcc, CLang chce vsechny zdrojaky v UTF-8.
#LOCALIZE = -finput-charset=Latin1 -fwide-exec-charset=UTF-8 -fexec-charset=UTF-8
#LOCALIZE = -fexec-charset=CP1252

OPTIMIZATION = s

ODIR   = Bin

#IDIR pro GTK:
#IDIR   = include -I\PROGRAMY\MinGW\gtk\include\gtk-3.0 -I\PROGRAMY\MinGW\gtk\include\glib-2.0 -I\PROGRAMY\MinGW\gtk\lib\glib-2.0\include -I\PROGRAMY\MinGW\gtk\include\pango-1.0 -I\PROGRAMY\MinGW\gtk\include\cairo -I\PROGRAMY\MinGW\gtk\include\gdk-pixbuf-2.0 -I\PROGRAMY\MinGW\gtk\include\atk-1.0

IDIR   = Include
SDIR   = Src

#LDIR pro GTK:
#LDIR   = lib -L\PROGRAMY\MinGW\gtk\lib

LDIR   = Lib

# Seznam cilovych objektu; Nutno udrzovat aktualni,
# aby souhlasil se seznamem automaticky generovanych pravidel
# viz nize!
#_OBJ = $(NAME).o $(PRJNAME).o
_OBJ = $(NAME).o
OBJ  = $(patsubst %,$(ODIR)/%,$(_OBJ))

#TARGET pro DLLku:
#TARGET  = -shared --out-implib=lib${module}.dll.a

#LIBS pro ViLib:
#LIBS   = -ldyno -lerr

#LIBS pro GTK:
#LIBS = -latk-1.0 -lcairo -lgtk-3 -lgobject-2.0

#LIBS pro pthread:
#LIBS = -lpthread -lrt

#lcygwin je potreba pro nanosleep
#LIBS = -lpthread -lcygwin
LIBS = -lpthread

#CFLAGS = -I$(IDIR) -O$(OPTIMIZATION) $(TARGET) -std=c99 -Wall -pedantic -g
# -std=c99 mi nedovolil pouzivat "itoa()". Bez parametru -std=c99 je to asi c90.
# Zjistil jsem, ze -Wall, -pedantic a -W nejsou prenositelne na POSIX systemy.
# CFLAGS = -I$(IDIR) -O$(OPTIMIZATION) $(TARGET) -Wall -pedantic -g
CFLAGS = -I$(IDIR) -O$(OPTIMIZATION) $(TARGET) -g

#-----------------------------------------------------------------------------

# univerzálni pravidlo pro generování všech objektových souborů:
%.o : $(SDIR)/%.c
	$(CC) -c -o $(ODIR)/$@ $< $(CFLAGS)

all: dep $(NAME) clean strip doc

# Generovani zavislosti pro kompilovani
# (seznam vygenerovanych pravidel musi byt stejny, jako $(_OBJ)):
dep: 
	$(CC) -I$(IDIR) -MM $(SDIR)/*.c >$(DEPNAME)
-include $(DEPNAME)
#TADY NESMI BYT PRAZDNY RADEK!
# Linkovani hotovych objektu:
$(NAME): $(_OBJ)
	$(CC) $(CFLAGS) -L$(LDIR) -o $(ODIR)/$(NAME).$(SUFFIX) $(OBJ) $(LIBS) $(LOCALIZE)

.PHONY: flash clean strip doc

flash:
# Pro MCU tu bude volani programatoru,
# pro x86 tu bude spusteni binarky:
	./$(ODIR)/$(NAME).$(SUFFIX)

clean:
# Nejdriv exportovat "$(PRJNAME).o" do "lib$(PRJNAME).a",	
# potom smazat vsechny objekty, a soubor zavislosti:	
#	cp $(ODIR)/$(PRJNAME).o $(ODIR)/lib$(PRJNAME).a
	rm -f $(ODIR)/*.o
	rm -f $(DEPNAME)

strip:
	strip $(ODIR)/$(NAME).$(SUFFIX)

doc:
# Sem prikazy pro DOXYGEN:

#-----------------------------------------------------------------------------
