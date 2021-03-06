#!/bin/bash -xe

# S3 Storage Plugin - A plugin for Orthanc DICOM Server for storing
# DICOM data in Amazon Simple Storage Service (AWS S3).
#
# Copyright (C) 2018 (Radpoint Sp. z o.o., Poland)
# Marek Kwasecki, Bartłomiej Pyciński
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

BUILD_DIR="orthanc/build"
mkdir -p ${BUILD_DIR} || true
INSTALL_DIR="install"
mkdir ${BUILD_DIR}/${INSTALL_DIR} || true

pushd ${BUILD_DIR}


cmake -DALLOW_DOWNLOADS=ON \
 -DUSE_GOOGLE_TEST_DEBIAN_PACKAGE=ON \
 -DUSE_SYSTEM_MONGOOSE=OFF \
 -DDCMTK_LIBRARIES=dcmjpls \
 -DORTHANC_ENABLE_LOGGING=1 \
 -DCMAKE_BUILD_TYPE=Debug \
 -DCMAKE_INSTALL_PREFIX="${INSTALL_DIR}" \
 -DUSE_SYSTEM_CURL="ON" \
   ~/orthanc

