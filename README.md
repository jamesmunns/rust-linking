# Convolution

Take two arrays, for example two 10,000 item arrays filled with sin and cos function.

Reverse the second array, and multiply and add each position.

See [here](https://en.wikipedia.org/wiki/Convolution)

## Performance

| Language          | Average Time |
| :---------------- | :----------- |
| cpython           | 9-10 seconds |
| pypy              | 220-250ms    |
| C (-O3)           | 14-17ms      |
| C (memset + -O3)  | 8-11ms       |
| Rust (--release)  | 15-18ms      |
| Pascal            | 35-40ms      |

### Python

```bash
➜  python git:(master) ✗ python convolution.py
9.31936502457
➜  python git:(master) ✗ python3 convolution.py
10.76568078994751
➜  python git:(master) ✗ pypy convolution.py
0.242394924164
```

### Rust

```bash
git:(master) ✗ cargo run --release
   ...
Duration { secs: 0, nanos: 17353000 }
```

## C

```bash
➜  c-lang git:(master) ✗ gcc main.c -O3 -Wall -Werror -pedantic -o convo && ./convo
Start
Done.
Time taken 0 seconds 16 milliseconds

➜  c-lang git:(master) ✗ gcc main.c -O3 -Wall -Werror -pedantic -DUSE_HAX -o convo && ./convo
Start
Done.
Time taken 0 seconds 9 milliseconds
```

## Pascal

```bash
➜  pascal git:(master) ✗ fpc -O3 ./convolution.pas && ./convolution
Free Pascal Compiler version 3.0.0 [2015/11/14] for i386
Copyright (c) 1993-2015 by Florian Klaempfl and others
Target OS: Darwin for i386
Compiling ./convolution.pas
Assembling (pipe) convolution.s
Linking convolution
54 lines compiled, 1.0 sec

Start
Done
Pascal time taken 0 seconds 37 milliseconds
```