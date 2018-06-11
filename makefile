SOURCE :=$(wildcard *.cc)
OBJS := $(patsubst %.c,%.o,$(patsubst %.cc,%.o,$(SOURCE)))

TARGET := myserver
CC := g++
LIBS := -lpthread
CFLAGS := -std=c++11 
CXXFLAGS:=$(CFLAGS)

.PHONY : objs clean veryclean rebuild all
all: $(TARGET)
objs: $(OBJS)
rebuild: veryclean all
clean:
	rm -fr *.o
veryclean:clean
	rm -rf $(TARGET)

$(TARGET):$(OBJS)
	$(CC) $(CXXFLAGS) -o $@ $(OBJS) $(LDFLAGS) $(LIBS)