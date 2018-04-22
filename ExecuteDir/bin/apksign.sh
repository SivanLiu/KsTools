#!/usr/bin/env bash
java -Xmx2048m -XX:-UseParallelGC -XX:MinHeapFreeRatio=15 -jar bin/jar/KsToolsSrc-1.0.jar ++sign input/src