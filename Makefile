PORT=27017
rsync:
	./build_mongodb.sh
	./run_mongodb.sh $(PORT)
	echo "Run ./open_fw.sh $(PORT)"
