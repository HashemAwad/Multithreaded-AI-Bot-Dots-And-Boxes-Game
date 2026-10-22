CC = gcc
CFLAGS = -Wall -pthread
LDLIBS = -lm

dots_and_boxes: dots_and_boxes.c Logic.c Bot.c game.h
	$(CC) $(CFLAGS) dots_and_boxes.c Logic.c Bot.c -o $@ $(LDLIBS)

# the test files #include Logic.c and Bot.c, so they are not linked again
test_logic: test_logic.c Logic.c Bot.c game.h
	$(CC) $(CFLAGS) test_logic.c -o $@ $(LDLIBS)

test_bot: test_bot.c Logic.c Bot.c game.h
	$(CC) $(CFLAGS) test_bot.c -o $@ $(LDLIBS)

run: dots_and_boxes
	./dots_and_boxes

test: test_logic test_bot
	./test_logic && ./test_bot

clean:
	rm -f dots_and_boxes test_logic test_bot

.PHONY: run test clean
