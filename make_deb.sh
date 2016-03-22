mkdir -p build || exit 1
cd build
echo "g2o: A General Framework for Graph Optimization" > description-pak
cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr || exit 1
sudo checkinstall -D \
     --nodoc \
     --delspec \
     --deldesc \
     --pkgname rclibg2o \
     --pkggroup "devel" \
     --exclude '/home' \
     --pkgversion="`git tag|grep -o [0-9.-]*|tail -n1`" \
     --pkglicense="BSD/LGPL3+/GPL3+" \
     --maintainer='Felix Endres \<felix.endres@roboception.de\>' \
     --requires='libc6 \(\>= 2.14\),libcamd2.3.1,libcholmod2.1.2,libcxsparse3.1.2,libgcc1 \(\>= 1:4.1.1\),libgl1-mesa-glx \| libgl1,libglu1-mesa \| libglu1,libstdc++6 \(\>= 4.6\),libboost-all-dev,libeigen3-dev,libgl1-mesa-dev,libglu1-mesa-dev,libsuitesparse-lgpl' \
     --provides=""  \
     --conflicts="ros-indigo-libg2o" \
     --replaces=""  \
     nice make install -j4



