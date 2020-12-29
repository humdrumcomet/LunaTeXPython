cd ..
mkdir bin
cd bin
git clone https://github.com/bastibe/lunatic-python
cd lunatic-python
wget https://www.lua.org/ftp/lua-5.3.6.tar.gz
tar -zvxf lua-5.3.6.tar.gz
cd lua-5.3.6
patch -p1 < ../../../lunatexPython/luaSOpatch.patch
make linux
make local
cd ..
patch -p1 < ../../lunatexPython/lunaticLocalLua.patch
cmake .
make
cp bin/python.so ../../lunatexPython/
cp bin/lua.so ../../lunatexPython/
