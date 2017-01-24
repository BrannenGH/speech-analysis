#!/usr/bin/env python3

from __future__ import print_function
#TODO check if needed now that py3 is out
import wave
import numpy
import pyqt5.*
    
def checkWave(wave=None) -> status:
    if __name__ == '__main__' and wave is None:
        #TODO write basic file chooser UI, or just call qt's
        wave = wave.readfile(filelocation, 'r')
        return 0
    elif wave is None:
        return 1
        
def main(wave=None):
    if checkWave(wave) == 1:
        print('ERROR: Wave file not specified', file=sys.stderr)
        except Not_specified
        
