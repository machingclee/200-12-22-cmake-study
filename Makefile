ifeq '$(findstring ;,$(PATH))' ';'
  CONAN_FLAGS = -s compiler='Visual Studio' -s compiler.version=22 -s cppstd=20 --build missing
else
  CONAN_FLAGS = -s cppstd=17 --build missing
endif

dependency:
	cd build && cmake .. --graphviz=graph.dot && \
	dot -Tpng graph.dot -o ../dep_graph.png

prepare:
	rm -rf build
	mkdir build

prepare_conan:
	rm -rf build
	mkdir build
	cd build && conan install .. $(CONAN_FLAGS)
