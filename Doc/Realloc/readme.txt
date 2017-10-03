Why not realloc

$Id: why_not_realloc.txt,v 1.12 2009/02/22 14:55:53 db Exp db $


realloc for the new C programmer is probably best avoided for the following reasons

1. realloc can leave stale pointers

If you have references to structures allocated by malloc, these references can now be bogus since realloc is free to move where it reallocates your memory. In other words, it can do the equivalent of a malloc, memcpy of your data to a new location then it frees your old memory. So your pointers to that object are now pointing into garbage. This can also lead to a security bug.

2. realloc can introduce unexpected time delays

As realloc is free to do the equivalent of a malloc, memcpy and free of the original memory, this can happen at unanticpated times. Imagine the case where you have allocated 1mb of data and you decide to realloc to 1mb + 10k of data; if you are unlucky you will get the case where the malloc package has to alloc a new pointer and move your data. This might not be a problem with a GUI, the user just has to wait, but if it happens on a audio capture you could be very annoyed. It is far easier and most likely faster to simply allocate another 10k of space and link it into your linked list.

3. Using realloc is a misunderstanding of how to do variable sized data in C

C is not a variant of perl/fortran or any other language with variable sized arrays such as python. One traditional C way of thinking of resizing something in C is to use a linked list. e.g. a linked list of char buffers. This is not the right data structure to use for some math problems, but is typical for so-called "infinite strings". For examples of reading a line from a stream without limits. [[Code_Snippets] reading a line from a stream without artificial limits ]

4. realloc is non portable (to a certain extent)

realloc as defined by ANSI is defined, but not the entire world has a ANSI compliant library. This used to be painfully obvious between SYSv and BSD. It is far less of a problem nowadays, but might be something worth considering if you have to work with an old non compliant library.

5. but I need to read an entire line of arbitrary length

There are functions available to do this already, there is no need for you to use realloc. Look for fgetln or getline on your system or on the web for Snippets#reading_a_line_from_a_stream_without_artifical_limits other solutions.
You've read this far and you still want to use realloc, what not to do

1. Do not realloc your buffer by 1 byte at a time.

A typical beginners mistake is to start with an empty buffer then increase the buffer by 1 as each char is read. This is guaranteed to churn your memory heap (with allocators that use such) malloc and friends are usually fairly expensive operations. Some typical strategies are to grow the buffer by a power of 2 each time, this is really up to you on how your data will grow.

2. Be very careful about the return value from realloc.

Whatever you do, do not automatically assume your new allocation exists, realloc can fail like malloc.


       char    *p;
       ...
       p = realloc(p, new_size);
       ...


What happens if realloc fails and you now have lost your original buffer pointer?

3. Using realloc to return memory to the system.

There are experienced programmers who will allocate much more memory than they need, then use realloc to reduce the size of the allocation rather than increase it. Be careful with this. It does make assumptions about how your malloc package works, it certainly would not work with a block (slab) allocator. Be aware of the malloc pointer overhead, you may not really return very much to the system at all. e.g.

       #define LARGEBUF        1024
       char *buf;
       buf = malloc(LARGEBUF);
       ...
       newbuf = realloc(buf, LARGEBUF-10);

If your buffer really only has 10 bytes it can trim down, your malloc package may not even bother reusing this.


--Dianora 15:08, 22 February 2009 (UTC) 