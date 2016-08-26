import time
import math

def convolution(input_a, input_b):
    output = [0 for _ in range(len(input_a) + len(input_b) - 1)]

    for a_i, a in enumerate(input_a):
        for b_i, b in enumerate(input_b):
            output[a_i+b_i] += (float(a)*float(b))


    return output


if __name__ == '__main__':
    print(convolution([2.0, -2.0, 1], [1.0, 3.0, 0.5, -1]))

    new_a = [math.sin(math.pi * (float(x)/8.0)) for x in range(0, 5000)]
    new_b = [math.cos(math.pi * (float(x)/8.0)) for x in range(0, 5000)]







    start = time.time()
    convolution(new_a, new_b)
    print(time.time() - start)
