#!/bin/sh

if [ ! -e "$INPUT_TEMPLATES_PATH" ]; then
	echo "Template file/directory set with TEMPLATES_PATH does not exist." && exit 1
fi

if [ "$INPUT_RUN_INIT" ]; then
	packer init "$INPUT_TEMPLATES_PATH"
fi


sh -c "packer validate ${INPUT_ARGS} ${INPUT_TEMPLATES_PATH}"
