# Convolution

Take two arrays, for example two 10,000 item arrays filled with sin and cos function.

Reverse the second array, and multiply and add each position.

See [here](https://en.wikipedia.org/wiki/Convolution)

## Performance

| Language | Average Time |
| :------- | :----------- |
| cpython  | 9-10 seconds |
| pypy     | 220-250ms    |
| C (-O3)  | 35-37ms      |
| Rust     | 15-20ms      |

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
git:(master) ✗ gcc main.c -O3 -Wall -Werror -pedantic -o convo && ./convo
Start
Done.
Time taken 0 seconds 35 milliseconds