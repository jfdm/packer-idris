.PHONY: base idris-v0.3.0 playground

base:
	packer build -force base-vm.json

idris-v0.3.0:
	packer build -force idris-v.0.3.0.json

playground: base idris-v0.3.0


# [ EOF ]
