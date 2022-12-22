dependency:
	cd build && cmake .. --graphviz=graph.dot && \
	dot -Tpng graph.dot -o ../dep_graph.png
prepare:
	rm -rf build
	mkdir build