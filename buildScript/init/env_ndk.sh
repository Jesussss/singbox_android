#!/bin/bash

if [ -z "$ANDROID_HOME" ]; then
  if [ -d "$HOME/sdk/android" ]; then
    export ANDROID_HOME="$HOME/sdk/android"
  elif [ -d "$HOME/.local/lib/android/sdk" ]; then
    export ANDROID_HOME="$HOME/.local/lib/android/sdk"
  elif [ -d "$HOME/sdk/android" ]; then
    export ANDROID_HOME="$HOME/sdk/android"
  fi
fi

_NDK="$ANDROID_HOME/ndk/25.1.8937393"
[ -f "$_NDK/source.properties" ] || _NDK="$ANDROID_NDK_HOME"
[ -f "$_NDK/source.properties" ] || _NDK="$NDK"
[ -f "$_NDK/source.properties" ] || _NDK="$ANDROID_HOME/ndk-bundle"

if [ ! -f "$_NDK/source.properties" ]; then
  echo "Error: NDK not found."
  exit 1
fi

export ANDROID_NDK_HOME=$_NDK
export NDK=$_NDK
