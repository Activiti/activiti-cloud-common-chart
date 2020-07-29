CURRENT=$(pwd)
NAME := common
OS := $(shell uname)
VERSION := $(or $(VERSION), $(shell cat ../../VERSION))
GITHUB_CHARTS_REPO := "https://${GITHUB_TOKEN}@github.com/Activiti/activiti-cloud-helm-charts.git"
GITHUB_CHARTS_BRANCH := $(or $(GITHUB_CHARTS_BRANCH),gh-pages)

build: clean
	helm init --client-only
	helm repo add activiti-cloud-helm-charts https://activiti.github.io/activiti-cloud-helm-charts/
	helm repo add activiti-cloud-charts https://activiti.github.io/activiti-cloud-charts/
	
	helm dependency build
	helm lint

install:  build	
	helm install . --name ${NAME}

upgrade: clean build
	helm upgrade ${NAME} .

delete:
	helm delete --purge ${NAME}

clean:	
	rm -rf requirements.lock
	rm -rf charts
	rm -rf ${NAME}*.tgz

release: build
	helm package .	 

github:
	$(eval GITHUB_CHARTS_DIR := $(shell basename $(GITHUB_CHARTS_REPO) .git))
	rm -rf $$GITHUB_CHARTS_DIR || echo "try to remove $$GITHUB_CHARTS_DIR"	
	git clone -b "$(GITHUB_CHARTS_BRANCH)" "$(GITHUB_CHARTS_REPO)" $(GITHUB_CHARTS_DIR)	
	cp "$(NAME)-$(VERSION).tgz" $(GITHUB_CHARTS_DIR)
	cd $(GITHUB_CHARTS_DIR) && \
	   helm repo index . && \
	   git add . && \
	   git status && \
	   git commit -m "fix:(version) release $(NAME)-$(VERSION).tgz" && \
	   git pull && \
	   git push --force origin "$(GITHUB_CHARTS_BRANCH)"
	rm -rf $(GITHUB_CHARTS_DIR)

version:
	sed -i -e "s/version:.*/version: $(VERSION)/" Chart.yaml
	sed -i -e "s/tag: .*/tag: $(VERSION)/" values.yaml
tag:
	git add -u
	git commit -m "release $(VERSION)" --allow-empty # if first release then no verion update is performed
	git tag -fa v$(VERSION) -m "Release version $(VERSION)"
	git push -f -q https://${GITHUB_TOKEN}@github.com/Activiti/activiti-cloud-common-chart.git v$(VERSION)	

updatebot/push-version:
	cd ../../ && updatebot push-version --kind helm $(NAME) $(VERSION) ACTIVITI_CLOUD_COMMON_HELM_CHART $(VERSION)
