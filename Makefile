DOCKER_IMAGE_VERSION_EN=asr-en:1.6
DOCKER_IMAGE_VERSION_FR=asr-fr:1.7
DOCKER_IMAGE_VERSION_DE=asr-de:1.7
SHELL:=/bin/bash


# Deploy cloud instances.
deploy-server:
	export ANSIBLE_DEBUG=1 && export ANSIBLE_VERBOSITY=4
	@echo "Deploying application"
	ansible-playbook -i inventory.ini templates/create-server.yml -vvvv

# Remove instances and volumes.
delete:
	@echo "Cleaning EC2 instance"
	export ANSIBLE_DEBUG=1 && export ANSIBLE_VERBOSITY=4
	ansible-playbook -i inventory.ini templates/remove-server.yml -vvvv
