# protohub
## generator
Use the protohub generator to clone your gists and output it into a tar with the protoc output.
###usage
`docker run leomuller/protohub <GIST> > <FILE_NAME>.tar`
###example
```bash
docker run leomuller/protohub deb719392eb97004ccf9 > out.tar
tar tvf out.tar
````
