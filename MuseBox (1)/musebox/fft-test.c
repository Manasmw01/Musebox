/* 
 * Creates frequency spectrum visualizer for different audio frequencies
 */ 

//#include "fbputchar.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdint.h>
//#include "usbkeyboard.h"
#include <math.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>

#define USER_SPACE_FFT
struct complex_num {
    int16_t real;
    int16_t imag;
};

#include "fft_driver.h"

#define SAMPLENUM 8192
#define H25K 4096
static int slot_values[12] = {31, 72, 150, 250, 440, 630, 1000, 2500, 5000, 8000, 14000, 20000};
static int bin_centers[12] = {6, 13, 28, 46, 82, 117, 186, 464, 929, 1486, 2601, 3715};
static struct complex_num freq_data[SAMPLENUM];

int main()
{
    struct complex_num bins[SAMPLENUM];
    char *file = "/dev/fft_driver";
    int fft_fd;

    if ((fft_fd = open(file, O_RDWR)) == -1) {
        fprintf(stderr, "could not open %s\n", file);
        return -1;
    }

    if (ioctl(fft_fd, FFT_DRIVER_READ_TRANSFORM, &bins)) {
        perror("ioctl write failed!");
        close(fft_fd);
        return -1;
    }
    // print the bin
    printf("real: %d, imag: %u\n", bins[0].real, (uint16_t) bins[0].imag);

    close(fft_fd);
    return 0;
}
