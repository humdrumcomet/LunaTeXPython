mkdir extSrc                                        # Create the build directory for the shared
mkdir lunatexPython/bin                             # Libraries
cd extSrc                                           # Enter the build directory, and clone from
git clone https://github.com/bastibe/lunatic-python # the lunatic-python github page
cd lunatic-python
wget https://www.lua.org/ftp/lua-5.3.6.tar.gz       # Download a version of lua that matches the
tar -zvxf lua-5.3.6.tar.gz                          # the current luatex version
cd lua-5.3.6
patch -p1 < ../../../patches/luaSOpatch.patch       # Patch the lua make files to build the shared
make linux                                          # libraries then perform a local (as in no
make local                                          # writing to system directories)
cd ..
patch -p1 < ../../patches/lunaticLocalLua.patch     # Patch the lunatic-python cmake files to
cmake .                                             # look for python 3.x and use the local lua
make
cp bin/python.so ../../lunatexPython/bin/           # copy over the shared libraries to the installation
cp bin/lua.so ../../lunatexPython/bin/              # folder
cd ../..
rm -rf extSrc                                       # clean up (delete) the downloaded lua and 
                                                    # lunatic-python folders
