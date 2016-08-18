# Convolution

Take two arrays, for example two 10,000 item arrays filled with sin and cos function.

Reverse the second array, and multiply and add each position.

See (here)[https://en.wikipedia.org/wiki/Convolution]

## Performance

### Python

```bash
git:(master) ✗ python convolution.py 
    ...
9.98791909218 (seconds)
```

### Rust

```bash
git:(master) ✗ cargo run --release
   ...
Duration { secs: 0, nanos: 24089000 }
```
