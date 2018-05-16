
#include <stdio.h>
#include <stdlib.h>
#include "portaudio.h"
#include <vector>
#include <fstream>
#include <iterator>

using namespace std;



/* #define SAMPLE_RATE  (17932) // Test failure to open with this value. */
#define SAMPLE_RATE  (44100)
#define FRAMES_PER_BUFFER (512)
#define NUM_CHANNELS    (1) // 2 - stereo line; 1 - mono mic
/* #define DITHER_FLAG     (paDitherOff) */
#define DITHER_FLAG     (0) /**/
#define WRITE_TO_FILE   (1) /* Set to 1 if you want to capture the recording to a file. */

/* Select sample format. */
#define PA_SAMPLE_TYPE  paInt16
typedef short SAMPLE;
#define SAMPLE_SILENCE  (0)
#define PRINTF_S_FORMAT "%d"

PaStream* stream;
PaError curError = paNoError; // For error output
bool isInitialized(false);
bool isActive(false);





typedef struct
{
    int          frameIndex;  /* Index into sample array. */
    int          maxFrameIndex;
    SAMPLE      *recordedSamples;
}
paTestData;

/* This routine will be called by the PortAudio engine when audio is needed.
** It may be called at interrupt level on some machines so don't do anything
** that could mess up the system like calling malloc() or free().
*/
static int recordCallback( const void *inputBuffer, void *outputBuffer,
                           unsigned long framesPerBuffer,
                           const PaStreamCallbackTimeInfo* timeInfo,
                           PaStreamCallbackFlags statusFlags,
                           void *userData )
{
    paTestData *data = (paTestData*)userData; // data!!!
    const SAMPLE *rptr = (const SAMPLE*)inputBuffer;
    SAMPLE *wptr = &data->recordedSamples[data->frameIndex * NUM_CHANNELS];
    long framesToCalc;
    long i;
    int finished;
    unsigned long framesLeft = data->maxFrameIndex - data->frameIndex;

    (void) outputBuffer; /* Prevent unused variable warnings. */
    (void) timeInfo;
    (void) statusFlags;
    (void) userData;

    if( framesLeft < framesPerBuffer )
    {
        framesToCalc = framesLeft;
        finished = paComplete;
    }
    else
    {
        framesToCalc = framesPerBuffer;
        finished = paContinue;
    }

    if( inputBuffer == NULL )
    {
        for( i=0; i<framesToCalc; i++ )
        {
            *wptr++ = SAMPLE_SILENCE;  /* left */
            if( NUM_CHANNELS == 2 ) *wptr++ = SAMPLE_SILENCE;  /* right */
        }
    }
    else
    {
        for( i=0; i<framesToCalc; i++ )
        {
            *wptr++ = *rptr++;  /* left */
            if( NUM_CHANNELS == 2 ) *wptr++ = *rptr++;  /* right */
        }
    }
    data->frameIndex += framesToCalc;
    return finished;
}

/* This routine will be called by the PortAudio engine when audio is needed.
** It may be called at interrupt level on some machines so don't do anything
** that could mess up the system like calling malloc() or free().
*/
static int playCallback( const void *inputBuffer, void *outputBuffer,
                         unsigned long framesPerBuffer,
                         const PaStreamCallbackTimeInfo* timeInfo,
                         PaStreamCallbackFlags statusFlags,
                         void *userData )
{
    paTestData *data = (paTestData*)userData;
    SAMPLE *rptr = &data->recordedSamples[data->frameIndex * NUM_CHANNELS];
    SAMPLE *wptr = (SAMPLE*)outputBuffer;
    unsigned int i;
    int finished;
    unsigned int framesLeft = data->maxFrameIndex - data->frameIndex;

    (void) inputBuffer; /* Prevent unused variable warnings. */
    (void) timeInfo;
    (void) statusFlags;
    (void) userData;

    if( framesLeft < framesPerBuffer )
    {
        /* final buffer... */
        for( i=0; i<framesLeft; i++ )
        {
            *wptr++ = *rptr++;  /* left */
            if( NUM_CHANNELS == 2 ) *wptr++ = *rptr++;  /* right */
        }
        for( ; i<framesPerBuffer; i++ )
        {
            *wptr++ = 0;  /* left */
            if( NUM_CHANNELS == 2 ) *wptr++ = 0;  /* right */
        }
        data->frameIndex += framesLeft;
        finished = paComplete;
    }
    else
    {
        for( i=0; i<framesPerBuffer; i++ )
        {
            *wptr++ = *rptr++;  /* left */
            if( NUM_CHANNELS == 2 ) *wptr++ = *rptr++;  /* right */
        }
        data->frameIndex += framesPerBuffer;
        finished = paContinue;
    }
    return finished;
}
//Initialization
bool init(){

    curError = Pa_Initialize();
    isInitialized = ( curError != paNoError ) ? false : true;
    if (!isInitialized) printf("\nInitialization error!\n");

    return isInitialized;
}
//Open stream & start record
bool open(int typeofrecord, int duration){

    if(!isInitialized) return false;

    // stream close()?

    PaStreamParameters  inputParameters;
    paTestData          data;
    int                 i;
    int                 totalFrames;
    int                 numSamples;
    int                 numBytes;
    //double              average;

    printf("Starting record!\n"); fflush(stdout);

    totalFrames = duration * SAMPLE_RATE;
    data.maxFrameIndex = totalFrames; /* Record for a ... seconds */
    data.frameIndex = 0;
    numSamples = totalFrames * NUM_CHANNELS;
    numBytes = numSamples * sizeof(SAMPLE);
    data.recordedSamples = (SAMPLE *) malloc( numBytes ); /* From now on, recordedSamples is initialised */
    if( data.recordedSamples == NULL )
    {
        printf("Could not allocate record array\n");
        return false;
    }
    for( i=0; i<numSamples; i++ ) data.recordedSamples[i] = 0; ////////////

    inputParameters.device = 5; //Pa_GetDefaultInputDevice(); /* for default input device */

    if (inputParameters.device == paNoDevice) {              //
        fprintf(stderr,"Error: No default input device.\n"); // if default
        return false;                                        //
    }                                                        //
//Params
    inputParameters.channelCount = NUM_CHANNELS;                    // monno/stereo input
    inputParameters.sampleFormat = PA_SAMPLE_TYPE;
    inputParameters.suggestedLatency = Pa_GetDeviceInfo( inputParameters.device )->defaultLowInputLatency;
    inputParameters.hostApiSpecificStreamInfo = NULL;

    /* Record some audio. -------------------------------------------- */
    curError = Pa_OpenStream(
              &stream,
              &inputParameters,
              NULL,                  /* &outputParameters, */
              SAMPLE_RATE,
              FRAMES_PER_BUFFER,
              paClipOff,      /* we won't output out of range samples so don't bother clipping them */
              recordCallback,
              &data );
    if( curError != paNoError ) {
        printf("Opening error!\n");
        stream=NULL;
        return false;
    }
    curError = Pa_StartStream( stream ); // Start recording
    if( curError != paNoError ) {printf("\nError! Record can't start!\n"); stream=NULL; return false;}
    printf("\n=== Now recording!! Please speak into the microphone. ===\n"); fflush(stdout);

    while( ( curError = Pa_IsStreamActive( stream ) ) == 1 )
    {
        Pa_Sleep(1000);
        printf("index = %d\n", data.frameIndex ); fflush(stdout);
    }
    if( curError < 0 ) {printf("\nRecording error!\n"); fflush(stdout); return false;}

    isActive = true;

// Write frames to file
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

    std::vector<SAMPLE> values;

    for(i=0;i<numSamples;i++){

        values.push_back(data.recordedSamples[i]);
        //fwrite (values[i],sizeof(SAMPLE), 1,fval);

    }

    std::ofstream output_file("./values.txt");
    std::ostream_iterator<SAMPLE> output_iterator(output_file, "\n");
    std::copy(values.begin(), values.end(), output_iterator);


// Write sound to file
#if WRITE_TO_FILE
    {/////////////////////////////////////////
        FILE  *fid;
        char recordname0[20];
        sprintf (recordname0,"%s","bnoise.raw");
        char recordname1[20];
        sprintf (recordname1, "%s%d%s", "recorded",typeofrecord,".raw");
        (typeofrecord == 0) ? (fid = fopen(recordname0, "wb")):(fid = fopen(recordname1, "w+"));

        if( fid == NULL )
        {
            printf("Could not open file.");
            return false;
        }
        else
        {
            fwrite( data.recordedSamples, NUM_CHANNELS * sizeof(SAMPLE), numSamples, fid );
            fclose( fid );
            (typeofrecord == 0) ? (printf("Wrote data to '%s'\n",recordname0 )):(printf("Wrote data to '%s'\n", recordname1));
            return true;
        }
    }/////////////////////////////////////////
#endif

    return true;
}
// Close stream
void close(){

    if(!isInitialized||stream==NULL) return;
    if(isActive){
        isActive = false;
        curError = Pa_StopStream(stream);
    }
    curError=Pa_CloseStream(stream);
    stream=NULL;
}

double record(int numb,int duration){
    init();
    open(numb,duration); //0 - noise, 4 - duration in sec
    close();
}

/*******************************************************************/

int main(){

    record(0,2);



    return 0;
}
