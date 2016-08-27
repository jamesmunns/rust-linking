function convolve(a, b) {
  const output = Array(a.length + b.length - 1).fill(0);
  a.forEach((av, i) => {
    b.forEach((bv, j) => {
      output[i + j] += a[i] * b[j];
    });
  });
  return output;
}

const a = Array(5000).fill().map((_, x) => Math.sin(Math.PI * (x / 8.0)));
const b = Array(5000).fill().map((_, x) => Math.sin(Math.PI * (x / 8.0)));

Array(1000).fill().forEach(() => {
    const start = new Date().getTime();
    convolve(a, b);
    console.log(`Elapsed Time: ${new Date().getTime() - start}ms`);
});
