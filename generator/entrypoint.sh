
IN=/in/$1
OUT=/out/$1
mkdir -p /in $OUT/java $OUT/python $OUT/cpp $OUT/go $OUT/javac

git clone --quiet https://gist.github.com/$1.git $IN

protoc -I=$IN \
 --go_out=$OUT/go \
 --cpp_out=$OUT/cpp \
 --java_out=$OUT/java \
 --python_out=$OUT/python \
 $IN/*.proto

javac -g -cp /usr/local/protobuf-java-2.6.1.jar -d $OUT/javac \
  $(find $OUT/java -name "*.java")
