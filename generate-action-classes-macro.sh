#!/bin/bash

# If this script is not ran by Xcode, PROJECT_DIR needs to be set
if [ -z "$PROJECT_DIR" ]; then
	PROJECT_DIR=".";
fi

cd "$PROJECT_DIR/Actions"
echo -e "// DO NOT EDIT THIS FILE.\n// This file is written automatically by a “Run Script” build phase" > "../ActionClassesMacro.h"
echo "#define ACTION_CLASSES \\" >> "../ActionClassesMacro.h"
find . -name '*Action.m' ! -name '*BaseAction.m' | perl -p -e 's=^\./(.*)\.m$=        @"$1", \\=;' >> "../ActionClassesMacro.h"
echo "        nil" >> "../ActionClassesMacro.h"
