#!/usr/bin/env bash

trap remove_artifacts 1 2 3 6

# Pretty utils
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
POWDER_BLUE=$(tput setaf 153)
NORMAL=$(tput sgr0)

print_out() {
  printf "\n\n${POWDER_BLUE}----------------------------------------${NORMAL}"
  printf "\n\t ${POWDER_BLUE}$1${NORMAL}\n"
  printf "${POWDER_BLUE}----------------------------------------${NORMAL}\n\n"
}

remove_artifacts() {
    printf "\n${CYAN}Removing artifacts${NORMAL}\n"
    docker stop $(docker ps -a -q) && docker rm -v $(docker ps -a -q)
    docker rmi -f $(docker images -a -q)
    printf "\n${CYAN}Done.....${NORMAL}\n"
}

build_rails() {
    local id
    local rails_name=$1
    local hub_name="habu/"$rails_name""

    print_out "Building docker-"$rails_name""

    cd "$rails_name"

    # Build the docker image
    docker build -t "$rails_name" .
    # Get the id
    id="$(docker images -aqf reference="$rails_name")"
    # Tag the image
    docker tag "$id" "$hub_name":latest
    # Push to hub
    docker push "$hub_name"

    cd -
}

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
pushd $dir

build_rails "rails4"
build_rails "rails5"

popd
