
git clone --quiet https://gist.github.com/$1.git /in
mkdir -p /out/java /out/python /out/cpp /out/javac
protoc -I=/in --java_out=/out/java --cpp_out=/out/cpp --python_out=/out/python /in/*.proto
javac -g -cp /opt/protobuf-java/protobuf-java-2.6.1.jar -d /out/javac $(find /out/java -name "*.java")
tar c out
