#!/bin/sh
# shellcheck disable=SC2046 # because I actually want splitting
echo "Compiling..."
javac -d ./bin/ $(find src | grep .java) > compile.log 2>&1
_compileStatus=$?
if [ $_compileStatus = 0 ]; then
    java -classpath ./bin/ me.second2050.raytracer.RaytracerMain
    exit $?
else
    cat compile.log
    exit $_compileStatus
fi
