.PHONY: base idris playground

base:
	packer build -force alpine.json

idris:
	packer build -force idris.json

playground: base idris


# [ EOF ]
