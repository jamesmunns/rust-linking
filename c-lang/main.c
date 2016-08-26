#include <stdio.h>
#include <math.h>
#include <time.h>

#define ARRAY_SZ(_ax) (sizeof(_ax)/sizeof(_ax[0]))

// NOTE! the array that `output` points to must be >= a_len+b_len-1
void convolution(const double* input_a, const int a_len,
                 const double* input_b, const int b_len,
                 double* output)
{
    // Not sure if it is fair to do the zeroing inside the timed loop, though
    //   I do it in Rust as well. Adds ~20ms. Moved to main() for now
    //
    // for(int i=0; i<a_len; i++)
    // {
    //     for(int j=0; j<b_len; j++)
    //     {
    //         output[i+j] = 0.0;
    //     }
    // }

    for(int i=0; i<a_len; i++)
    {
        for(int j=0; j<b_len; j++)
        {
            output[i+j] += (input_a[i] * input_b[j]);
        }
    }

    return;
}

int main()
{
    double input_a[10000] = {0.0};
    double input_b[10000] = {0.0};
    double output[ARRAY_SZ(input_a)+ARRAY_SZ(input_b)-1];

    clock_t start;
    clock_t diff;

    for(int i=0; i<10000; i++)
    {
        input_a[i] = sin((double)i / 8.0);
        input_b[i] = cos((double)i / 8.0);
    }

    printf("Start\n");

    start = clock();

    convolution(input_a, ARRAY_SZ(input_a),
                input_b, ARRAY_SZ(input_b),
                output);

    diff = clock() - start;

    printf("Done.\n");

    int msec = diff * 1000 / CLOCKS_PER_SEC;
    printf("Time taken %d seconds %d milliseconds\n", msec/1000, msec%1000);
}
