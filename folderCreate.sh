#!/bin/bash

mkdir -p folder1/folder2/folder3
mkdir -p folder1/folder2a/folder3a
mkdir -p folder1/folder2b/folder3b

[ -d "folder2" ] && echo 'folder2 exists' || echo 'folder2 does not exist'

[ ! -d "folder2" ] && mkdir -p folder2/a/b/c/d && echo 'folders: folder2/a/b/c/d created'
